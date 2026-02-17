
    lsa() {
        if [ "$PWD" = "$HOME" ]; then
            LC_COLLATE=C eza -A --follow-symlinks --color=always --icons=always --group-directories-first --no-filesize --no-user --no-time --ignore-glob=".librewolf|.languages|.gemini|.cache|.config|.local|.scripts|.git"
        elif [ "$PWD" = "$HOME/.config" ]; then
            LC_COLLATE=C eza -A --follow-symlinks --color=always --icons=always --group-directories-first --no-filesize --no-user --no-time
        else
            LC_COLLATE=C eza -AlT --level=2 --follow-symlinks --color=always --icons=always --group-directories-last --no-filesize --no-user --no-time
        fi
    }

