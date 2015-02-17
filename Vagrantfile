# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  pref = YAML.load_file("config.yaml")
  if !pref.has_key?('32bit') or !pref.has_key?('memory')
    abort("Your config.yaml must specify a '32bit' and 'memory' setting.")
  end

  if pref['32bit']
    config.vm.box = "ubuntu/trusty32"
  else
    config.vm.box = "ubuntu/trusty64"
  end

  config.vm.network "forwarded_port", guest: 5601, host: 5601
  config.vm.network "forwarded_port", guest: 9200, host: 9200

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", pref["memory"]]
  end

  config.vm.provision "shell", path: "provisioning/elasticsearch.sh", args: (pref['32bit'] ? "32": "64")
  config.vm.provision "shell", path: "provisioning/kibana.sh", args: (pref['32bit'] ? "32" : "64")

end
