augroup django
    autocmd!
    autocmd BufNewFile,BufRead urls.py           setlocal nowrap
    autocmd BufNewFile,BufRead urls.py           normal! zR
    autocmd BufNewFile,BufRead dashboard.py      normal! zR
    autocmd BufNewFile,BufRead local_settings.py normal! zR

    autocmd BufNewFile,BufRead admin.py             setlocal filetype=python.django
    autocmd BufNewFile,BufRead urls.py              setlocal filetype=python.django
    autocmd BufNewFile,BufRead models.py            setlocal filetype=python.django
    autocmd BufNewFile,BufRead views.py             setlocal filetype=python.django
    autocmd BufNewFile,BufRead settings.py          setlocal filetype=python.django
    autocmd BufNewFile,BufRead forms.py             setlocal filetype=python.django
    autocmd BufNewFile,BufRead common_settings.py   setlocal filetype=python.django
augroup end
