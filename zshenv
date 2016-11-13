#export PATH="$HOME/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/Applications/TeXLive/Library/texlive/2013/bin/x86_64-darwin:/Applications/TeXLive/Library/mactexaddons/bin"

if [ -f "${HOME}/.nix-profile/etc/profile.d/nix.sh" ] ; then
    . $HOME/.nix-profile/etc/profile.d/nix.sh
    export LOCALE_ARCHIVE="${HOME}/.nix-profile/lib/locale/locale-archive"
fi
export TERM=xterm-256color
export EDITOR=vim
export MEMOLIST=$HOME/Dropbox/memolist
export PATH="$HOME/.local/bin:$PATH"

export SBT_OPTS="-Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=512M"
