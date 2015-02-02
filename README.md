Kibana4 Vagrant Machine
=======================

This is a virtual vagrant machine, that runs the new Kibana 4 Beta with sample data.

You can use it to play around with Kibana 4. It is not meant for any production usage.

Installation
------------

To get it working, you will need to install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
and [Vagrant](https://www.vagrantup.com). Once you have these installed, clone
(or download) this repository.

Usage
-----

Go to the folder where you downloaded this project, and enter `vagrant up`.
On the first run this might take some time and will download a large vm image.
After some time, you have a running instance of an ElasticSearch (with some
sample data) and a Kibana 4 instance.

You can now access Kibana 4 (or ElasticSearch directly, if you need to):

| Service       | Address                                 |
|---------------|-----------------------------------------|
| Kibana 4      | [localhost:5601](http://localhost:5601) |
| ElasticSearch | [localhost:9200](http://localhost:9200) |

If you finished, just enter `vagrant destroy` to throw away everything you
did (will clear all Kibana Dashboards, etc.) and you can start over again
the next time with `vagrant up`.

If you just want to shutdown the virtual machine without destroying your
data use `vagrant suspend` and `vagrant resume` to start it again. In this
case all your data changes and Kibana Dashboards will be persisted.
