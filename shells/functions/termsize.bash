
termsize () {
             shopt -s checkwinsize; (:;:)
             printf '%s\n' "$LINES $COLUMNS"
            }
#  **Example Usage:**
#  # Output: LINES COLUMNS
#  $ termsize
#  15 55

