#! /bin/sh

# Set variables
FILES=/vagrant/provisioning/files

# Install java 7
tar -C /usr/local -zxf ${FILES}/jre-7u75-linux-x64.tar.gz
ln -snf /usr/local/jre1.7.0_75 /usr/local/java

# Install elasticsearch from provided .deb package
dpkg -i ${FILES}/elasticsearch-1.4.2.deb

# write JAVA_HOME for elasticsearch
echo "export JAVA_HOME=/usr/local/java" >> /etc/default/elasticsearch

# Add elasticsearch to startupscripts and start it
update-rc.d elasticsearch defaults 95 10
service elasticsearch start

# TODO: import sample data
