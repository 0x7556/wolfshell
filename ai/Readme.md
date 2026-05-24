# 金刚狼 AI Shell 人工智能渗透教程

## AI智能免杀 
使用AI兔杀金刚狼 WebShell 服务端
![aicode](img/aicode.png)

## AI智能渗透

    
 ### Cherry Studio MCP配置

 ```json
  "mcpServers": {
    "xf5pBIECy50rKmx53Gy7n": {
      "name": "WolfShellMCP",
      "type": "stdio",
      "description": "",
      "isActive": true,
      "command": "C:\\Users\\Administrator\\Downloads\\wolfshell-main\\WolfShellMCP.exe",
      "args": [],
      "env": {
        "WOLFSHELL_API_URL": "http://127.0.0.1:7556"
      }
    }
```

其它客户端同理，欢迎提交其它客户端配置代码

### 启动AI智能服务器API
点击金刚狼Shell工具标签“AI->MCP”,找到按钮“API MCP Server”
![img](https://github.com/0x7556/wolfshell/blob/main/img/ai/WolfShell_API.png)

### 1. AI通过金刚狼 Shell 执行 CMD 命令（使用 Shell 地址和密码）  

**示例提示词：**
- 使用金刚狼 http://192.168.1.11/wolf.aspx WolfShell 执行 CMD 命令：whoami  
- 使用金刚狼 http://192.168.1.11/wolf.aspx WolfShell 执行 CMD 命令：查看系统信息

![img](https://github.com/0x7556/wolfshell/blob/main/img/ai/WolfShellMcpCmd.png)



### 2. AI通过金刚狼客户端预配置的 ID 执行 CMD 命令  
**示例提示词：**
- 使用金刚狼 ID 为 3 的 Shell 执行 CMD 命令：查看当前用户

![img](https://github.com/0x7556/wolfshell/blob/main/img/ai/WolfShellMcpCmdID.png)



### 3. AI通过金刚狼 Shell 执行 PowerShell 命令（使用 Shell 地址和密码）  
**示例提示词：**
- 使用金刚狼 http://192.168.1.11/wolf.aspx WolfShell 执行 PowerShell 命令：whoami  
- 使用金刚狼 http://192.168.1.11/wolf.aspx WolfShell 执行 PowerShell 命令：查看系统信息

![img](https://github.com/0x7556/wolfshell/blob/main/img/ai/WolfShellMcpCmdWhoami.png)

### 4. AI通过金刚狼客户端预配置的 ID 执行 PowerShell 命令  
**示例提示词：**
- 使用金刚狼 ID 为 9 的 Shell 执行 PowerShell 命令：ipconfig  
- 使用金刚狼 ID 为 9 的 Shell 执行 PowerShell 命令：查看当前 IP

![img](https://github.com/0x7556/wolfshell/blob/main/img/ai/WolfShellMcpPS1.png)
