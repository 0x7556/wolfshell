import os
import subprocess
from typing import Optional
from mcp.server.fastmcp import FastMCP
# https://github.com/0x7556/wolfshell
# Instantiate FastMCP with the project name "WolfShell"
mcp = FastMCP("WolfShell MCP 1.0")

@mcp.tool()
def WolfShell(shell_url: str, password: str, command: str) -> str:
    """
    Executes a command on a remote web shell using wshell.exe (also known as WolfShell or "金刚狼").
    This tool should be used when the user mentions wshell, wolfshell, or "金刚狼" to connect to a given web shell.
    The default connection password for this tool is 'WolfShell'.
    The web shell URL can have extensions like .aspx, .ashx, .asmx, or it can be any other valid URL.
    IMPORTANT: If the user input consists of a URL followed by a string (e.g., 'http://192.168.1.11/aspx/w_var.aspx Baewr23sdf'),
    it should be parsed as the shell_url and password arguments respectively.

    :param shell_url: The URL of the web shell (e.g., http://192.168.1.11/w.aspx).
    :param password: The password for the web shell. The default password is 'WolfShell'.
    :param command: The command to execute on the remote shell (e.g., "net user").
    :return: A string containing the output from the command execution, or an error message.
    """
    # Get the path of wshell.exe from the "wolfshell" environment variable
    wshell_exe_path = 'C:\Users\Administrator\Downloads\wolfshell-main\wshell.exe'
    if not wshell_exe_path:
        return "The 'wolfshell' environment variable is not set. Please set it to the full path of wshell.exe."

    # Check if the wshell.exe file exists
    if not os.path.exists(wshell_exe_path):
        return f"wshell.exe not found at the path specified by the 'wolfshell' environment variable: {wshell_exe_path}"

    # Build the list of command arguments
    cmd_args = [wshell_exe_path, shell_url, password, command]
    
    try:
        # Execute the command, setting the working directory to the executable's directory.
        # capture_output=True captures stdout and stderr.
        # text=True decodes the output as text.
        # check=False prevents raising an exception on a non-zero exit code, allowing manual handling.
        result = subprocess.run(
            cmd_args,
            capture_output=True,
            text=True,
            check=False,
            cwd=os.path.dirname(wshell_exe_path)
        )

        # Combine stdout and stderr to mimic CombinedOutput
        output = result.stdout
        
        # If the command failed (non-zero exit code)
        if result.returncode != 0:
            return f"failed to execute wshell command with exit code {result.returncode}\nOutput:\n{output}"

        # Return the command's output
        return output

    except Exception as e:
        return f"An unexpected error occurred while trying to execute wshell: {e}"


if __name__ == "__main__":
    # Run the service in stdio mode
    mcp.run(transport='stdio')
