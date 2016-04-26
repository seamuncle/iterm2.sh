#!/bin/bash
# iTerm2 tab color commands
# http://code.google.com/p/iterm2/wiki/ProprietaryEscapeCodes
# uses bash prexec...
# https://github.com/rcaloras/bash-preexec/blob/master/bash-preexec.sh


if [ -n $ITERM_SESSION_ID ]; then

    tab_color() {
        echo -ne "\033]6;1;bg;red;brightness;$1\a";
        echo -ne "\033]6;1;bg;green;brightness;$2\a";
        echo -ne "\033]6;1;bg;blue;brightness;$3\a";
    }
    # public
    export -f tab_color
    
    bg_color() {
        # divide colours by 4 to darken; and translate to hex
        R=$( printf "%02x" `expr $1 / 4` )
        G=$( printf "%02x" `expr $2 / 4` )
        B=$( printf "%02x" `expr $3 / 4` )

        # term BG
        echo -ne "\033]Ph$R$G$B\033\\"
    }
    # public
    export -f bg_color
    
    change_color() {
	tab_color $1 $2 $3
	bg_color $1 $2 $3
    }
    # public
    export -f change_color

    tab_red() { tab_color 255 0 0; }

    tab_green() { tab_color 0 255 0; }
	
    tab_blue() { tab_color 0 0 255; }
    
    tab_reset() { echo -ne "\033]6;1;bg;*;default\a"; }
    # public
    export -f tab-reset

    iterm2_tab_precmd() {
        tab-reset;
    }
    iterm2_tab_preexec() {
        ssh_pattern='^ssh ' 
        if [[ $1 =~ $ssh_pattern ]]; then
    	    prod_pattern='prod'
            if [[ $1 =~ $prod_pattern ]]; then
               change_color 255 160 160
            else
               change_color 160 255 160
            fi
        else
  	    change_color 160 160 255
        fi
    }
    precmd_functions+=(iterm2_tab_precmd)
    preexec_functions+=(iterm2_tab_preexec)
fi
