function ZelharBackup()
    if !exists('g:mybackupdir')
        let g:mybackupdir = getcwd()
    endif
    if !exists('g:myfileslist')
        let g:myfileslist = '0'
    endif
    "pyfile vimBackup01.py
    "pyfile $HOME/.vim/plugin/zelhar-backup/testpyscript00.py
    "pyfile $HOME/.vim/plugin/zelhar-backup/vimBackup01.py
    "pyfile $HOME/.config/nvim/**/plugin/zelhar-backup/vimBackup01.py
    "py3file $HOME/.config/nvim/**/plugin/zelhar-backup/vimBackup02.py
    "py3file $HOME/.config/nvim/**/plugin/zelhar-backup/vimBackup03.py
    py3file $HOME/.config/nvim/**/plugin/zelhar-backup/vimBackup.py
endfunction
"
"autocmd BufWrite,FileWritePost * :call ZelharBackup()
let g:toggle_zelhar_backup = 1

augroup ZelharBak
    au!
    autocmd BufWritePost * :call ZelharBackup()
augroup END


function ToggleZelharBackup()
    if g:toggle_zelhar_backup "before call it was ON
        let g:toggle_zelhar_backup = 0
        autocmd! ZelharBak BufWritePost *
    else
        let g:toggle_zelhar_backup = 1 "it was OFF so toggle it on
        autocmd ZelharBak BufWritePost * :call ZelharBackup()
    endif
endfunction

function TurnOnZelharBackup()
    if g:toggle_zelhar_backup == 0 "before call it was OFF
        let g:toggle_zelhar_backup = 1
        autocmd ZelharBak BufWritePost * :call ZelharBackup()
    endif
endfunction

function TurnOffZelharBackup()
    if g:toggle_zelhar_backup "before call it was ON
        let g:toggle_zelhar_backup = 0
        autocmd! ZelharBak BufWritePost *
    endif
endfunction

command -nargs=0 ToggleZelharBackup call ToggleZelharBackup()
command -nargs=0 TurnOnZelharBackup call TurnOnZelharBackup()
command -nargs=0 TurnOffZelharBackup call TurnOffZelharBackup()
