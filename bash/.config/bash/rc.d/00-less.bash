# Less configuration

# Alias cat to less
# With the -F option set below, less will behave like cat when the file fits on
# the screen. Otherwise it will page the output.
alias cat="less"

# -F: act like cat when file contents fit on screen
# -i: case insensitive searches unless search contains uppercase char
# -M: verbose 'long' prompt
# -S: truncate long lines instead of wrapping
# -~: lines after end of file are shown as blank instead of showing a tilde
LESS="-FiMS~"
LESS="$LESS --mouse"

export LESS

