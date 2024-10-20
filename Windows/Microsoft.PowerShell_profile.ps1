#Aliases
Set-Alias vi nvim
Set-Alias vim nvim
Set-Alias make mingw32-make
Set-Alias pwshRC pathToPwshProfile

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

#PSReadLine
Import-Module PSReadLine
Set-PSReadlineOption -EditMode Emacs
Set-PSReadLineKeyHandler -key Tab -Function Complete
Set-PSReadLineOption -PredictionViewStyle ListView
