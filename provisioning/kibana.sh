#! /bin/sh

# Set variables
FILES=/vagrant/provisioning/files

if [ ! -f /srv/kibana/bin/kibana ]; then
	# Install kibana
	mkdir -p /srv/kibana
	tar -C /srv/kibana -zxf ${FILES}/kibana-4.0.0-rc1-linux-x64.tar.gz --strip 1
fi

if [ ! -f /etc/init.d/kibana ]; then
	cp /vagrant/provisioning/files/kibana /etc/init.d/kibana
	chmod +x /etc/init.d/kibana
	update-rc.d kibana defaults 99 10
fi

/etc/init.d/kibana start