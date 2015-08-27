BASH Cheatsheet
===============


!! # laatste commando
!$ # laatste argument

ssh & screen
------------
[link](https://ma.ttias.be/screen-a-must-for-ssh/)


in /private/etc/sshd_config

    ServerAliveInterval 120

ssh herstarten met

    launchctl stop com.openssh.sshd
    launchctl start com.openssh.sshd

piping a sudo command
---------------------

    echo [password] | sudo -S [command]

error handling
--------------
Verkeerd aantal argumenten:

    [[ $# != 1 ]] && {
        echo "Usage: $path file[.cpp]" >&2;
        echo "Compiles C++ sourcecode and executes if compilation was successfull."
        exit 1;
    }

cd
--
Keer terug naar vorige directory

    cd -

write <username>
----------------
berichten printen naar andere gebruikers

wall <bericht>
--------------
broadcast bericht sturen naar alle terminals

ps
--
tty's achterhalen

tar
---
Nuttige opties:
    
    # -c    --create
    # -x    --extract
    # -f    --file
    # -t    --list
    # -z    use gzip for compression
    # --exclude=path/to/dir

Maak tar

    tar -cvf ball.tar /dirname

Bekijk tar

    tar -tvf ball.tar

Uitpakken tar

    tar -xvf ball.tar

Uitpakken tar.gz

    tar -xzf ball.tar.gz

downloaden en uitpakken

    curl -L <url>|tar zx
