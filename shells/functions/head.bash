head () {
         mapfile -tn "$1" line < "$2"
         printf '%s\n' "${line[@]}"
        }
