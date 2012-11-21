# Eric VW’s dotfiles

## Installation

Clone the repository wherver you want.  If you prefer to not clone the
repository to `~/.dotfiles`, then create a symlink.  Once the repository is
cloned, then setting up the symlinks is automatically provided by an install
script; exisitng dot files that are symlinked will automatically be backed up
to the `original` directory.  Otherwise, feel free to pick and symlink the dot
files you want.

```bash
git clone https://github.com/ericvw/dotfiles.git ~/.dotfiles
~/.dotfiles/scripts/install.sh
```

## Customization

These dot files were designed to be fairly generic.  Each dot file sources at
the end, with the exception of .Xresources, a local dot file to allow for
further customization and overrides.  These local dot files should be placed in
the `local` directory.  Some examples of local configurations that are provided
may be found in the `samples` directory.

The design of sourcing local dot files is intended to allow for customization
without having to fork the repository.  Hopefully the defaults provided are
reasonable and non-intrusive; if they aren't, please provide feedback as I
would like to incorporate any changes and improvements.

## Where are the ViM files?

I did not want to include them in this repository because ViM is meant to be
customized to one's liking.  I did not want to impose my particular
configuration and plugins.  If you are interested though, you may find them
[here](http://github.com/ericvw/vimfiles).

## Feedback
Suggestions/improvements
[welcome](https://github.com/ericvw/dotfiles/issues)!
