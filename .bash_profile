# The ~/.profile is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.
# see /usr/share/doc/bash/examples/startup-files for examples. The files are located in the bash-doc package.
# the default umask is set in /etc/profile; for setting the umask for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash then include .bashrc if it exists
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"

# set PATH so it includes user's private bin if it exists
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# set PATH so it includes GOPATH if it exists
[ -d "$(go env GOPATH)/bin" ] && PATH="$(go env GOPATH)/bin:$PATH"
