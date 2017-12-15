# Collect ceph metrics to graphite

This is a fork of [Ian Babrou](https://github.com/bobrik)'s version. Thanks to him !
I needed a rebuild  with a fresh [ceph/base](https://github.com/ceph/ceph-docker) version.

I also use the [grinapo](https://github.com/grinapo)'s fork of collectd-ceph plugin.

This is dockerized version of [collectd-ceph](https://github.com/grinapo/collectd-ceph.git).
You only need docker to run this, ceph to monitor and graphite to store metrics.

## Running

```
docker run -d -e HOST_NAME=$(hostname -s) -e GRAPHITE_HOST=<graphite host> \
  -e GRAPHITE_PORT=2003 -v </etc/ceph/of/running/cluster>:/etc/ceph:ro \
  -e GRAPHITE_UPDATE_INTERVAL=30 -e GRAPHITE_PREFIX=collectd. \
  -e CEPH_CLUSTER_NAME=<my ceph cluster> \
  -e CEPH_TEST_POOL=<your bench pool> \
  y4ns0l0/ceph-collectd-graphite
```

Environment variables:

* `HOST_NAME` - hostname to use in graphite.
* `GRAPHITE_HOST` - host where carbon is listening for data.
* `GRAPHITE_PORT` - port where carbon is listening for data, `2003` by default.
* `GRAPHITE_UPDATE_INTERVAL` - metric update interval, `30` by default
* `GRAPHITE_PREFIX` - prefix for metrics in graphite, `collectd.` by default.
* `CEPH_CLUSTER_NAME` - cluster name to use in graphite.
* `CEPH_TEST_POOL` - pool name to use for latency checks.

Note that you must pass `/etc/ceph` into container to collect metrics.

This image builds from `ceph/base` and has the same tags.

Check out [collectd-ceph](https://github.com/grinapo/collectd-ceph.git)
for more info and awesome grafana dasboard:

![grafana](https://raw.githubusercontent.com/grinapo/collectd-ceph/master/public/ceph-overview.png)

# Authors

* Fork by [Yann MATYSIAK](https://github.com/y4ns0l0) from [Ian Babrou](https://github.com/bobrik)'s great work
