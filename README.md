Bandwidth consumption measuring application
===========================================

Alpine based container application that by default runs the [bmon](https://github.com/tgraf/bmon)
application on all active eth\* and wlan\* interfaces and records traffic
statistics to */data/bmon-<timestamp>.out*.

The application can be customized using the following variables:

* BWC_BMON_OUTPUT: Path to the output file (by default */data/bmon-<timestamp>.out*.
* BWC_BMON_INTERFACES: List of interfaces to monitor in bmon format (check the man page). By default *eth\* and wlan\**
* BWC_BMON_DURATION: Duration in seconds before the application stops. ( By default 600)

It also contains the following useful tools:

* [iftop](http://www.ex-parrot.com/pdw/iftop/)
* [vnstat](https://humdi.net/vnstat/)
* net-tools
* [bmon](https://github.com/tgraf/bmon)
* [tcpdump](https://www.tcpdump.org/)

Usage
=====

The application needs to run as a privileged container on the host's network,
which is the default for single Balena applications.

Shell access
============

On the shell you also have access to the rest of the tools.

Some examples:

To watch traffic statistics:

```
bmon -p eth*,wlan*
```

To capture traffic from a given interface (f.e eth0) to a given file for an hour:

```
timeout 3600 tcmpdump -i eth0 -w /data/eth0.pcap
```
