#!/bin/sh

getWinid ()
{
    winid_hex=`xwininfo -root -children | grep urxvt | awk '{ print $1; }' | head -n1`
    winid_dec=`printf "%d\n" ${winid_hex}`
    echo "${winid_dec}"
}

for i in "$@"
do
    case $i in
	-t=*|--new-tab=*)
	    tab_name="${i#*=}"
	    shift # past argument=value
	    ;;
	-a=*|--activate-tab=*)
	    tab_active_name="${i#*=}"
	    shift # past argument=value
	    ;;
	-e=*|--exec=*)
	    exec_cmd_line="${i#*=}"
	    shift # past argument=value
	    ;;
        -f|--foreground)
	    foreground="1"
	    shift # past argument with no value
	    ;;
	*)
	    # unknown option
	    ;;
    esac
done

winid_dec="$(getWinid)"
if [ "${winid_dec}" = "0" ]; then
    urxvtcd
    exit 0
fi

cmd_line="dbus-send --session --print-reply --dest=org.schmorp.urxvt /term/${winid_dec}/control "

if [ -n "${tab_name}" ]; then
    eval "${cmd_line} org.schmorp.urxvt.addTabWithName string:\"${tab_name}\""
fi
if [ -n "${tab_active_name}" ]; then
    eval "${cmd_line} org.schmorp.urxvt.addOrActivateTabByName string:\"${tab_active_name}\""
fi
if [ -n "${exec_cmd_line}" ]; then
    eval "${cmd_line} org.schmorp.urxvt.execCmd string:\"${exec_cmd_line}\""
fi
if [ -n "${foreground}" ]; then
    xdotool windowactivate ${winid_dec}
fi
