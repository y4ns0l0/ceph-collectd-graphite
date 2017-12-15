#!/bin/sh

set -e

if [ ! -e "/.initialized" ]; then
    touch "/.initialized"
    envtpl /etc/collectd/collectd.conf.tpl
fi

exec collectd -f
