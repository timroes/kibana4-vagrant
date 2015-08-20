Kibana4 Vagrant Machine
=======================

This is a virtual vagrant machine, that runs the new Kibana 4 with sample data.

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

If you finished working, just enter `vagrant destroy` to throw away everything you
did (*Attention:* This will clear all Kibana Dashboards, etc.) and you can start over again
the next time with `vagrant up`.

If you just want to shutdown the virtual machine without destroying your
data use `vagrant suspend` and `vagrant resume` to start it again. In this
case all your data changes and Kibana Dashboards will be persisted.

Sample data
-----------

The virtual machine contains two indexes of sample data:

*twitter*: the twitter index contains sample tweets taken from the public twitter stream.
Attention this tweets have been recorded at February 5th between 12:00 and 12:05 (UTC+1).
To see them in Kibana, you will have to go back to that date. The tweets have been recorded
using the [stream2es](https://github.com/elasticsearch/stream2es) util, which you can also use
to generate your own index.

*bank*: this index contains some non time-based data. It represents accounts from a bank
and come from the [elasticsearch documentation](http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/_exploring_your_data.html).

Configuration
-------------

There is a configuration file called `config.yaml` that you can edit with a text editor, to change
some settings.

Set the `32bit` option to `true` if you run on a system, that only supports 32bit virtualization or
would like to test the 32 bit version for any other reason. You should normally not need this.

You can specify the amount of memory used by the virtual machine. It is set to `2048` (MB) by default,
since I think this is a good value that would work for the most users. If you however have very low memory
you can try to decrease this value or increase it, if you have enough memory left in your system.

**Attention:** Only make changes to this file, while the vagrant machine is destroyed (i.e. never started or
destroyed via `vagrant destroy`), otherwise the outcome will be uncertain!
