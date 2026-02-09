 help() {
        "$@" --help 2>&1 | bat --paging=never --plain --language=help
        }
