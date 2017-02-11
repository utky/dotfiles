#!/bin/sh

if [ $# -ne 1 ] ; then
    help
fi

link="ln -sf"
unlink="rm -f"
savefile="${HOME}/.dotfiles"

help () {
    echo "Usage: $(basename $0) [install|uninstall]"
	exit 1
}

init_savefile() {
    if [ -e ${savefile} ] ; then
        echo "Already exist SAVEFILE."
        clean_savefile
    fi
    echo "Create new SAVEFILE."
    touch ${savefile}
}

clean_savefile() {
    rm -i ${savefile}
}

install_dots () {
    init_savefile
	for f in ./dots/*; do
		local filename="$(basename $f)"
		local source="$(readlink -f $f)"
		local target="${HOME}/.${filename}"
		echo "Creating link to  ${target}"
		${link} ${source} ${target}
		if [ $? -ne 0 ] ; then
			echo "Failed to create ${target}"
		fi
        echo ${target} >> ${savefile}
	done
	exit 0
}

uninstall_dots () {
	if [ -e ${savefile} ] ; then
		while read l; do
			echo "Removing $l"
			${unlink} $l
		done <${savefile}
        clean_savefile
        exit 0
	fi
    echo "SAVEFILE does not exist."
    echo "Please remove dotfiles manually."
	exit 1
}

case $1 in
	install ) install_dots ;;
	uninstall ) uninstall_dots ;;
	* ) help ;;
esac
