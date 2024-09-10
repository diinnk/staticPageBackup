#!/bin/sh

wget -r -p -np -k $SITE_TO_BACKUP

if [ "$?" -eq "0"  ];
then
	rm -rf $SITE_TO_BACKUP/assets/javascripts/
	cp -r $SITE_TO_BACKUP/* /var/www/html/
	echo "$(date) - Exit code 0, website updated from $SITE_TO_BACKUP" >> /root/cron.log
else
	echo "$(date) - Non-exit code 0 encountered, website not updated from $SITE_TO_BACKUP" >> /root/cron.log
fi


