BASH Cheatsheet
===============

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
Maak tar

    tar -cvf output.tar /dirname

Bekijk tar

    tar -tvf /tmp/data.tar

Uitpakken tar

    tar -xvf /tmp/data.tar

Uitpakken van tar.gz

    tar -xzf <archief>.tar.gz

downloaden en uitpakken

    curl -L <url>|tar zx
