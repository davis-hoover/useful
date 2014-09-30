#!/bin/bash
# install REDHAWK 1.10 on centOS 6
wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sudo yum install -y --nogpgcheck epel-release-*.noarch.rpm
sudo yum install -y omniORB-servers log4cxx-devel omniORB-devel xsd
sudo yum install -y libuuid-devel boost-devel autoconf automake libtool expat-devel java-devel python-devel numpy PyQt4
wget http://sourceforge.net/projects/redhawksdr/files/redhawk/1.10.0/el6/x86_64/redhawk-yum-1.10.0-10-el6-x86_64.tar.gz
tar xzf redhawk-yum-*.tar.gz
cd redhawk-1.10*
sudo yum install -y --nogpgcheck *.rpm
. /etc/profile.d/redhawk.sh
. /etc/profile.d/redhawk-sdrroot.sh
sudo /usr/sbin/usermod -a -G redhawk $USER
echo "InitRef = EventService=corbaloc::127.0.0.1:11169/omniEvents" >> /etc/omniORB.cfg
sudo $OSSIEHOME/bin/cleanomni
sudo /sbin/chkconfig --level 345 omniNames on
sudo /sbin/chkconfig --level 345 omniEvents on
rm epel-release-*.noarch.rpm
rm redhawk-yum-*.tar.gz
rm redhawk-1.10*
sudo shutdown -hr now

