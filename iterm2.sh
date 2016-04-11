#!/bin/bash
# iTerm2 tab color commands
# http://code.google.com/p/iterm2/wiki/ProprietaryEscapeCodes
# uses bash prexec...
# https://github.com/rcaloras/bash-preexec/blob/master/bash-preexec.sh


if [ -n $ITERM_SESSION_ID ]; then

    tab-color() {
        echo -ne "\033]6;1;bg;red;brightness;$1\a";
        echo -ne "\033]6;1;bg;green;brightness;$2\a";
        echo -ne "\033]6;1;bg;blue;brightness;$3\a";
    }
    # public
    export -f tab-color
    
    v-colour() {
        # divide colours by 4 to darken; and translate to hex
        R=$( printf "%02x" `expr $1 / 4` )
        G=$( printf "%02x" `expr $2 / 4` )
        B=$( printf "%02x" `expr $3 / 4` )

        # term BG
        echo -ne "\033]Ph$R$G$B\033\\"
    }
    # public
    export -f bg-color

    tab-red() { tab-color 255 0 0; }

    tab-green() { tab-color 0 255 0; }
	
    tab-blue() { tab-color 0 0 255; }
    
    tab-reset() { echo -ne "\033]6;1;bg;*;default\a"; }
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
               tab-color 255 160 160
               bg-color 255 160 160
            else
               tab-color 160 255 160
               bg-color 160 255 160
            fi
        else
  	    tab-color 160 160 255
            bg-color 160 160 255
        fi
    }

    precmd_functions+=(iterm2_tab_precmd)
    preexec_functions+=(iterm2_tab_preexec)

fi

