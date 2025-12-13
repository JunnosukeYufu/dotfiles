vim.g.clipboard = {
  name = "win32-portable",
  copy = {
    ["+"] = "/mnt/c/Windows/System32/clip.exe",
    ["*"] = "/mnt/c/Windows/System32/clip.exe",
  },
  paste = {
    ["+"] = "/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -command Get-Clipboard",
    ["*"] = "/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -command Get-Clipboard",
  },
  cache_enabled = 0,
}
