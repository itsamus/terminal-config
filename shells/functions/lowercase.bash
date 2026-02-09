lowercase () {
              printf '%s\n' "${1,,}"
             }

#  **Example Usage:**
#
#  ```shell
#  $ lower "HELLO"
#  hello
#
#  $ lower "HeLlO"
#  hello
#
#  $ lower "hello"
#  hello
