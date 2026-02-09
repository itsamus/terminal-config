
countfiles() {
    local files=(./*)         # Usage: count /path/to/dir/*
    printf '%s\n' "${#files[@]}"     #        count /path/to/dir/*/
        }

#  **Example Usage:**
#
#  # Count all files in dir.
#  $ count ~/Downloads/*
#  232
#
#  # Count all dirs in dir.
#  $ count ~/Downloads/*/
#  45
#
#  # Count all jpg files in dir.
#  $ count ~/Pictures/*.jpg
#  64

