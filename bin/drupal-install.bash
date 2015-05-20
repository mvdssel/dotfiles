#!/bin/bash

# Maps info:
#   - gmap
#       https://www.ostraining.com/blog/drupal/gmap/
#   - static map
#       http://webwash.net/tutorials/using-address-field-static-map-module-drupal-7


# Dependencies
. printexec
. pause
. colors
header() {
    echo -e "${Blue}$@${Reset}"
}

mysql='/Applications/MAMP/Library/bin/mysql'
start_mamp='/Applications/MAMP/bin/start.sh'
stop_mamp='/Applications/MAMP/bin/stop.sh'

# Settings
site_name=drupal-7
site_mail=maartenvandessel@hotmail.com
account_name=mvdssel
account_pass=shei8wae
db_su_name=root
db_su_pass=root
db_name=drupal-7    # met collation = utf8_general_ci
db_host=localhost:8889
db_url=mysql://$db_su_name:$db_su_pass@$db_host/$db_name
modules=(admin_menu module_filter date calendar date_ical reldate devel email pathauto advanced_help media file_entity jquery_update location addressfield addressfield_staticmap geofield geocoder)

function confirm_settings() {
    echo "site_name => $site_name"
    echo "account_name => $account_name"
    echo "account_pass => $account_pass"
    echo "db_su_name => $db_su_name"
    echo "db_su_pass => $db_su_pass"
    echo "db_name => $db_name"
    echo "db_host => $db_host"
    echo "db_url => $db_url"
    echo "modules => ${modules[@]}"
    echo "\t+ additional special modules"
    echo
    echo -e "Yes, I want these settings..."
    pause "Press enter to continue (<CTRL-C> to abort)"
}

prepare_install() {
    header "Cleaning previous installation"
    [[ -d $site_name ]] && printexec sudo rm -rf $site_name

    # http://stackoverflow.com/questions/22188026/sqlstatehy000-2002-no-such-file-or-directory 
    header "Preparing MAMP server"
    [[ -d  /var/mysql ]] || printexec sudo mkdir /var/mysql
    [[ -L /var/mysql/mysql.sock ]] || printexec sudo ln -s /Applications/MAMP/tmp/mysql/mysql.sock /var/mysql/mysql.sock

    header "Starting MAMP server"
    printexec $start_mamp

    header "Preparing database"
    printexec $mysql \
        --host localhost -u${db_su_name} -p${db_su_pass} \
        -e "DROP DATABASE IF EXISTS \`$db_name\`"
    printexec $mysql \
        --host localhost -u${db_su_name} -p${db_su_pass} \
        -e "CREATE DATABASE \`$db_name\` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci"
}

install_drupal() {
    header "Downloading Drupal"
    printexec drush dl drupal-7.x -y
    printexec mv drupal-7.* $site_name
    printexec cd $site_name

    header "Installing Drupal" 
    printexec drush site-install standard \
        --site-name=$site_name --site-mail=$site_mail \
        --account-name=$account_name --account-pass=$account_pass \
        --db-url=$db_url --db-su=$db_su_name --db-su-pw=$db_su_pass -y
}

install_modules() {
    header "Downloading modules"
    printexec drush dl ${modules[@]} -y

    header "Installing modules"
    printexec drush en ${modules[@]} -y

    header "Installing special modules"
    # admin_menu (Admin Menu)
    printexec drush en admin_menu_toolbar -y
    printexec drush dis toolbar -y

    # disable overlay module
    printexec drush dis overlay -y

    # date_ical
    printexec wget 'https://github.com/iCalcreator/iCalcreator/archive/master.zip'
    printexec unzip master.zip
    printexec rm master.zip
    printexec mv iCalcreator-master/ sites/all/libraries/iCalcreator/

    # fb (Drupal for Facebook)
    printexec drush dl fb-7.x-4.x 
    printexec drush en fb -y

    printexec wget 'https://github.com/facebook/facebook-php-sdk/archive/master.zip'
    printexec unzip master.zip
    printexec rm master.zip
    [[ -d sites/all/libraries ]] || printexec mkdir sites/all/libraries
    printexec sudo mv facebook-php-sdk-master sites/all/libraries/facebook-php-sdk
    # http://stackoverflow.com/questions/13778857/permission-denied-when-trying-to-append-a-file-to-a-root-owned-file-with-sudo
    echo "\$conf['fb_api_file'] = 'sites/all/libraries/facebook-php-sdk/src/facebook.php';" | sudo tee -a sites/default/settings.php

    # dropbox_client
    printexec drush dl dropbox_client
    printexec drush en dropbox_client -y
    echo -e "Dropbox Client heeft een aanpassing nodig in ${Warning}~/site/all/modules/dropbox_client/dropbox.php${Reset}"
    echo -e "Zie ${Blue}https://www.drupal.org/files/issues/Dropbox-connection-after-POODLE-changes-2381265-1.patch${Reset} voor meer info"
    pause "Zet lijn 448 in commentaar (Press enter to continue...)"

    # gmap
    printexec drush dl --dev gmap 7.x-2.x-xxxxX -y
    printexec drush en gmap -y

    # views
    printexec drush dl views -y
    printexec drush en views views_ui -y
}

update_drupal() {
    header "Performing updates"
    printexec drush up -y
    printexec drush up drupal -y
    printexec drush updatedb -y
}

finish_install() {
    header "Clearing cache"
    printexec drush cc all
    header "Installed successfully!"
    printexec open http://localhost:8888/$(echo $PWD|sed -E 's@.*/Sites/(.*)/?$@\1/index.php@')
}

confirm_settings
prepare_install
install_drupal
install_modules
update_drupal
finish_install

