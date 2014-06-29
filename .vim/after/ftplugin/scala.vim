if exists("b:did_scala_ftplugin")
  finish
endif
let b:did_scala_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

setl tabstop=2
setl shiftwidth=2
setl expandtab

nnoremap <buffer> <LocalLeader>b :<C-u>VimShellInteractive --split="nicely" sbt<Cr>

let &cpo = s:cpo_save
unlet s:cpo_save


