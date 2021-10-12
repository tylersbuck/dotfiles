# Less configured with color output

# -R: output ANSI color and OSC 8 sequences in raw form
#     NOTE: if having issues with appearance/display of text, remove this option
LESS="$LESS -R --use-color"

# -Dxcolor or --color=xcolor
#    e.g. --color=Pyk  (sets prompt to cyan fg and black bg)
# Lowercase letters can use (+) to preserve formatting
#    e.g. --color=u+C  (sets underline to bright cyan fg while preserving underline)
LESS="$LESS --color=BC$" # Binary chars
LESS="$LESS --color=CK$" # Control chars
LESS="$LESS --color=ER$" # Error and info messages
LESS="$LESS --color=Mm$" # Mark letters
LESS="$LESS --color=Nk$" # Line numbers
LESS="$LESS --color=PK$" # Prompts
LESS="$LESS --color=Rb$" # rscroll char
LESS="$LESS --color=SkY$" # Search results
LESS="$LESS --color=WYY$" # Highlight shown with -w option

# Less termcap config for colored man pages
export LESS_TERMCAP_mb=$(tput blink; tput setaf 6) # Blink, cyan
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # Bold, yellow
export LESS_TERMCAP_me=$(tput sgr0) # Reset bold, blink, and underline
export LESS_TERMCAP_so=$(tput setaf 3; tput setab 0) # Standout, yellow on black
export LESS_TERMCAP_se=$(tput rmso; tput sgr0) # Reset standout
export LESS_TERMCAP_us=$(tput smul; tput setaf 6) # Underline, magenta
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0) # Reset underline
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
# export GROFF_NO_SGR=1 # For Konsole and Gnome-terminal

export LESS

