# dotfiles

Local user configurations. 

## Stow

In order to avoid having a git repo initialized in the home directory [GNU stow](https://www.gnu.org/software/stow/) is being used to manage symlinks. This may change in the future depending on how complicated the sync script becomes as configurations and requirements evolve.

## Usage

To symlink configuration files execute `./sync.sh <package-group>` where `<package-group>` is the alias of the group of configuration files. These groups correspond to various setups such as a machine using X11, headless servers, etc. The sync script will also clean up old symlinks that are no longer used.

