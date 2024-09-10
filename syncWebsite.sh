#!/bin/sh

wget -r -p -np -k $SITE_TO_BACKUP

if [ "$?" -eq "0"  ];
then
	rm -rf staytuned.plen.ch/assets/javascripts/
	cp -r staytuned.plen.ch/* /var/www/html/
	echo "$(date) - Exit code 0, website updated" >> /root/cron.log
else
	echo "$(date) - Non-exit code 0 encountered, website not updated" >> /root/cron.log
fi

