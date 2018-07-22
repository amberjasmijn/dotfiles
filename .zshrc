export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.rbenv/bin:$PATH"
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
DEFAULT_USER=amberbrookhuis

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# SSH
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Aliases
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

driveby() {
  lsof -P | grep ":$1" | awk '{print $2}' | xargs kill
  echo "Killed everything on port $1"
}

init-ts-project() {
  git init
  yarn init -y
  yarn add -D typescript
  echo "node_modules" > .gitignore
  yarn tsc --init
}
