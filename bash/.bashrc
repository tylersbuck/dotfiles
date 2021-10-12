# Bash rc

# Must be running interactively
[[ $- != *i* ]] && return
# Alternate method
#case $- in
#    *i*) ;;
#        *) return;;
#esac

for i in $HOME/.config/bash/rc.d/*.bash ; do
    if [ -r "$i" ]; then
        . $i
    fi
done

