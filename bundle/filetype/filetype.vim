if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.txt      setfiletype txt
    au! BufRead,BufNewFile *.tex      setfiletype tex
    au! BufRead,BufNewFile *.csv      setfiletype csv
augroup END
