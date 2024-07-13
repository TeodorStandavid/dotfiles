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
export PATH="$HOME/go/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"

source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# # The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/tylerthrailkill/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tylerthrailkill/google-cloud-sdk/path.zsh.inc'; fi

# # The next line enables shell command completion for gcloud.
# if [ -f '/Users/tylerthrailkill/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/tylerthrailkill/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


alias gproj="gcloud projects list | /usr/bin/grep $(gcloud config get-value project)"
alias gs="gcloud projects list | /usr/bin/egrep \$1"
alias gc="forge configure local-gcp-k8s"
alias ampass="kubectl get secret am-login --namespace fr-platform -o json | jq .data.password -r | base64 -d"
alias fqdn="kubectl get configmap/platform-config -n fr-platform -o json | jq .data.FQDN | tr -d '\042'"

alias fdir="fd -t d | fzf"

alias saas="cd $SAAS_PATH"

alias codesaas="cd /Users/teodor.standavid/Documents/Workspaces\ VSCode; code -n saas.code-workspace"

alias chrome_cli="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --new-window"
alias chw="chrome_cli --profile-directory="Default""
alias chp="chrome_cli --profile-directory='Profile 1'"
alias chio="chrome_cli --profile-directory='Profile 3'"
alias chsa="chrome_cli --profile-directory='Profile 4'"

source /usr/local/opt/asdf/libexec/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit
compinit

alias root="findcd_wrapper"
alias saas-api="findcd_wrapper saas-api"
alias saas-ema="findcd_wrapper saas-ema"
alias org-engine="findcd_wrapper org-engine"
alias saas-worker="findcd_wrapper saas-worker"

findcd_wrapper(){
    
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        findcd $@
    else
        echo "Not inside a Git repository"
    fi
    
}

findcd() {
    local folder="$1"
    
    if [ -z "$folder" ]; then
        cd $(git rev-parse --show-toplevel)
    else
        
        local found_dirs=($(find $(git rev-parse --show-toplevel) -type d -name "$folder" -print))
        
        if [ ${#found_dirs[@]} -eq 1 ]; then
            cd "${found_dirs[1]}"
            echo "Navigated to ${found_dirs[1]}"
            elif [ ${#found_dirs[@]} -gt 1 ]; then
            selected_dir=$(printf "%s\n" "${found_dirs[@]}" |  fzf --height 40% --layout reverse --info inline --border \
                --preview 'file {}' --preview-window up,1,border-horizontal \
                --bind 'ctrl-/:change-preview-window(50%|hidden|)' \
                --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899' \
            --prompt="Select a folder: ")
            if [ -n "$selected_dir" ]; then
                cd "$selected_dir"
                echo "Navigated to $selected_dir"
            else
                echo "No folder selected. No navigation performed."
            fi
        else
            echo "Folder '$folder' not found."
        fi
    fi
}
