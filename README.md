# mdurl
mkdir and cd to new directory (increment name with '_'N if duplicated) by pasting url, while the directory name is relevant to url's hostname plus basename. 

Useful if you want to perform new task with an url in an unique directory, without have to think the directory name and cd manually. Use `mmdurl` will navigate to /tmp directory first automatically.

Maximum length of directory name is 30, you can change it by look into `[30:]` code.
### Usage (while mmdurl (prefix 'm' means t'm'p) is cd to /tmp/ first):

    xb@dnxb:~/n/sh/mdurl$ . bash_aliases_sample.sh #you basically want to put the code in your real ~/.bash_aliases
    xb@dnxb:~/n/sh/mdurl$ mdurl
    Usage: mdurl <url>
    xb@dnxb:~/n/sh/mdurl$ mdurl 'https://www.instaplay.games/lp/261/25/pc/index.html?game_id=261&m=109&aid=32&lpid=25&utm_campaign=0718-A1-M-18~34-DB.BROWSER+GAME-AEO&fbclid=IwAR28ywl7jVzqQB96Ky-jfK-9LEsjKCwwHCvDOkD8sQsGl_fGaeHT0FYyaF8'
    total 8.0K
    42304480 drwxrwxr-x 4 xiaobai xiaobai ? 4.0K Ogos 11 14:43 ../
    44130673 drwxrwxr-x 2 xiaobai xiaobai ? 4.0K Ogos 11 14:43 ./
    xb@dnxb:~/n/sh/mdurl/instaplay.games_index.html.d$ cd ../
    xb@dnxb:~/n/sh/mdurl$ mdurl 'https://www.instaplay.games/lp/261/25/pc/index.html?game_id=261&m=109&aid=32&lpid=25&utm_campaign=0718-A1-M-18~34-DB.BROWSER+GAME-AEO&fbclid=IwAR28ywl7jVzqQB96Ky-jfK-9LEsjKCwwHCvDOkD8sQsGl_fGaeHT0FYyaF8'
    total 8.0K
    42304480 drwxrwxr-x 5 xiaobai xiaobai ? 4.0K Ogos 11 14:43 ../
    44130679 drwxrwxr-x 2 xiaobai xiaobai ? 4.0K Ogos 11 14:43 ./
    xb@dnxb:~/n/sh/mdurl/instaplay.games_index.html_2.d$ cd ../
    xb@dnxb:~/n/sh/mdurl$ mdurl 'https://www.instaplay.games/lp/261/25/pc/index.html?game_id=261&m=109&aid=32&lpid=25&utm_campaign=0718-A1-M-18~34-DB.BROWSER+GAME-AEO&fbclid=IwAR28ywl7jVzqQB96Ky-jfK-9LEsjKCwwHCvDOkD8sQsGl_fGaeHT0FYyaF8'
    total 8.0K
    42304480 drwxrwxr-x 6 xiaobai xiaobai ? 4.0K Ogos 11 14:43 ../
    44130680 drwxrwxr-x 2 xiaobai xiaobai ? 4.0K Ogos 11 14:43 ./
    xb@dnxb:~/n/sh/mdurl/instaplay.games_index.html_3.d$ 

    ### mmdurl (prefix 'm' means t'm'p means cd to /tmp/ first):

    xb@dnxb:~/n/sh/mdurl/instaplay.games_index.html_3.d$ mmdurl
    Usage: mmdurl <url>
    xb@dnxb:~/n/sh/mdurl/instaplay.games_index.html_3.d$ mmdurl 'https://www.instaplay.games/lp/261/25/pc/index.html?game_id=261&m=109&aid=32&lpid=25&utm_campaign=0718-A1-M-18~34-DB.BROWSER+GAME-AEO&fbclid=IwAR28ywl7jVzqQB96Ky-jfK-9LEsjKCwwHCvDOkD8sQsGl_fGaeHT0FYyaF8'
    total 128K
    39321601 drwxrwxrwt 69 root    root    ? 120K Ogos 11 14:43 ../
    39354600 drwxrwxr-x  2 xiaobai xiaobai ? 4.0K Ogos 11 14:43 ./
    xb@dnxb:/tmp/instaplay.games_index.html.d$ mmdurl 'https://www.instaplay.games/lp/261/25/pc/index.html?game_id=261&m=109&aid=32&lpid=25&utm_campaign=0718-A1-M-18~34-DB.BROWSER+GAME-AEO&fbclid=IwAR28ywl7jVzqQB96Ky-jfK-9LEsjKCwwHCvDOkD8sQsGl_fGaeHT0FYyaF8'
    total 128K
    39321601 drwxrwxrwt 70 root    root    ? 120K Ogos 11 14:43 ../
    39354601 drwxrwxr-x  2 xiaobai xiaobai ? 4.0K Ogos 11 14:43 ./
    xb@dnxb:/tmp/instaplay.games_index.html_2.d$ mmdurl 'https://www.instaplay.games/lp/261/25/pc/index.html?game_id=261&m=109&aid=32&lpid=25&utm_campaign=0718-A1-M-18~34-DB.BROWSER+GAME-AEO&fbclid=IwAR28ywl7jVzqQB96Ky-jfK-9LEsjKCwwHCvDOkD8sQsGl_fGaeHT0FYyaF8'
    total 128K
    39321601 drwxrwxrwt 71 root    root    ? 120K Ogos 11 14:43 ../                                                                                       
    39354605 drwxrwxr-x  2 xiaobai xiaobai ? 4.0K Ogos 11 14:43 ./                                                                                        
    xb@dnxb:/tmp/instaplay.games_index.html_3.d$ 

    ### mmdurl second example:

    xb@dnxb:/tmp/instaplay.games_index.html_3.d$ mmdurl 'https://www.google.com/search?q=lala&client=firefox-b-d&source=lnms&tbm=isch&sa=X&ved=0ahUKEwipoPq5hvrjAhXS4XMBHW61DFIQ_AUIESgB&biw=1708&bih=788&dpr=0.8'
    total 128K
    39321601 drwxrwxrwt 72 root    root    ? 120K Ogos 11 14:44 ../
    39354608 drwxrwxr-x  2 xiaobai xiaobai ? 4.0K Ogos 11 14:44 ./
    xb@dnxb:/tmp/google.com_search.d$ mmdurl 'https://www.google.com/search?q=lala&client=firefox-b-d&source=lnms&tbm=isch&sa=X&ved=0ahUKEwipoPq5hvrjAhXS4XMBHW61DFIQ_AUIESgB&biw=1708&bih=788&dpr=0.8'
    total 128K
    39321601 drwxrwxrwt 73 root    root    ? 120K Ogos 11 14:44 ../
    39354609 drwxrwxr-x  2 xiaobai xiaobai ? 4.0K Ogos 11 14:44 ./
    xb@dnxb:/tmp/google.com_search_2.d$ 

