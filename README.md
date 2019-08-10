# mdurl
mkdir and cd to new directory (increment name if duplicated) by pasting url, while the directory name is relevant to url.  
Useful if you want to perform new task with an url in a unique directory, without have to think the directory name and cd manually.

### Usage:

    xb@dnxb:~/n/sh/mdurl$ . bash_aliases_sample.sh #you basically want to put the code in your real ~/.bash_aliases
    xb@dnxb:~/n/sh/mdurl$ mdurl
    Usage: mdurl <url>
    xb@dnxb:~/n/sh/mdurl$ mdurl 'https://unix.stackexchange.com/questions/4029/what-does-the-d-stand-for-in-directory-names?lala'
    total 8.0K
    42157025 drwxrwxr-x 4 xiaobai xiaobai ? 4.0K Ogos 11 05:12 ../
    42189794 drwxrwxr-x 2 xiaobai xiaobai ? 4.0K Ogos 11 05:12 ./
    xb@dnxb:~/n/sh/mdurl/what-does-the-d-stand-for-in-directory-names.d$ cd ../
    xb@dnxb:~/n/sh/mdurl$ mdurl 'https://unix.stackexchange.com/questions/4029/what-does-the-d-stand-for-in-directory-names?lala'
    total 8.0K
    42157025 drwxrwxr-x 5 xiaobai xiaobai ? 4.0K Ogos 11 05:16 ../
    42197973 drwxrwxr-x 2 xiaobai xiaobai ? 4.0K Ogos 11 05:16 ./
    xb@dnxb:~/n/sh/mdurl/what-does-the-d-stand-for-in-directory-names_2.d$ cd ../
    xb@dnxb:~/n/sh/mdurl$ mdurl 'https://unix.stackexchange.com/questions/4029/what-does-the-d-stand-for-in-directory-names?lala'
    total 8.0K
    42157025 drwxrwxr-x 6 xiaobai xiaobai ? 4.0K Ogos 11 05:16 ../
    42197983 drwxrwxr-x 2 xiaobai xiaobai ? 4.0K Ogos 11 05:16 ./
    xb@dnxb:~/n/sh/mdurl/what-does-the-d-stand-for-in-directory-names_3.d$ 

