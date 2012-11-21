#!/usr/bin/env bash
## .bash_profile - bash login shell environment configuration

## set path to dotfiles and local overrides
DOTFILES=${DOTFILES:-~/.dotfiles}
DOTFILES_LOCAL=${DOTFILES_LOCAL:-"$DOTFILES"/local}

## load dotfiles for login shell
for file in "$DOTFILES"/{path,exports}; do
    [ -r "$file" ] && . "$file"
done
unset file

## setup coloring scheme for `ls`
if command dircolors &> /dev/null; then
    ## use colors as specified in ~/.dir_colors
    [ -r ~/.dir_colors ] &&  eval $(dircolors -b ~/.dir_colors)

    ## source local override file if one exists
    [ -r "$DOTFILES_LOCAL"/dircolors ] && . "$DOTFILES_LOCAL"/dircolors
fi

## source local override file if one exists
[ -r "$DOTFILES_LOCAL"/bash_profile ] && . "$DOTFILES_LOCAL"/bash_profile

## for login shell, source .bashrc for good measure
[ -r ~/.bashrc ] && . ~/.bashrc
