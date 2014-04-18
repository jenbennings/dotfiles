# Ben's Bash
# Inspired by @gf3’s "Sexy Bash Prompt", which was inspired by "Extravagant Zsh Prompt". Oh, and a bit of Barry Clark’s "Bashstrap" thrown in there for good measure.

# Add `~/bin` to the `$PATH`
export PATH=$PATH:/usr/local/bin/

# Open specified files in Sublime Text
# "s ." will open the current directory in Sublime
alias s='open -a "Sublime Text"'

# Quicker navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Basic Git
alias gs='git status -sb'
alias gc='git checkout'
alias ga='git add -A'
alias gci='git commit'

# Git Gauntlet
alias gg='git checkout master && git pull && git checkout working && git rebase master && git checkout master && git rebase working && git push && git checkout working'

# Grunt
alias oof='grunt && grunt watch'

# Shortcuts to my folders Documents
alias idealogue="cd ~/Documents/idealogue && ls"
alias personal="cd ~/Documents/personal && ls"
alias experiments="cd ~/Documents/experiments && ls"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
        [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
        shopt -s "$option" 2> /dev/null
done

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Only show the current directory's name in the tab
# export PROMPT_COMMAND='echo -ne "\033]0;${PWD##*/}\007"'


eval "$(rbenv init -)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

PATH="/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH"
