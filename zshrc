# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="Soliah"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-flow github history-substring-search node npm pow osx ruby rvm rails rails3 ssh-agent brew bundler cap gem)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/php5/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/git/bin:/usr/local/sbin:/usr/local/mysql/bin:/Development/adt-bundle/sdk/platform-tools:/Development/adt-bundle/sdk/tools:/Development/adt-bundle/sdk/build-tools:$PATH
export EDITOR=subl

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
__rvm_project_rvmrc # https://rvm.beginrescueend.com/integration/zsh/

# Usable aliases
alias l='ls -lah'
alias clear-svn='rm -rf `find . -type d -name .svn`'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Boot2docker
export DOCKER_HOST="tcp://$(boot2docker ip 2>/dev/null):2376"
export DOCKER_CERT_PATH=/Users/den/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
