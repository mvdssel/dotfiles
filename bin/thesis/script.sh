#!/bin/bash

prepare_script() {
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get install curl -y
    curl --version
}

config_network() {
    ###############################################################################################
    echo "### Configuring network"
    # Source: http://doc.ilabt.iminds.be/ilabt-documentation/tipsandtricks.html?highlight=internet
    ###############################################################################################
    # Getting NATted IPv4 access to the internet on Virtual Wall 1
    # For physical machines on the Virtual Wall 1, use the following route changes:
    # sudo route del default gw 10.2.15.254 && sudo route add default gw 10.2.15.253
    # sudo route add -net 10.11.0.0 netmask 255.255.0.0 gw 10.2.15.254
    #
    # For VMs on the Virtual Wall 1, use the following route changes:
    # sudo route add -net 10.2.0.0 netmask 255.255.240.0 gw 172.16.0.1
    # sudo route del default gw 172.16.0.1 && sudo route add default gw 172.16.0.2
    #
    # Getting NATted IPv4 access to the internet on Virtual Wall 2
    # For physical machines on the Virtual Wall 2, use the following route changes:
    sudo route del default gw 10.2.47.254 && sudo route add default gw 10.2.47.253
    sudo route add -net 10.11.0.0 netmask 255.255.0.0 gw 10.2.47.254
    #
    # For VMs on the Virtual Wall 2, use the following route changes:
    # sudo route add -net 10.2.32.0 netmask 255.255.240.0 gw 172.16.0.1
    # sudo route del default gw 172.16.0.1 && sudo route add default gw 172.16.0.2
}

install_jdk() {
    ###############################################################################################
    echo "### Installing JDK"
    ###############################################################################################
    ###############################################
    # METHODE 1: Standaard JDK van Oracle repository
    # Source: http://www.webupd8.org/2012/09/install-oracle-java-8-in-ubuntu-via-ppa.html
    ###############################################
    # sudo apt-get install software-properties-common -y  # install add-apt-repository command
    # sudo add-apt-repository ppa:webupd8team/java -y     # add repository for java8
    # sudo apt-get update -y                              # update all repositories
    # echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections # auto accept java8 license
    # sudo apt-get install oracle-java8-installer -y      # install java8
    # sudo apt-get install oracle-java8-set-default -y    # update environment variables
    # java -version                                       # test installation
    # javac -version                                      # test installation

    ###############################################
    # METHODE 2: Open-JDK van OpenJDK repository
    # Source: http://ubuntuhandbook.org/index.php/2015/01/install-openjdk-8-ubuntu-14-04-12-04-lts/
    ###############################################
    sudo apt-get install software-properties-common -y  # install add-apt-repository command
    sudo add-apt-repository ppa:webupd8team/java -y     # add repository for java8
    sudo apt-get update -y                              # update all repositories
    sudo apt-get install openjdk-8-jdk -y               # install java8
    sudo update-alternatives --config java              # update environment variables
    sudo update-alternatives --config javac             # update environment variables
    java -version                                       # test installation
    javac -version                                      # test installation

    ###############################################
    # METHODE 3: Standaard JDK via Oracle download
    # Source: http://ubuntuhandbook.org/index.php/2015/01/install-openjdk-8-ubuntu-14-04-12-04-lts://www.liberiangeek.net/2014/03/daily-ubuntu-tips-manually-install-oracle-java-jdk-8-in-ubuntu/ 
    ###############################################
    # tar -xvf ./jdk-8u45-linux-x64.tar.gz
    # sudo mkdir -p /usr/lib/jvm/jdk1.8.0_45/
    # sudo mv jdk1.8.0_45/* /usr/lib/jvm/jdk1.8.0_45/
    # sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk1.8.0_45/bin/java" 1
    # sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk1.8.0_45/bin/javac" 1
    # sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/lib/jvm/jdk1.8.0_45/bin/javaws" 1
    # java –version   # needs to re login
    # javac –version  # needs to re login
}

install_maven() {
    ###############################################################################################
    echo "### Installing maven"
    ###############################################################################################
    ###############################################
    # METHODE 1: Via apt-get
    ###############################################
    sudo apt-get install maven -y
    mvn -version

    ###############################################
    # METHODE 2: Via tarball
    # Source: https://maven.apache.org/download.cgi
    ###############################################
    # 
    # 
}

checkout_svn() {
    ###############################################################################################
    echo "### Downloading svn repository"
    ###############################################################################################
    ###############################################
    # METHODE 1: Via svn
    ###############################################
    svn checkout https://mvdssel@svn.intec.ugent.be/svn/hips \
        --non-interactive --trust-server-cert \
        --username mvdessel --password IX5xnry-YnnT
    ###############################################
    # METHODE 2: Via zip
    ###############################################
    # unzip hips
}

build_project() {
    ###############################################################################################
    echo "### Building project"
    ###############################################################################################
    cd hips
    mvn clean package install
}

set -o xtrace   # Log all executed commands
set -e          # Exit on error

prepare_script
config_network
install_jdk
install_maven
checkout_svn
build_project
