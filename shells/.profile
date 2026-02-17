
##                                                       __ _ _
##                                      _ __  _ __ ___  / _(_) | ___
##                                     | '_ \| '__/ _ \| |_| | |/ _ \
##                                    _| |_) | | | (_) |  _| | |  __/
##                                   (_) .__/|_|  \___/|_| |_|_|\___|
##                                     |_|
##  ===============================================================================================
#   TITLE : .profile
#   ABOUT : enviorment for the session. (login)
#   LINKS : -
#   FILES : -
#   TAGS  : #system #enviorment #shell
##  ===============================================================================================

    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_STATE_HOME="$HOME/.local/state"
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_CONFIG_DIRS="/etc/xdg"
    export XDG_RUNTIME_DIR="/run/user/1000"
    export XDG_SCRIPTS="$HOME/.scripts"
    export XDG_LANGUAGES="$HOME/.languages"
    export XDG_SCRIPTS="$HOME/.scripts"

    # export XAUTHORITY="$HOME/.config/x11/xauthority"
    export XINITRC="$HOME/.config/x11/xinitrc"
    export TMP="$HOME/.tmp"

    export ABOOK_DIR="$HOME/.config/abook"
    export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"
    export PASSWORD_STORE_DIR="$HOME/.config/password-store"
    export GNUPGHOME="$HOME/.config/gnupg"
    export GEMINI_MODEL="gemini-2.5-flash"
    export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
    export XCURSOR_THEME="Bibata-Modern-Ice"

    export TZ="Europe/Amsterdam"
    export HISTFILE="$XDG_CACHE_HOME/bash_history"

    export GH_TOKEN=$(pass github/token)
    export BROWSER=librewolf
    export EDITOR=nvim
    export COLORTERM=truecolor

    export PERL_MM_OPT="INSTALL_BASE=$HOME/perl_modules"
    export PERL_MB_OPT="--install_base '$HOME/perl_modules'"
    export PERL5LIB="$HOME/perl_modules/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
    export PATH="$HOME/perl_modules/bin${PATH:+:${PATH}}"
    eval "$(luarocks path --bin)"
    export CARGO_HOME="$HOME/.languages/.cargo"
    export npm_config_cache="$HOME/.cache/npm"
    export RUSTUP_HOME="$HOME/.languages/.cargo"
    export NPM_DIR="$HOME/.config/npm"
    export NVM_DIR="$HOME/.config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

 ##   eval "$(dircolors ~/.config/.dircolors)"  # # # # # # # # # # # # # # # # # # # # # #
##    export EZA_COLORS="vi=38;5;93:im=38;5;226:bO=38;5;16;48;5;196:lp=38;5;201:da=38;5;204:gi=38;5;196:gd=38;5;16;48;5;196:gm=38;5;46:ga=38;5;46:gR=38;5;16;48;5;196:gu=38;5;240:uR=38;5;16;48;5;196:uu=38;5;240:ut=38;5;240:ug=38;5;240:um=38;5;240:uk=38;5;240:ub=38;5;240:um=38;5;240:sb=38;5;240:nt=38;5;240:ng=38;5;240:nm=38;5;240:nk=38;5;240:nb=38;5;240:sn=38;5;240:tx=38;5;196:tw=38;5;246:tr=38;5;240:gx=38;5;196:gw=38;5;246:gr=38;5;240:ue=38;5;196:ux=38;5;196:uw=38;5;246:ur=38;5;240:or=38;5;16;48;5;196:ln=38;5;201:bd=38;5;16;48;5;130:fi=38;5;240:ex=38;5;46:di=38;5;27"

    export NVM_DIR="$HOME/.config/nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

    # Haal commando's op voor de interactieve non-login shells.
    if [ -f $HOME/.config/shells/bash/.bashrc ]; then
        . $HOME/.config/shells/bash/.bashrc
    fi
    ##  if [ -f $HOME/.config/shells/zsh/.zshrc ]; then
    ##      . $HOME/.config/shells/zsh/.zshrc
    ##  fi
    export CROSTINI_SKIP_ADMIN_CHECK=1
    # . "$HOME/.cargo/env"

#    FD_OPTIONS="--follow --hidden"

#    export FZF_DEFAULT_OPS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview-'[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2>/dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy)'"

#    export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type l $FD_OPTIONS"
export EZA_COLORS="di=3;38;5;21:ex=38;5;46:fi=38;5;250:ln=3;38;5;165:or=1;38;5;16;48;5;197:ur=38;5;240:uw=38;5;250:ux=38;5;196:ue=38;5;196:gr=38;5;240:gw=38;5;250:gx=38;5;196:tr=38;5;240:tw=38;5;250:tx=38;5;196:lp=38;5;201"


