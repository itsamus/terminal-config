
    lsa() {
        if [ "$PWD" = "$HOME" ]; then
                LC_COLLATE=C eza -A --grid --group-directories-first --color=auto --icons=auto --ignore-glob=".librewolf|.languages|.gemini|.cache|.config|.local|.scripts|.git"
            else
                LC_COLLATE=C eza -A --grid --group-directories-first --color=auto --icons=auto
        fi
    }

