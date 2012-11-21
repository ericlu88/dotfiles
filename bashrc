#!/usr/bin/env bash
## .bashrc - bash instance configuration

## set path to dotfiles and local overrides
DOTFILES=${DOTFILES:-~/.dotfiles}
DOTFILES_LOCAL=${DOTFILES_LOCAL:-"$DOTFILES"/local}

## don't read bashrc if session is not interactive
[ -z "$PS1" ] && return

## load dotfiles specific for each bash instance
for file in "$DOTFILES"/{prompt,aliases,functions}; do
    [ -r "$file" ] && . "$file"
done
unset file

################################
## bash environment variables ##
################################

## keep up to 32^3 lines of history
export HISTFILESIZE=32768
export HISTSIZE="$HISTFILESIZE"

## ignore commands that:
##   * begin with a space character
##   * that is the same as the previous
## and remove duplicate commands
export HISTCONTROL=ignoreboth:erasedups

## ignore these commands in history
export HISTIGNORE="ls:cd:cd -:[bf]g:pwd:exit:clear"

## always append history to history file after each command
export PROMPT_COMMAND='history -a'

###############################
## bash >= 3.x shell options ##
###############################

## auto-correct minor typos on `cd`
shopt -s cdspell

## if hash lookup fails, default to $PATH
shopt -s checkhash

## update winsize after each command for better line-wrapping
shopt -s checkwinsize

## save muti-line command as one history entry
shopt -s cmdhist

## append history rather than overwrite it
shopt -s histappend

## allow re-edit of failed history substitution
shopt -s histreedit

## load history subsitution into editing buffer
shopt -s histverify

## don't start auto-completion if there is nothing on the command line
shopt -s no_empty_cmd_completion

###############################
## bash >= 4.x shell options ##
###############################

if [ "4" = "${BASH_VERSINFO[0]}" ]; then
    ## list status of any jobs before shell exit
    shopt -s checkjobs

    ## auto-correct minor typos on directory word completion
    shopt -s dirspell

    ## recursive globbing (e.g., ls **/*.txt)
    shopt -s globstar

    if [[ 2 -eq "${BASH_VERSINFO[1]}" && 29 -le "${BASH_VERSINFO[2]}" ]]; then
        ## expand directory names (e.g., $HOME => /home/UserName)
        shopt -s direxpand
    fi
fi

## source local override file if one exists
[ -r "$DOTFILES_LOCAL"/bashrc ] && . "$DOTFILES_LOCAL"/bashrc
