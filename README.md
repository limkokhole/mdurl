# mdurl
mkdir and cd to new directory (increment name if duplicated) by pasting url, while the directory name is relevant to url's hostname plus basename. 

Useful if you want to perform new task with an url in an unique directory, without have to think the directory name and cd manually. Use `mmurl` will navigate to /tmp directory first automatically.

Maximum length of directory name is 30, you can change it by look into `[30:]` code.
### Usage (while mmdurl (prefix 'm' means t'm'p) is cd to /tmp/ first):

    xb@dnxb:~/n/sh/mdurl$ . bash_aliases_sample.sh #you basically want to put the code in your real ~/.bash_aliases
    xb@dnxb:~/n/sh/mdurl$  mmdurl
    Usage: mmdurl <url>
    xb@dnxb:~/n/sh/mdurl$  mdurl
    Usage: mdurl <url> 
    xb@dnxb:~/note/sh/mdurl$ mmdurl 'https://unix.stackexchange.com/questions/4029/what-does-the-d-stand-for-in-directory-names?lala'
    total 128K
    39321601 drwxrwxrwt 50 root    root    ? 120K Ogos 11 13:08 ../
    39354582 drwxrwxr-x  2 xiaobai xiaobai ? 4.0K Ogos 11 13:08 ./
    xb@dnxb:/tmp/unix.stackexchange.com_what-do_2.d$ mmdurl 'https://unix.stackexchange.com/questions/4029/what-does-the-d-stand-for-in-directory-names?lala'
    total 128K
    39321601 drwxrwxrwt 51 root    root    ? 120K Ogos 11 13:08 ../
    39354583 drwxrwxr-x  2 xiaobai xiaobai ? 4.0K Ogos 11 13:08 ./
    xb@dnxb:/tmp/unix.stackexchange.com_what-do_3.d$ mmdurl 'https://www.google.com/search?q=lala&client=firefox-b-d&source=lnms&tbm=isch&sa=X&ved=0ahUKEwipoPq5hvrjAhXS4XMBHW61DFIQ_AUIESgB&biw=1708&bih=788&dpr=0.8'
    mkdir: cannot create directory ‘.google.com_search_2.d’: File exists
    total 128K
    39354581 drwxrwxr-x  2 xiaobai xiaobai ? 4.0K Ogos 11 13:04 ./
    39321601 drwxrwxrwt 51 root    root    ? 120K Ogos 11 13:09 ../
    xb@dnxb:/tmp/.google.com_search_2.d$ mmdurl 'https://www.google.com/search?q=lala&client=firefox-b-d&source=lnms&tbm=isch&sa=X&ved=0ahUKEwipoPq5hvrjAhXS4XMBHW61DFIQ_AUIESgB&biw=1708&bih=788&dpr=0.8'
    mkdir: cannot create directory ‘.google.com_search_2.d’: File exists
    total 128K
    39354581 drwxrwxr-x  2 xiaobai xiaobai ? 4.0K Ogos 11 13:04 ./
    39321601 drwxrwxrwt 51 root    root    ? 120K Ogos 11 13:09 ../
    xb@dnxb:/tmp/.google.com_search_2.d$ mdurl 'https://www.google.com/search?q=lala&client=firefox-b-d&source=lnms&tbm=isch&sa=X&ved=0ahUKEwipoPq5hvrjAhXS4XMBHW61DFIQ_AUIESgB&biw=1708&bih=788&dpr=0.8'
    total 8.0K
    39354581 drwxrwxr-x 3 xiaobai xiaobai ? 4.0K Ogos 11 13:09 ../
    39354584 drwxrwxr-x 2 xiaobai xiaobai ? 4.0K Ogos 11 13:09 ./
    xb@dnxb:/tmp/.google.com_search_2.d/.google.com_search.d$ mdurl 'https://www.google.com/search?q=lala&client=firefox-b-d&source=lnms&tbm=isch&sa=X&ved=0ahUKEwipoPq5hvrjAhXS4XMBHW61DFIQ_AUIESgB&biw=1708&bih=788&dpr=0.8'
    total 8.0K
    39354584 drwxrwxr-x 3 xiaobai xiaobai ? 4.0K Ogos 11 13:09 ../
    39354585 drwxrwxr-x 2 xiaobai xiaobai ? 4.0K Ogos 11 13:09 ./
    xb@dnxb:/tmp/.google.com_search_2.d/.google.com_search.d/.google.com_search.d$

