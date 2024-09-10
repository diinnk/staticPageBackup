#!/bin/sh

crond & /etc/periodic/15min/syncWebsite.sh && touch /root/cron.log && tail -f /root/cron.log & /usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf
