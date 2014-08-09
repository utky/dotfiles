if exists("b:did_haskell_ftplugin")
  finish
endif
let b:did_haskell_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal omnifunc=necoghc#omnifunc

let maplocalleader='\'
nnoremap <buffer> <LocalLeader>t :<C-u>GhcModType<CR>
nnoremap <buffer> <LocalLeader>T :<C-u>GhcModTypeInsert<CR>
nnoremap <buffer> <LocalLeader>c :<C-u>GhcModCheckAsync<CR>
nnoremap <buffer> <LocalLeader>q :<C-u>GhcModTypeClear<CR>
nnoremap <buffer> <LocalLeader>i :<C-u>GhcModInfo<CR>

augroup Haskell
    autocmd!
    autocmd BufWritePost <buffer> GhcModCheckAsync
    autocmd BufEnter <buffer> call s:setup_ghcmod()
augroup END

function! s:setup_ghcmod()
  
  " Add '-nocode' for performance
  let b:ghcmod_ghc_options = ['-nocode', '-fdefer-type-errors']
  

  " Setup src and test directories
  let src_dir = finddir('src', '.;')
  if !empty(src_dir)
    let b:ghcmod_use_basedir = fnamemodify(src_dir . '/..', ':p')
    call add(b:ghcmod_ghc_options, '-i' . fnamemodify(src_dir, ':p'))
  endif
  let test_dir = finddir('test', '.;')
  if !empty(test_dir)
    call add(b:ghcmod_ghc_options, '-i' . fnamemodify(test_dir, ':p'))
  endif
  let dist_dir = finddir('dist', '.;')
  if !empty(dist_dir)
    call add(b:ghcmod_ghc_options, '-i' . fnamemodify(dist_dir, ':p') . 'build/autogen/')
  endif
  " Setup package configuration folder
  let ghc_dir = finddir('.ghc', '.;')
  if !empty(ghc_dir)
    call add(b:ghcmod_ghc_options, '-package-conf=' . expand(fnamemodify(ghc_dir, ':p') . '**/package.conf.d/'))
  endif
  " Support for cabal 1.0.18+ sandbox
  let cabal_sandbox_dir = finddir('.cabal-sandbox', '.;')
  if !empty(cabal_sandbox_dir)
    " Setup cabal sandbox package configuration folder
    let cabal_sandbox_packages_dir = expand(fnamemodify(sort(split(globpath(cabal_sandbox_dir, '*-packages.conf.d'), '\n'))[-1], ':p'))
    call add(b:ghcmod_ghc_options, '-package-db=' . cabal_sandbox_packages_dir)
    " Force individual cabal packages
    let cabal_sandbox_packages = split(globpath(cabal_sandbox_packages_dir, '*.conf'), '\n')
    for package_conf in cabal_sandbox_packages
      let package = fnamemodify(package_conf, ':t')[:-6] " Remove '.conf'
      call add(b:ghcmod_ghc_options, '-package-id=' . package)
    endfor
  endif
  " Support for cabal-dev sandbox (deprecated)
  let cabal_dev_dir = finddir('cabal-dev', '.;')
  if !empty(cabal_dev_dir)
    " Setup cabal_dev package configuration folder
    let cabal_dev_packages_dir = expand(fnamemodify(sort(split(globpath(cabal_dev_dir, 'packages-*.conf'), '\n'))[-1], ':p'))
    call add(b:ghcmod_ghc_options, '-package-db=' . cabal_dev_packages_dir)
    " Force individual cabal packages
    let cabal_dev_packages = split(globpath(cabal_dev_packages_dir, '*.conf'), '\n')
    for package_conf in cabal_dev_packages
      let package = fnamemodify(package_conf, ':t')[:-6] " Remove '.conf'
      call add(b:ghcmod_ghc_options, '-package-id=' . package)
    endfor
  endif
endfunction

let &cpo = s:cpo_save
unlet s:cpo_save

