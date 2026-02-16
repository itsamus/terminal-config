
##                                  _               _
##                                 | |__   __ _ ___| |__  _ __ ___
##                                 | '_ \ / _` / __| '_ \| '__/ __|
##                                _| |_) | (_| \__ \ | | | | | (__
##                               (_)_.__/ \__,_|___/_| |_|_|  \___|
##  ===============================================================================================
#   TITLE : .bashrc
#   ABOUT : My bash configuartion
#   LINKS : -
##  ===============================================================================================
#   1. XDG-configuration................................................................... \n   19
#   2. REGULAR-enviorment.................................................................. \n   30
#   3. PROMPT.............................................................................. \n   61
#   4. PATHS............................................................................... \n   64
#   5. INTERACTIVE SHELL................................................................... \n   87
#   6. SOURCES............................................................................. \n   93
#   7. HISTORY............................................................................. \n   98
#   8. BUILT-IN COMMANDS................................................................... \n  105
#   9. PERSONAL KEYBINDINGS................................................................ \n  117
#  10. CUSTOM FUNCTIONS.................................................................... \n  121
##  ===============================================================================================

##  ---[ XDG              ]----------------------------------------------------------------------///
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_STATE_HOME="$HOME/.local/state"
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_CONFIG_DIRS="/etc/xdg"
    export XDG_RUNTIME_DIR="/run/user/1000"
    export XDG_SCRIPTS="$HOME/.scripts"
    export XDG_LANGUAGES="$HOME/.languages"
    export XDG_SCRIPTS="$HOME/.scripts"
##  ---------------------------------------------------------------------------------------------\\\
##  ---[ REGULAR ENVIORMENT ]--------------------------------------------------------------------///
    # export LESS="R"
    # export LESS_TERMCAP_mb="$(printf '\e[38;5;240m')"
    # export LESS_TERMCAP_md="$(printf '\e[38;5;197m')"
    # export LESS_TERMCAP_me="$(printf '\e[38;5;240m')"
    # export LESS_TERMCAP_so="$(printf '\e[38;5;246m')"
    # export LESS_TERMCAP_se="$(printf '\e[3;38;5;240m')"
    # export LESS_TERMCAP_us="$(printf '\e[38;5;197m')"
    # export LESS_TERMCAP_ue="$(printf '\e[3;38;5;240m')"
    # export LESSOPEN="| /usr/bin/highlight -O ansi %s 2>/dev/null"
    # export LESSKEY="$HOME/config/lesskey"

    export ABOOK_DIR="$HOME/.config/abook"
    export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/ripgrep/ripgreprc"
    export PASSWORD_STORE_DIR="$HOME/.config/password-store"
    export GNUPGHOME="$HOME/.config/gnupg"
 	export GEMINI_API_KEY=$(pass gemini.lua)
    export GEMINI_MODEL="gemini-2.5-flash"
    export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"

	export XCURSOR_THEME="Bibata-Modern-Ice"
	# export XAUTHORITY="$HOME/.config/x11/xauthority"

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

##    export EZA_COLORS="di=3;38;5;21:ex=38;5;46:fi=38;5;250:ln=3;38;5;165:or=1;38;5;16;48;5;197:ur=38;5;240:uw=38;5;250:ux=38;5;196:ue=38;5;196:gr=38;5;240:gw=38;5;250:gx=38;5;196:tr=38;5;240:tw=38;5;250:tx=38;5;196:lp=38;5;201:bO=1;38;5;16;48;5;197"

##    eval "$(dircolors ~/.config/.dircolors)"
##    export EZA_COLORS="vi=38;5;93:im=38;5;226:bO=38;5;16;48;5;196:lp=38;5;201:da=38;5;204:gi=38;5;196:gd=38;5;16;48;5;196:gm=38;5;46:ga=38;5;46:gR=38;5;16;48;5;196:gu=38;5;240:uR=38;5;16;48;5;196:uu=38;5;240:ut=38;5;240:ug=38;5;240:um=38;5;240:uk=38;5;240:ub=38;5;240:um=38;5;240:sb=38;5;240:nt=38;5;240:ng=38;5;240:nm=38;5;240:nk=38;5;240:nb=38;5;240:sn=38;5;240:tx=38;5;196:tw=38;5;246:tr=38;5;240:gx=38;5;196:gw=38;5;246:gr=38;5;240:ue=38;5;196:ux=38;5;196:uw=38;5;246:ur=38;5;240:or=38;5;16;48;5;196:ln=38;5;201:bd=38;5;16;48;5;130:fi=38;5;240:ex=38;5;46:di=38;5;27"
##  ---------------------------------------------------------------------------------------------\\\
##  ---[ PROMPT           ]----------------------------------------------------------------------///
    [ -e "$XDG_CONFIG_HOME/shells/bash/crosh-prompt.bash" ] && . "$XDG_CONFIG_HOME/shells/bash/crosh-prompt.bash"
##  ---------------------------------------------------------------------------------------------\\\
##  ---[ PATHS            ]----------------------------------------------------------------------///
    PATHS_TO_ADD=(
        "/bin"
        "/usr/bin"
        "/usr/local/bin"
        "/usr/games"
        "/usr/local/games"
        "/usr/local/go/bin"
        "$HOME/.languages/.cargo/bin"
        "$HOME/.local/bin"
        "$CARGO_HOME/bin"
        "$XDG_SCRIPTS"
        "$XDG_CONFIG_HOME/platform-tools"
        "$XDG_DATA_HOME/gem/ruby/3.1.0/bin"
    )
    NEW_PATH=""
    for dir in "${PATHS_TO_ADD[@]}"; do
        if [[ -d "$dir" ]]; then
            NEW_PATH="$dir:$NEW_PATH"
        fi
    done
    export PATH="${NEW_PATH}${PATH}"
##  ---------------------------------------------------------------------------------------------\\\
##  ---[ INTERACTIVE SHELL ]---------------------------------------------------------------------///
    case $- in
        *i*) ;;
            *) return;;
    esac
##  ---------------------------------------------------------------------------------------------\\\
##  ---[ ALIASSES         ]----------------------------------------------------------------------///
    alias \
        sbash="source $XDG_CONFIG_HOME/shells/bash/.bashrc" \
        nbash="nvim $XDG_CONFIG_HOME/shells/bash/.bashrc"
    source $HOME/.config/aliasrc
##  ---------------------------------------------------------------------------------------------\\\
##  ---[ HISTORY          ]----------------------------------------------------------------------///
    HISTFILE=$XDG_CACHE_HOME/bash_history
    HISTFILESIZE=$XDG_CACHE_HOME/bash_history
    HISTIGNORE="ls:lsa:lsaa:pwd:n:cd:c:clear:history"
    HISTCONTROL=ignoredups:erasedups
##    HISTTIMEFORMAT="_%g|_%e%b__%A__%H:%M >> "
     HISTTIMEFORMAT="_B %-d, %Y"

##  ---------------------------------------------------------------------------------------------\\\
##  ---[ BUILT-IN COMMANDS ]---------------------------------------------------------------------///
    shopt -s histappend
    shopt -s autocd
    shopt -s cdspell
    shopt -s dirspell
    shopt -s extglob
    shopt -s checkwinsize
    shopt -s histverify
    shopt -s nocaseglob
    shopt -s lithist
##  ---------------------------------------------------------------------------------------------\\\
##  ---[ PERSONAL KEYBINDINGS ]------------------------------------------------------------------///
    [ -f "$XDG_CONFIG_HOME/shells/.unbindings" ]&& . "$XDG_CONFIG_HOME/shells/.unbindings"
    [ -f "$XDG_CONFIG_HOME/shells/.bindings" ]&& . "$XDG_CONFIG_HOME/shells/.bindings"
##  ---------------------------------------------------------------------------------------------\\\
##  ---[ CUSTOM FUNCTIONS ]----------------------------------------------------------------------///
    for file in "$XDG_CONFIG_HOME"/shells/functions/*; do
        [ -x "$file" ]&& source "$file"
    done
##  ---------------------------------------------------------------------------------------------\\\
#aa
##  ///

    cal.py

##                                                                                                \\\
    function spin() {
        /home/itsamus/.scripts/spinner.sh "$@"
    }

###  test!
    eval $(thefuck --alias)
    eval "$(zoxide init bash)"

