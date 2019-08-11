UNIQUE_FNAME_LOCK_FILE='/tmp/UNIQUE_FNAME_LOCK_FILE'
function unique_fname() { 
        if [ "$#" -ne 2 ]; then
        echo "Usage: unique_fname <filename> <output extension> "; return 1
        fi
        local fname=$1
        local fext=$2
        if [[ $fext == \.* ]]; then
                fext="${fext#.}"
                if [ -z "$fext" ]; then
                        echo 'Extension argument must not dot only. Abort.'
                        return 1
                fi
        fi
        if [ ! -e "$fname.$fext" ]; then
                echo -n "$fname.$fext"
                return 0
        else
                fn_no_ext="${fname%fext?*}"
                w=$(ls -1 | egrep "$fn_no_ext"_[0-9]+"\.$fext" | wc -l)
                if [ $w -eq 0 ]; then w=2; else ((w=w+2)); fi
                while [ -e "$fn_no_ext"_"$w""\.$fext" ]; do
                        ((w=w+1))
                done
                echo -n "$fn_no_ext"_"$w"\."$fext"
                return 0
        fi
}
function mdurl() {
	if (set -o noclobber; echo "$$" > "$UNIQUE_FNAME_LOCK_FILE") 2> /dev/null; 
	then
		trap 'rm "$UNIQUE_FNAME_LOCK_FILE"; exit $?' INT TERM EXIT
		if [ "$#" -ne 1 ]; then
        		echo "Usage: mdurl <url>";
			rm "$UNIQUE_FNAME_LOCK_FILE"
			trap - INT TERM EXIT
        		return 1;
    		fi;
                local url_base_name="$(echo -n "$1" | PYTHONIOENCODING=utf-8 python -c "exec(\"import os, sys\nurl=''.join(sys.stdin)\nPY3 = sys.version_info[0] >= 3\nif PY3:\n    from urllib.parse import urlparse\nelse:\n    from urlparse import urlparse\n    url=url.decode(sys.stdin.encoding)\na = urlparse(url)\nh=a.netloc.split(':')[0]\nif h.startswith('www'):\n    h=h[3:]\nprint(os.path.basename( (h + '_' + os.path.basename(a.path))[:30] ))\")")"
		mdurl_d_name="$(unique_fname "$url_base_name" '.d')"
		if [ $? -eq 0 ]; then
			mkdir "$mdurl_d_name"
			cd "$mdurl_d_name" && ls -larthiF --context --color
		else
			echo -e "\nCreate directory failed.\n"
		fi
		rm "$UNIQUE_FNAME_LOCK_FILE"
		trap - INT TERM EXIT
	else
		echo "Failed to acquire lock-file: $UNIQUE_FNAME_LOCK_FILE" 
		echo "Held by process $(cat $UNIQUE_FNAME_LOCK_FILE)."
	fi
}
function mmdurl() {
	if [ "$#" -ne 1 ]; then
		echo 'Usage: mmdurl <url>'
		return 1 
	fi
	cd /tmp; mdurl "$@"
}