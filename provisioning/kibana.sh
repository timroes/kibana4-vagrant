#! /bin/bash

# Set variables
FILES=/vagrant/provisioning/files
if [ "$1" == "64" ]; then
	KIBANA="kibana-4.0.1-linux-x64.tar.gz"
else
	KIBANA="kibana-4.0.1-linux-x86.tar.gz"
fi

if [ ! -f /srv/kibana/bin/kibana ]; then
	# Install kibana
	echo "Installing Kibana from ${KIBANA}..."
	mkdir -p /srv/kibana
	tar -C /srv/kibana -zxf ${FILES}/${KIBANA} --strip 1
fi

if [ ! -f /etc/init.d/kibana ]; then
	cp /vagrant/provisioning/files/kibana /etc/init.d/kibana4
	chmod +x /etc/init.d/kibana4
	update-rc.d kibana4 defaults 99 10
fi

service kibana4 start
