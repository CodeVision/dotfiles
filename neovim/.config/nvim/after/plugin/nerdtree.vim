" NERDTree
call NERDTreeAddKeyMap({
       \ 'key': '<CR>',
       \ 'callback': 'NERDTreeEnterHandler',
       \ 'quickhelpText': 'open file and close nerdtree',
       \ 'scope': 'FileNode' })

function! NERDTreeEnterHandler(filenode)
    call a:filenode.activate({ 'where': 'p'})
    call g:NERDTree.Close()
endfunction
