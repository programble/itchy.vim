" Itchy: Scratch buffers for Vim
" 
" Author: Curtis McEnroe
" Version: 0.1.0
" Date: February 2 2012
" License: ISC

if exists('g:itchy_loaded') || &cp
  finish
endif
let g:itchy_loaded = 1

if !exists('g:itchy_buffer_prefix')
  let g:itchy_buffer_prefix = 'Scratch-'
endif
if !exists('g:itchy_buffer_suffix')
  let g:itchy_buffer_suffix = ''
endif

let s:buffer_number = 1

function! s:new_buffer(...)
  if a:0 == 0
    let buffer_name = g:itchy_buffer_prefix . s:buffer_number . g:itchy_buffer_suffix
    let s:buffer_number += 1
  else
    let buffer_name = g:itchy_buffer_prefix . a:1 . g:itchy_buffer_suffix
  endif

  if &modified
    exe "new " . buffer_name
  else
    exe "edit " . buffer_name
  endif

  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  setlocal buflisted
endfunction

command! -nargs=? Scratch call s:new_buffer(<f-args>)
