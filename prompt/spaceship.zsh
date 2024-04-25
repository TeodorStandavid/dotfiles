
spaceship-loader() {
  local spaceship_project="$HOME/Projects/Repos/spaceship/spaceship-prompt"
  local spaceship_entry_file="spaceship.zsh"

  if [[ -d "$spaceship_project" ]]; then
    source "$spaceship_project/$spaceship_entry_file"
    return 0
  fi

  source "$1/$spaceship_entry_file"
}

# SPACESHIP_KUBECTL_PREFIX="bla"
SPACESHIP_KUBECTL_CONTEXT_SHOW=true
SPACESHIP_KUBECTL_SHOW=true
SPACESHIP_KUBECTL_VERSION_SHOW=false

SPACESHIP_KUBECTL_CONTEXT_COLOR_GROUPS=(
  # red if namespace is "kube-system"
  red    '\(kube-system)$'

  # else, green if "dev-01" is anywhere in the context or namespace
  green  fr-platform

  # else, red if context name ends with ".k8s.local" _and_ namespace is "system"
  red    '\.k8s\.local \(system)$'

  # else, yellow if the entire content is "test-" followed by digits, and no namespace is displayed
  yellow '^test-[0-9]+$'
)

# SPACESHIP_PROMPT_ORDER=(
# kubectl
# )


