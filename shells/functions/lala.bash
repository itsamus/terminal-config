fzf() {
    local selection
        local colors="fg:240,preview-fg:197,bg:16,preview-bg:16,hl:197,fg+:197,header:197,"
            colors+="bg+:16,gutter:16,hl+:197,query:197,info:240,border:197,marker:197,"
            colors+="separator:197,scrollbar:16,label:255,preview-label:255,prompt:197,pointer:197"

    selection=$(command fzf -i \
        --cycle \
        --tabstop=2 \
        --marker='# ' \
        --prompt='>> ' \
        --no-scrollbar \
        --pointer='👉' \
        --border=double \
        --border-label=" SEARCH " \
        --preview-window=right:61% \
        --history="$HOME/.cache/fzf/history" \
       --color="$colors")
}
