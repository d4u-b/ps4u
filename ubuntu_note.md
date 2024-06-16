1. Install dual-boot for ubuntu 20.04.6 and Windows 11 by USB boot
- Download iso file from ubuntu
- Using rufus-4.5 to create USB boot from iso file
- Shrink Hard Disk to create an unallocated partition, at least 30G for Linux OS
- Restart PC and press F12 to enter BISO config
- Plugin USB
- Select Boot_Configuration > Boot from USB > Save and restart
- Select boot from ubuntu
- Select Install to install Ubuntu
- Restart PC after done install steps
2. Install QuestaSim 2021
- Install dependencies from README file
- Install FlexNet for License Manager
- Using lmutil lmhostid to identify HOST ID
- Install python2
- Copy HOST-ID and generate license file from python script
- Run Installer AOL file to launch Metor Install GUI
- Select Questa Products to install, it doesn't require a ROOT privilege to install
- export QUESTA_HOME env variable points to Install directory
- Create $QUESTA_HOME/lic dir and copy license file into this.
- Setup ENV variables point to license file.
- Copy pubkey_verify file to $QUESTA_HOME dir
- Run ./pubkey_verify -y 
- Done
- At terminal try vsim command to see the result
3. Upgrade Ubuntu 20 to 22 (Ubuntu 22 is better perfomance)
- ```cat /etc/update-manager/release-upgrades``` the content should be Prompt=lts
- ```sudo apt-mark showhold```
- If it shows empty, that's good for upgrading OS, If not empty, unhold them by ```sudo apt-mark unhold pkg1 pkg2```
- ```sudo apt update```
- ```sudo apt upgrade```
- ```sudo reboot```
- ```uname -mrs```
- ```lsb_release -a```
- ```sudo ufw allow 1022/tcp comment 'Open port ssh tcp port 1022 as failsafe option for upgrades'```
- ```sudo ufw status```
- ```sudo do-release-upgrade```
- It takes 30min to upgrade the OS, hit YES sometimes
- Restart and Done
ref: https://www.cyberciti.biz/faq/upgrade-ubuntu-20-04-lts-to-22-04-lts/
