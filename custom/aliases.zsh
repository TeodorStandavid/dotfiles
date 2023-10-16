alias gproj="gcloud projects list | /usr/bin/grep $(gcloud config get-value project)"
alias gs="gcloud projects list | /usr/bin/egrep \$1"
alias gc="get_creds"
alias ampass="kubectl get secret am-login --namespace fr-platform -o json | jq .data.password -r | base64 -d"
alias fqdn="kubectl get configmap/platform-config -n fr-platform -o json | jq .data.FQDN | tr -d '\042'"

alias saas="cd $SAAS_PATH"

alias codesaas="cd /Users/teodor.standavid/Documents/Workspaces\ VSCode; code -n saas.code-workspace"

alias chrome_cli="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --new-window"
alias chw="chrome_cli --profile-directory="Default""
alias chp="chrome_cli --profile-directory='Profile 1'"
alias chio="chrome_cli --profile-directory='Profile 3'"
alias chsa="chrome_cli --profile-directory='Profile 4'"

export SAAS_PATH=$HOME/go/src/github.com/ForgeCloud/saas
export PATH="$(brew --prefix)/bin/:$PATH"
export USE_GKE_GCLOUD_AUTH_PLUGIN=True
# export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
# export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
# export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
# export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
# export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
# export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
# export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
# export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

export PATH="$HOME/.gobrew/current/bin:$HOME/.gobrew/bin:$PATH"
export GOROOT="$HOME/.gobrew/current/go"
export TERM="xterm-256color"
# export SPACESHIP_KUBECTL_SHOW="true"
# export SPACESHIP_KUBECTL_ASYNC="false"
