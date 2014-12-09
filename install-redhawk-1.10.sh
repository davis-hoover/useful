#!/bin/bash
# install REDHAWK 1.10 on centOS 6

INITIAL_WD=$(pwd)
INSTALL_DIR=".redhawk-install-$(date | sed 's/ //g')-$(uuidgen)"

mkdir $INSTALL_DIR
cd $INSTALL_DIR

echo "1/3    Downloading..."
wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/downloading.log
wget http://sourceforge.net/projects/redhawksdr/files/redhawk/1.10.0/el6/x86_64/redhawk-yum-1.10.0-10-el6-x86_64.tar.gz < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/downloading.log

echo "2/3    Installing...."
sudo yum install -y --nogpgcheck epel-release-*.noarch.rpm < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/installing.log
rm epel-release-*.noarch.rpm < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/cleanup.log
sudo yum install -y omniORB-servers log4cxx-devel omniORB-devel xsd < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/installing.log
sudo yum install -y libuuid-devel boost-devel autoconf automake libtool expat-devel java-devel python-devel numpy PyQt4 < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/installing.log

tar xzf redhawk-yum-*.tar.gz < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/installing.log
rm redhawk-yum-*.tar.gz < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/cleanup.log
cd redhawk-1.10* < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/installing.log
sudo yum install -y --nogpgcheck *.rpm < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/installing.log
. /etc/profile.d/redhawk.sh < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/installing.log
. /etc/profile.d/redhawk-sdrroot.sh < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/installing.log
sudo /usr/sbin/usermod -a -G redhawk $USER < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/installing.log
echo "InitRef = EventService=corbaloc::127.0.0.1:11169/omniEvents" | sudo tee --apend /etc/omniORB.cfg < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/installing.log
sudo $OSSIEHOME/bin/cleanomni < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/installing.log
sudo /sbin/chkconfig --level 345 omniNames on < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/installing.log
sudo /sbin/chkconfig --level 345 omniEvents on < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/installing.log

echo "3/3    Performing cleanup...."
cd .. < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/cleanup.log
rm -rf redhawk-1.10* < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/cleanup.log

echo "done"

#sudo shutdown -hr now
gnome-session-save --logout-dialog

