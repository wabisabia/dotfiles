function! Cargoadd(args)
	call inputsave()
	let name = trim(input('Dependency to add: '))
	call inputrestore()
	if empty(name)
		return
	endif
	call cargo#cmd("add " . name . a:args)
	call coc#rpc#request('rust-analyzer.reloadWorkspace', [])
endfunction

command! -nargs=* Cadd call Cargoadd(<q-args>)

