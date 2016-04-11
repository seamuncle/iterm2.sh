# iterm2.sh
iTerm2 colouring for ssh connections from bash 

Ported from [Wadey's iTerm2 zsh script](https://github.com/wadey/dotfiles/blob/master/zsh/iterm2.zsh)

How to use:
- download [Bash preexec](https://github.com/rcaloras/bash-preexec/blob/master/bash-preexec.sh) and install it to $HOME/bin
- source this script from profile.d `echo "source \$HOME/bin/bash-preexec.sh" >> $HOME/.profile.d/profile.sh`
- download [this script](https://github.com/seamuncle/iterm2.sh/edit/master/iterm2.sh) and install it to $HOME/bin
- source this script from profile.d `echo "source \$HOME/bin/iterm2.sh" >> $HOME/.profile.d/profile.sh`
- make sure the bash scripts are executable `chmod 755 $HOME/bin/bash-preexec.sh $HOME/bin/iterm2.sh`
