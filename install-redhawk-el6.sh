#!/usr/bin/env sh
# install REDHAWK on centOS 6

VERSION=1.10.2
VERSION_LONG=$VERSION-5

INITIAL_WD=$(pwd)
INSTALL_DIR=~/.redhawk-install-$(date | sed 's/ //g')-$(uuidgen)

ARCHI=$(uname -i)
ARCHM=$(uname -m)
RPMFILE=redhawk-yum-$VERSION_LONG-el6-$ARCHM.tar.gz

mkdir $INSTALL_DIR
cd $INSTALL_DIR

echo "1/3    Downloading..."
sudo yum install -y wget >> $INSTALL_DIR/downloading.log
wget http://download.fedoraproject.org/pub/epel/6/$ARCHI/epel-release-6-8.noarch.rpm >> downloading.log 2>&1 </dev/null
wget http://sourceforge.net/projects/redhawksdr/files/redhawk/$VERSION/el6/$ARCHM/$RPMFILE >> downloading.log 2>&1 </dev/null

echo "2/3    Installing...."
sudo yum install -y --nogpgcheck epel-release-*.noarch.rpm >> installing.log 2>&1 </dev/null
rm epel-release-*.noarch.rpm >> cleanup.log 2>&1 </dev/null
sudo yum install -y omniORB-servers log4cxx-devel omniORB-devel xsd >> installing.log 2>&1 </dev/null
sudo yum install -y libuuid-devel boost-devel autoconf automake libtool expat-devel java-devel python-devel numpy PyQt4 >> installing.log 2>&1 </dev/null

tar xzvf $RPMFILE >> installing.log 2>&1 </dev/null
rm $RPMFILE >> cleanup.log 2>&1 </dev/null
cd redhawk-$VERSION* >> installing.log 2>&1 </dev/null
sudo yum install -y --nogpgcheck *.rpm >> ../installing.log 2>&1 </dev/null
. /etc/profile.d/redhawk.sh >> ../installing.log 2>&1 </dev/null
. /etc/profile.d/redhawk-sdrroot.sh >> ../installing.log 2>&1 </dev/null
sudo /usr/sbin/usermod -a -G redhawk $USER >> ../installing.log 2>&1 </dev/null
echo "InitRef = EventService=corbaloc::127.0.0.1:11169/omniEvents" | sudo tee --apend /etc/omniORB.cfg >> ../installing.log 2>&1 </dev/null
sudo $OSSIEHOME/bin/cleanomni >> ../installing.log 2>&1 </dev/null
sudo /sbin/chkconfig --level 345 omniNames on >> ../installing.log 2>&1 </dev/null
sudo /sbin/chkconfig --level 345 omniEvents on >> ../installing.log 2>&1 </dev/null

#echo "3/3    Performing cleanup...."
#cd $INITIAL_WD < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/cleanup.log
#rm -rf redhawk-1.10* < /dev/null &>> $INITIAL_WD/$INSTALL_DIR/cleanup.log

echo "done"

#sudo shutdown -hr now
#gnome-session-save --logout-dialog

