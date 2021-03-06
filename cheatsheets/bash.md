BASH Cheatsheet
===============

!! # laatste commando
!$ # laatste argument

unix & file permissions
-----------------------

    sudo chmod -N file              # Remove ACLs from file
    sudo chmod ugo+rw file          # Give everyone read-write permission to file
    sudo chflags nouchg file        # Clear the user immutable flag from file
    sudo chflags norestricted file  # Remove the SIP protection from file

    sudo spctl --master-disable     # Allow apps to be opened from everywhere

    sudo csrutil disable            # Disable System Integrety Protection

ssh & screen
------------
[link](https://ma.ttias.be/screen-a-must-for-ssh/)

    <CTRL-A> ?


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

tput
----
Dimensions of terminal window
    
    tput cols
    tput lines

