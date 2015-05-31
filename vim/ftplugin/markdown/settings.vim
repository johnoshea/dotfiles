call pencil#init()
\ | call lexical#init()
\ | call litecorrect#init()
\ | call textobj#quote#init()
\ | call textobj#sentence#init()

let g:lexical#thesaurus_key = '<leader>t'
let g:airline_section_x = '%{PencilMode()}'
