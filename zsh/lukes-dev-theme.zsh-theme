PROMPT='%{$fg[yellow]%}$(DetermineIfSSH)%{$reset_color%}%{$fg_bold[green]%}%n@%10>..>%m%<<: %{$fg[cyan]%}%2~ %{$fg_bold[blue]%}$(git_prompt_info) %{$reset_color%}» '

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function DetermineIfSSH() {
   if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
      echo "○ "
   else
      #echo "+ "
   fi
} 
