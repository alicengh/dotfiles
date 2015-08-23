" Maintainer:  Nishikata Hijiri

""" My vim faster editation cmd """
nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR>
            \ :source $MYVIMRC<CR>

cmap w!! w !sudo tee > /dev/null %

""" Manage plural fils """
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [B :bfirst<CR>

nnoremap <silent> mn :next<CR>
nnoremap <silent> mp :prev<CR>

""" Tab motion """
nnoremap <silent> te :tabedit<CR>
nnoremap <silent> tc :tabclose<CR>


""" Motion commands """
imap <C-a> <Esc>0i
imap <C-e> <Esc>$i<Right>
imap <C-v> <Esc>p

""" END mapping.vim """
