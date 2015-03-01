#! /bin/bash

echo "Copying logfiles from virtual machine."
vagrant ssh -c "cp /var/log/kibana4.log /vagrant/kibana4.log"
echo "The logs has been copies to kibana4.log."