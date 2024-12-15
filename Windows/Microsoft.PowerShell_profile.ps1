#Aliases
Set-Alias vi nvim
Set-Alias vim nvim
Set-Alias make mingw32-make
Set-Alias PWSHRC pathToPwshProfile
Set-Alias grep findstr
Set-Alias help Get-Help
Set-Alias -Name ".." -Value reverseDir
Set-Alias -Name "..." -Value reverseDir2
Set-Alias -Name "...." -Value reverseDir3
Set-Alias dc docker-compose

#Functions
function whereis ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}

function pathToPwshProfile {
    cd C:\Users\lfexp\Documents\Powershell\
}

function nvrc {
    nvim C:\Users\lfexp\AppData\Local\nvim\
}

function cp ($arg1, $arg2) {
    Copy-Item $arg1 -Destination $arg2
}

function cat ($filepath) {
    Get-Content -PATH $filepath | ForEach-Object { Write-Host $_}
}

function reverseDir {
    Set-Location ..
}

function reverseDir2 {
    Set-Location ../../
}

function reverseDir3 {
    Set-Location ../../../
}

function sPWSH {
    . $PROFILE
}

function q{exit}

#Prompt

#Classic
#oh-my-posh init pwsh | Invoke-Expression

#jandedobbe
# oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/clean-detailed.omp.json' | Invoke-Expression

#hul10
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/hul10.omp.json' | Invoke-Expression

#kushal
# oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/kushal.omp.json' | Invoke-Expression

#tokyonight
# oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/clean-detailed.omp.json' | Invoke-Expression


#Terminal-Icons
Import-Module Terminal-Icons

#Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

#PSReadLine
Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
Set-PSReadLineKeyHandler -key Tab -Function Complete
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
