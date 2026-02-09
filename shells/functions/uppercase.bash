
#   example ussage:

#           shell
#       $ uppercase "hello, world!"
#           HELLO, WORLD!

    uppercase () {
        printf '%s\n' "${1^^}"
    }

