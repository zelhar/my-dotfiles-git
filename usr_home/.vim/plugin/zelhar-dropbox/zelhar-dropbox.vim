let g:zelhar_dropbox_dir=expand($HOME).'/.config/nvim/plugin/zelhar-dropbox'
function ZelharDropBoxCurrentFile()
    let my_file=expand("%:p")
    let my_line="! ".g:zelhar_dropbox_dir."/Dropbox-Uploader/dropbox_uploader.sh"
    let my_line .= " upload ".my_file." /my_testing_dir/"
    execute my_line
endfunction

command ZelharDropBoxCurrentFile call ZelharDropBoxCurrentFile()
