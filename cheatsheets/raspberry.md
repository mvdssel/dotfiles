Raspberry Pi
============

## Installation
### Find the SD card

    diskutil list

### Installing Rasbian onto the SD card
Connect the SD card reader with the SD card inside. Note that it must be formatted as FAT32.
From the Apple menu, choose "About This Mac", then click on "More info..."; if you are using Mac OS X 10.8.x Mountain Lion or newer, then click on "System Report".
Click on "USB" (or "Card Reader" if using a built-in SD card reader) then search for your SD card in the upper-right section of the window. Click on it, then search for the BSD name in the lower-right section; it will look something like diskn where n is a number (for example, disk4). Make sure you take a note of this number.
Unmount the partition so that you will be allowed to overwrite the disk. To do this, open Disk Utility and unmount it; do not eject it, or you will have to reconnect it. Note that on Mac OS X 10.8.x Mountain Lion, "Verify Disk" (before unmounting) will display the BSD name as /dev/disk1s1 or similar, allowing you to skip the previous two steps.

From the terminal, run the following command:

    sudo dd bs=1m if=path_of_your_image.img of=/dev/rdiskn

Remember to replace n with the number that you noted before!

If this command fails, try using disk instead of rdisk:

    sudo dd bs=1m if=path_of_your_image.img of=/dev/diskn

### Enable SSH on your Raspberry Pi

    cd /Volumes/boot
    touch ssh

### Start Rasberry Pi
1. Unmount the SD card

    diskutil list | grep boot
    diskutil unmount /dev/[disk identifier]

2. Add the SD card to your Raspberry Pi and start it

### Find your Rasberry Pi
1. Find the ip-address of your computer

    ifconfig                # get the interface of your computer
    ipconfig getifaddr [if] # get the ip address of your interface

2. Find the Raspberry 

    nmap -sn [ipaddr].0/24
or
    arp -a | grep ':'
