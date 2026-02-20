
    removedups () {
        declare -A tmp_array

        while IFS= read -r line; do
            [[ $line ]] && tmp_array["$line"]=1
        done < "$1"

        printf '%s\n' "${!tmp_array[@]}"
    }

