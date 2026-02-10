## 收集各类 WebShell 服务端 

https://github.com/0x7556/webshell

### WebShell服务端 
- [金刚狼Wolfshell](wolfshell): aspx、ashx、内存马各1个脚本，AI免杀50个[ASPX](wolfshell/aspx)、50个[ASHX](wolfshell/ashx)、10个[MEM](wolfshell/mem)内存马
- [哥斯拉Godzilla](godzilla): AI免杀20个[PHP](godzilla/php),20个[JSP](godzilla/jsp),20个[ASP](godzilla/asp),20个[ASPX](godzilla/aspx)
- [菜刀Chopper](chopper): AI免杀菜刀30个[ASP](chopper/asp)，6个[PHP](chopper/php)，其它WebShell工具通用可连。

  
* Shell密码: WolfShell或wolfshell

### 加入星球

* 为了防止滥用被杀太快，github仅公开部份WebShell，截至2026年1月29日，星球已提供237+金刚狼变种
* [批量检测金刚狼webshell有效性工具](wolfshell/check) AI免杀生成的不一定能用，需工具批量验证
  
### AI一键免杀智能体工具

免杀效果：https://mp.weixin.qq.com/s/Yhl-wLNca-vgO3eFZXF-Uw

CodeBypass 是一款基于 AI 的免杀工具，旨在通过智能变异与语义重构，提高后门脚本在静态与行为检测中的通过率。主要功能与优势如下：

#### 主要能力
- **多语言支持**：快速处理常见 webshell 格式（PHP、JSP、ASP、ASPX 等）。
- **智能变异**：自动调整代码结构、函数命名与语句顺序，以规避特征签名检测，同时保持原有功能。
- **语义保持**：重写过程中保留逻辑与功能完整性，尽量减少变异导致的失效风险。
- **多样化策略**：结合混淆、重构、伪装与插入无害代码等多种策略，提高跨引擎的检测通过率。
- **快速迭代**：批量生成候选样本并配合检测反馈，快速筛选出高通过率版本。
- **适应性学习**：基于检测结果持续优化生成策略，增强对新签名与规则的应对能力。
- **降低人工成本**：自动化免杀流程，减少手动调试与试错时间。



### WebShell客户端-管理工具
- 金刚狼WolfShell: https://github.com/0x7556/wolfshell
- 哥斯拉Godzilla: https://github.com/BeichenDream/Godzilla
- 冰蝎Behinder：https://github.com/rebeyond/Behinder

### 服务端 vs. 控制端 — 简明科普

经常看到很多人把“服务端”和“控制端”搞混，这里简明解释一下。

- **服务端（WebShell）**：像餐厅里的服务员，负责接收请求并给出响应。它提供功能、处理数据并返回结果。对于远控（RAT/C2）来说，服务端就是那种部署在受害机器上的后门程序——它长期驻留、等待指令，执行攻击者下发的命令。
- **控制端（客户端）**：像点餐的顾客，发出请求或下达指令，等待服务端响应并展示或使用结果。人类操作者通过控制端发送命令并查看执行结果。

同理适用于远控/RAT/C2：有人把 C2 的客户端写成“服务端”的样子，导致混淆。判断的核心在于“谁在发起指令、谁在被动等待并执行”：发起指令的是控制端，处于被动、等待并执行命令的一方是服务端（通常称为后门或马）。这才是更直观、不会混淆的理解方式。


### 注意事项
- 本工具涉及的技术可能被用于恶意目的。请确保在合法、合规与授权的范围内使用，例如用于安全测试、研究或红队演练，遵守相关法律法规与组织政策。

  
