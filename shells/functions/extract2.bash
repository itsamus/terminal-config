# #  function extract() {
#                     if [ -f $1 ] ; then
#                     case $1 in
#                               *.Z)         uncompress $1 ;;
#                               *.tar.bz2)   tar xjf $1    ;;
#                               *.tar.gz)    tar xzf $1    ;;
#                               *.tbz2)      tar xjf $1    ;;
#                               *.bz2)       bunzip2 $1    ;;
#                               *.rar)       unrar x $1    ;;
#                               *.tgz)       tar xzf $14    ;;
#                               *.gz)        gunzip $1     ;;
