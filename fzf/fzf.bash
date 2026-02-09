fzf() {
    local selection
    selection=$(command fzf -i \
                            --cycle \
                            --border=double \
                            --border-label=" SEARCH " \
                            --no-scrollbar \
                            --prompt='>> ' \
                            --pointer='👉' \
                            --marker='# ' \
                            --tabstop=2 \
                            --color='fg:240,preview-fg:197,bg:16,preview-bg:16,hl:197,fg+:197,bg+:16,gutter:16,hl+:197,query:197,info:240,border:197,separator:197,scrollbar:16,label:255,preview-label:255,prompt:197,pointer:197,marker:197,header:197' \
                            --history="$HOME/.cache/fzf/history" \
                            --preview-window=right:61% \
                            --preview '
                             MIME=$(file --mime-type -b {})
                       case "$MIME" in
                                text/*) batcat --color=always --line-range=:500 {} ;;
                                 audio/*) echo "" && exiftool -Title {} && echo "" && exiftool -Duration -Artist {} && echo "========================================"  && ffmpeg -hide_banner -loglevel error -i {} -map 0:v -c copy -f image2pipe - 2>/dev/null | chafa -s ${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES} --format=symbols --colors=truecolor - ;;
                                image/*) chafa -s ${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES} --format=symbols --colors=truecolor {} ;;
                               application/pdf) real_path=$(realpath "{}") && mutool draw -F txt -o - "$real_path" | batcat --color=always --plain --line-range=:500 ;;
                               video/*) ffmpeg -itsoffset -1 -i {} -vframes 1 -f image2pipe -vcodec png - 2>/dev/null | chafa -s ${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES} --format=symbols --colors=truecolor - ;;
                               *) echo "Bestandstype: $MIME" ;;
                       esac' "$@")

    # Stop als er niets is geselecteerd (ESC)
    [ -z "$selection" ] && return

    # Check het bestandstype voor de juiste actie
    local mimetype
    mimetype=$(file --mime-type -b "$selection")
    echo "DEBUG: Detected mimetype: $mimetype" # Debug statement

    case "$mimetype" in
        application/pdf)
            zathura "$selection" & disown ;;
        video/*)
            mpv "$selection" & disown ;;
        audio/mpeg|audio/wav|audio/ogg|audio/flac|audio/aac|audio/*)
            mpv "$selection" & disown ;;
        image/*)
            sxiv -a "$selection" & disown ;;
        *)
            nvim "$selection" ;;
    esac
}
