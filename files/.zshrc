# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
DEFAULT_USERNAME='alexander'
CMD_MAX_EXEC_TIME=5

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="mad"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew docker pyenv)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/MacGPG2/bin

source ~/.bash_alias
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export CLICOLOR=1
export LSCOLORS=exfxcxdxbxegedabagacad
HISTSIZE=50000
SAVEHIST=50000
[ $USER != $DEFAULT_USERNAME ] && local username='%n@%m '
DISABLE_CORRECTION="true"
unsetopt correct_all
export PATH="/usr/local/bin:/usr/local/pgsql/bin:/usr/local/php5/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
export PATH="/usr/local/Cellar:${PATH}"
setopt INC_APPEND_HISTORY
setopt NO_SHARE_HISTORY
export PATH=$PATH:/usr/local/mysql/bin

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
export GROOVY_HOME=/usr/local/opt/groovy/libexec

export ANSIBLE_NOCOWS=1

export GOPATH=$HOME 
export PATH=$PATH:$GOPATH/bin
zstyle ':completion:*:(all-|)files' ignored-patterns "(*.pyc|*~)"
export PYENV_ROOT=/usr/local/var/pyenv
