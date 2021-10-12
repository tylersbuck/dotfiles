# Bash profile

[[ -f ~/.bashrc ]] && . ~/.bashrc

for i in $HOME/.config/bash/profile.d/*.bash ; do
    if [ -r "$i" ]; then
        . $i
    fi
done

