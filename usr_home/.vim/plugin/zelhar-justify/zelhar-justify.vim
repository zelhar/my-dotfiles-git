function ZelharJustify(width) range
    let g:my_first_line = a:firstline
    let g:my_last_line = a:lastline
    if a:width == ''
        let g:my_justify_width = 72
    else
        let g:my_justify_width = a:width
    endif
    py3file $HOME/.config/nvim/**/plugin/zelhar-justify/zelhar-justify.py
endfunction

function Get_range() range
    let g:my_first_line = a:firstline
    let g:my_last_line = a:lastline
endfunction

"example for function with range
function Count_words() range
  let lnum = a:firstline
  let n = 0
  while lnum <= a:lastline
	let n = n + len(split(getline(lnum)))
	let lnum = lnum + 1
  endwhile
  echo "found " . n . " words"
endfunction

"command -nargs=1 ZelharJustify call ZelharJustify(<f-args>)
vnoremap aq :call ZelharJustify(g:my_justify_width)<CR>

"default line width
let g:my_justify_width = 72
