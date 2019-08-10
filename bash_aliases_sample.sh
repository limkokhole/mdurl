#https://stackoverflow.com/questions/4936229/concurrent-or-lock-access-in-bash-script-function
#https://en.wikipedia.org/wiki/File_locking
#caller:  unique_fname lala zip; if [ $? -eq 0 ]; then echo -e "\n"666; else echo -e "\n":\(; fi
#https://stackoverflow.com/questions/325628/how-to-avoid-race-condition-when-using-a-lock-file-to-avoid-two-instances-of-a-s
UNIQUE_FNAME_LOCK_FILE='/tmp/UNIQUE_FNAME_LOCK_FILE' #pls ensures this lock file not exist first if first call
#should handle by CALLER, not inside unique_fname, bcoz eventually the file created by caller (caller may be output by >redirect, so better don't crearte file/dir inside unique_fname)
function unique_fname() { #$1 name, $2 output ext
        if [ "$#" -ne 2 ]; then
        echo "Usage: unique_fname <filename> <output extension> "; return 1
        fi
        local fname=$1
        local fext=$2
        if [[ $fext == \.* ]]; then
		#https://stackoverflow.com/questions/4763041/strip-leading-dot-from-filenames-bash-script
                fext="${fext#.}"
                #echo 'ext value changed'
                if [ -z "$fext" ]; then
                        echo 'Extension argument must not dot only. Abort.'
                        #https://unix.stackexchange.com/questions/503511/bash-script-function-return-true-false
                        return 1
                fi
        fi
        #echo "$fname.$fext" 'exists?'
        if [ ! -e "$fname.$fext" ]; then
                #echo "$fname.$fext" not exists #careful if caller rely on return value, then don't echo extra thing when return 0
                echo -n "$fname.$fext"
                return 0
        else
                fn_no_ext="${fname%fext?*}"
                #echo 'fname:'"$fname"
                #echo 'fext:'"$fext"
                #echo 'fn_no_ext:'"$fn_no_ext"
                w=$(ls -1 | egrep "$fn_no_ext"_[0-9]+"\.$fext" | wc -l)
                #echo 'o:'$w
                if [ $w -eq 0 ]; then w=2; else ((w=w+2)); fi #1 is missing and start from 2, so always need increment 2
                #echo 'a:'"$w"
                while [ -e "$fn_no_ext"_"$w""\.$fext" ]; do
                        #echo $w exist
                        ((w=w+1))
                done
                echo -n "$fn_no_ext"_"$w"\."$fext"
                return 0
        fi
}
#function echo_trap() {
#	#echo "$UNIQUE_FNAME_LOCK_FILE exists. Abort."
#	#cat /home/xiaobai/note/sh/unique_dir_name/echo_trap
#	#[toproved:0] does <space><space>; below protect from malicious input expansion (may related to filename contains ';')?
#	echo PWD > /home/xiaobai/note/sh/unique_dir_name/echo_trap; sync; 
#	rm -f "$UNIQUE_FNAME_LOCK_FILE"  ; echo PWD > /home/xiaobai/note/sh/unique_dir_name/echo_trap; sync; return $? #exit $?
#}
#export -f echo_trap
function mdurl() {
	#https://stackoverflow.com/questions/325628/how-to-avoid-race-condition-when-using-a-lock-file-to-avoid-two-instances-of-a-s
	#echo/>/touch nid full path here to ensures works
	#trap 'rm -f "$UNIQUE_FNAME_LOCK_FILE"; echo "mdurl failed bcoz $UNIQUE_FNAME_LOCK_FILE exist."; touch /tmp/lalali; exit $?' INT TERM EXIT
	#trap echo_trap INT TERM SIGTERM
        ##exec 200>"$UNIQUE_FNAME_LOCK_FILE" #note that can't manually create this, nid create inside this function, so if want to test, nid do `mdurl` twice at sequence time in different bash session to know the effect.
        ##flock -e -n 200 || return 1 #-n means NOT block/wait forever unlock
	#if want to test trap rm above, note that :( may still continue executed.
	##sleep 5
	#sleep 2 && unique_fname lala zip; if [ $? -eq 0 ]; then echo -e "\n"666; else echo -e "\n":\(; fi
	##unique_fname lala zip; if [ $? -eq 0 ]; then echo -e "\n"666; else echo -e "\n":\(; fi
	##rm -f "$UNIQUE_FNAME_LOCK_FILE" 2>/dev/null
	#trap - INT TERM EXIT

	if (set -o noclobber; echo "$$" > "$UNIQUE_FNAME_LOCK_FILE") 2> /dev/null; 
	then
		#https://stackoverflow.com/questions/325628/how-to-avoid-race-condition-when-using-a-lock-file-to-avoid-two-instances-of-a-s
		# This will cause the lock-file to be deleted in case of a
		# premature exit.
		trap 'rm "$UNIQUE_FNAME_LOCK_FILE"; exit $?' INT TERM EXIT

		# Critical Section: Here you'd place the code/commands you want
		# to be protected (i.e., not run in multiple processes at once).
		#sleep 5
		if [ "$#" -ne 1 ]; then
        		echo "Usage: mdurl <url>";
			rm "$UNIQUE_FNAME_LOCK_FILE"
			trap - INT TERM EXIT
        		return 1;
    		fi;
		local url_base_name="$(echo -n "$1" | PYTHONIOENCODING=utf-8 python -c "exec(\"import os, sys\nurl=''.join(sys.stdin)\nPY3 = sys.version_info[0] >= 3\nif PY3:\n    from urllib.parse import urlparse\nelse:\n    from urlparse import urlparse\n    url=url.decode(sys.stdin.encoding)\na = urlparse(url)\nprint(os.path.basename(a.path))\")")"
		#echo 'url_base_name: '"$url_base_name"
		#don't use `local` or else return code will not pass via assigment, see https://stackoverflow.com/questions/20157938/exit-code-of-variable-assignment-to-command-substitution-in-bash#comment38560986_20157997
		#hard-coded use .d extension for dir, see https://unix.stackexchange.com/questions/4029/what-does-the-d-stand-for-in-directory-names
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

