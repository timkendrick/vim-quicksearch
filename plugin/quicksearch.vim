nnoremap <silent> <Plug>QuicksearchSetBuffer :<C-u>call <SID>PopulateSearchRegisterFromCurrentWord()<CR>:<C-u>setlocal hlsearch<CR>
xnoremap <silent> <Plug>QuicksearchSetBuffer :<C-u>call <SID>PopulateSearchRegisterFromVisualSelection()<CR>:<C-u>setlocal hlsearch<CR>:<C-u>normal! gv<CR>
xnoremap <silent> * :<C-u>call <SID>PopulateSearchRegisterFromVisualSelection()<CR>:<C-u>normal! /<C-r>=@/<CR><C-v><CR><CR>
xnoremap <silent> # :<C-u>call <SID>PopulateSearchRegisterFromVisualSelection()<CR>:<C-u>normal! ?<C-r>=@/<CR><C-v><CR><CR>

function! s:PopulateSearchRegisterFromCurrentWord()
	call s:PopulateSearchRegister('yiw')
endfunction

function! s:PopulateSearchRegisterFromVisualSelection()
	call s:PopulateSearchRegister('gvy')
endfunction

function! s:PopulateSearchRegister(command)
	let existing_register_value = @0
	execute 'normal! ' . a:command
	let @/ = '\V' . substitute(escape(@0, '/\'), '\n', '\\n', 'g')
	let @0 = existing_register_value
endfunction
