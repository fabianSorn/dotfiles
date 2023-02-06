local os = require "fs.utils.os"

if os.in_windows() then
    vim.opt.shell = "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
    vim.opt.shellcmdflag = "-c"
end