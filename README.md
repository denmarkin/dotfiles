# My dotfiles

My personal config files. I don't add new files unless they are "clean" and proven to work.
Some things were taken from http://github.com/henrik/dotfiles. Thanks Henrik!

## Install:

Checkout this repo into `~/.dotfiles`, then install them:

    rake install
    
This rake task will not replace existing files, but it will replace existing symlinks.

The dotfiles will be symlinked, e.g. `~/.bash_profile` symlinked to `~/.dotfiles/bash_profile`.

### <.replace>

If e.g. `~/.dotfiles/gitconfig` contains `<.replace github-token>` then

 * that bit will be replaced with the contents of `~/.github-token`
 * the resulting file will be written to `~/.dotfiles/gitconfig` directly, not symlinked
 
So if you want to make changes to that file, make them in `~/dotfiles/gitconfig` and then run `rake install` again.

Changes to symlinked files without `<.replace>` bits do not require a `rake install` on every change as they're symlinked.

## OSX

When setting up a new Mac, you may want to set some sensible OS X defaults:

    ./.osx

Or simply look inside to find out what might be useful for you.

## Vim

MacVim + Janus (https://github.com/carlhuda/janus). .gvimrc.local included, but I don't use it as my main editor yet. Yes, I know it's cool. But I'm a TextMate/SublimeText guy still.