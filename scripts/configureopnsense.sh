#!/bin/sh
fetch https://raw.githubusercontent.com/dmauser/opnazure/master/scripts/config.xml

mkdir /conf
cp config.xml /conf/config.xml

env ASSUME_ALWAYS_YES=YES pkg install ca_root_nss
fetch https://raw.githubusercontent.com/opnsense/update/master/bootstrap/opnsense-bootstrap.sh

sed -i "" "s/reboot/shutdown -r +1/g" opnsense-bootstrap.sh

sh ./opnsense-bootstrap.sh -y
