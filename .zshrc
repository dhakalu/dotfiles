# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Antigen setup
source /opt/homebrew/share/antigen/antigen.zsh
antigen theme romkatv/powerlevel10k
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle Aloxaf/fzf-tab
antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# enable zoxide
eval "$(zoxide init zsh)"
eval $(fzf --zsh)

# Key bindings
bindkey -e # Use Emacs key bindings
bindkey '^p' history-search-backward # Ctrl+p to search history backward
bindkey '^n' history-search-forward # Ctrl+n to search history forward

# History settings
HISTSIZE=10000
SAVEHIST=${HISTSIZE}
HISTFILE=~/.zsh_history
HISTDUP=erase
setopt appendhistory # Append to the history file, don't overwrite it
setopt sharehistory # Share history across all sessions
setopt hist_ignore_space # Ignore commands that start with a space. Useful for sensitive commands.
setopt hist_ignore_all_dups # Ignore duplicate commands in history
setopt hist_save_no_dups # Don't save duplicate commands in history
setopt hist_ignore_dups # Ignore duplicates in the history file
setopt hist_find_no_dups # Don't find duplicates in the history file

# completion settings
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case-insensitive completion
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# store all environment variables often used for local development
source ~/.env.zsh

