alias ls='ls --color=auto'
alias grep='grep --color=auto'
PROMPT="%n@%m %~ 󰘧 "

[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
	  exec startx
fi

# hist
# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
setopt inc_append_history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Sudo commands
alias mount='sudo mount' umount='sudo umount' sv='sudo sv' pacman='sudo pacman' updatedb='sudo updatedb' su='sudo su' shutdown='sudo shutdown' poweroff='sudo poweroff' reboot='sudo reboot'

# Verbosity
alias cp='cp -iv' mv='mv -iv' rm='rm -vI' bc='bc -ql' rsync='rsync -vrPlu' mkd='mkdir -pv'

# Colorized commands
alias grep='grep --color=auto' diff='diff --color=auto' ccat='highlight --out-format=ansi' ip='ip -color=auto'

# LS
#alias ls="ls -hN --color=auto --group-directories-first"
alias la="ls -la -hN --color=auto --group-directories-first"

# Shortcuts
alias ka='killall' g='git' sdn='shutdown -h now' e="$EDITOR" v="$EDITOR" p='pacman'

# Process management
alias psa='ps auxf' psgrep='ps aux | grep -v grep | grep -i -e VSZ -e' psmem='ps auxf | sort -nr -k 4' pscpu='ps auxf | sort -nr -k 3'

# Journalctl
alias jctl='journalctl -p 3 -xb'

# Shell integrations
export MANPAGER='emacs +Man!'
source <(zoxide init --cmd cd zsh)
source <(fzf --zsh)

export PATH="$HOME/.config/emacs/bin:$PATH"

# syntax
source ~/.local/zsh-plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
source ~/.local/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh 2>/dev/null
