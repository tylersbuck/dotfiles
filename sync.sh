# Syncs user config with dotfiles repo

# Define package groups
# default using X window system
default=(bash colors dunst git go gtk i3 kitty polybar readline rofi tmux wezterm X11)
# headless server, no window system configurations
headless=(bash git readline tmux)

# Restow cleans old symlinks before stowing new ones
# Symlinks are created at the lowest level using the no-folding option,
# this allows machine-specific packages to add or override configs from generic packages
function restow() {
    stow --verbose=0 --no-folding --override='.*' -R -t $HOME $1
}

function sync_package() {
    for package in "$1"
    do
        restow $package
        if [[ $? = 1 ]]; then
            echo "[DOTFILES SYNC] Syncing ${package}... FAILED"
        else
            echo "[DOTFILES SYNC] Syncing ${package}... SUCCESS"
        fi
    done
}

if [[ $1 ]]; then
    case $1 in
        default)
            for package in "${default[@]}"
            do
                sync_package $package
            done
            ;;
        saltyCamel)
            for package in "${saltyCamel[@]}"
            do
                sync_package $package
            done
            ;;
        *)
            echo "[DOTFILES SYNC] Invalid package group: $1"
            ;;
    esac
else
    echo '[DOTFILES SYNC] Usage: `./sync.sh <package-group-name>`'
fi

