#!/usr/bin/env zsh

# looks like this:
#  (codename) user@machine directory command
# or with git:
#  (codename) user@machine directory git/branch o command

NEWLINE=$'\n'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} x"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%} o"

CODENAME=$(cat "$HOME/.config/machine/codename" 2> /dev/null || uname -s)

will_username="$fg_bold[magenta]$(whoami)"
will_hostname="$fg_bold[magenta]$(hostname -s)"
will_unixname="$will_username$fg[yellow]@$will_hostname"
will_codename="$reset_color$fg[yellow]($fg[green]$CODENAME$fg[yellow])"
will_git='%{$reset_color%}%{$fg[yellow]%}%c%{$fg[yellow]%}%{$reset_color%} $(git_prompt_info)'
will_final=$'\n ' # Or with some jazz: '$fg[green]=>''$(tput sgr0) '

PROMPT="$will_codename $will_unixname %(?:$fg[blue]o:$fg[red]x) $will_git $will_final "

