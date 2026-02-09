
    fzf() {
        local selection
        selection=$(command fzf -i \
    		--cycle \
    		--tabstop=2 \
            --marker='# ' \
            --no-scrollbar \
            --prompt='>> ' \
            --pointer='👉' \
    		--border=double \
    		--border-label=" SEARCH " \
    		--preview-window=right:61% \
            --history="$HOME/.cache/fzf/history" \
    		--color='fg:240,preview-fg:197,bg:16,preview-bg:16,hl:197,fg+:197,bg+:16,gutter:16,hl+:197,query:197,info:240,border:197,separator:197,scrollbar:16,label:255,preview-label:255,prompt:197,pointer:197,marker:197,header:197' \
            --preview '
    			MIME=$(file --mime-type -b {})
                case "$MIME" in
    				text/*) batcat --color=always --line-range=:500 {} ;;
                    audio/*) echo "" && exiftool -Title {} && echo "" && exiftool -Duration -Artist {} && echo "========================================"  && ffmpeg -hide_banner -loglevel error -i {} -map 0:v -c copy -f image2pipe - 2>/dev/null | chafa -s ${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES} --format=symbols --colors=truecolor - ;;
                    image/*) chafa -s ${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES} --format=symbols --colors=truecolor {} ;;
                    application/pdf) pdftotext -layout {} - | head -n 500 ;;
                    video/*) ffmpeg -itsoffset -1 -i {} -vframes 1 -f image2pipe -vcodec png - 2>/dev/null | chafa -s ${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES} --format=symbols --colors=truecolor - ;;
    				*) echo "Bestandstype: $MIME" ;;
                esac' "$@")

    # Stop als er niets is geselecteerd (ESC)
    [ -z "$selection" ] && return

    # Check het bestandstype voor de juiste actie
    local mimetype
    mimetype=$(file --mime-type -b "$selection")
    case "$mimetype" in
        application/pdf)
    		zathura "$selection" & disown ;;
        video/*)
            mpv "$selection" & disown ;;
        audio/*)
            mpv "$selection" & disown ;;
        image/*)
            sxiv -a "$selection" & disown ;;
        *)
            nvim "$selection" ;;
    esac
    }


