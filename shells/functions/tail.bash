tail() {
        mapfile -tn 0 line < "$2"
        printf '%s\n' "${line[@]: -$1}"
       }
