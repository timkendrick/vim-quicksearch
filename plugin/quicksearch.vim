nnoremap <silent> <Plug>QuicksearchPopulate :<C-u>call <SID>PopulateSearchRegisterFromCurrentWord()<CR>:<C-u>setlocal hlsearch<CR>:echo "/" . @/<CR>
xnoremap <silent> <Plug>QuicksearchPopulate :<C-u>call <SID>PopulateSearchRegisterFromVisualSelection()<CR>:<C-u>setlocal hlsearch<CR>:<C-u>normal! gv<CR>
nnoremap <Plug>QuicksearchSubstitute :%s/<C-r>///g<Left><Left>
xnoremap <Plug>QuicksearchSubstitute :<C-u><C-r>=(visualmode() == "v" ? "%" : "'<,'>")<CR>s/<C-r>///g<Left><Left>

" Enable * and # keys in visual mode
xnoremap <silent> * :<C-u>call <SID>PopulateSearchRegisterFromVisualSelection()<CR>:<C-u>normal! /<C-r>=@/<CR><C-v><CR><CR>
xnoremap <silent> # :<C-u>call <SID>PopulateSearchRegisterFromVisualSelection()<CR>:<C-u>normal! ?<C-r>=@/<CR><C-v><CR><CR>

" Reuse flags when repeating last substitution
nnoremap & :&&<CR>
xnoremap & :&&<CR>

function! s:PopulateSearchRegisterFromCurrentWord()
	let existing_register_value = @0
	normal! "0yiw
	let @/ = '\<' . @0 . '\>'
	let @0 = existing_register_value
endfunction

function! s:PopulateSearchRegisterFromVisualSelection()
	let existing_register_value = @0
	normal! "0gvy
	let @/ = '\V' . s:escapeSearchString(@0)
	let @0 = existing_register_value
endfunction

function! s:escapeSearchString(string)
	return substitute(escape(a:string, '/\'), '\n', '\\n', 'g')
endfunction
