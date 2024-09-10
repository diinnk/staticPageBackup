FROM rtsp/lighttpd:latest

RUN apk add wget curl

COPY syncWebsite.sh /etc/periodic/15min/
COPY run.sh /root/
COPY hit80.sh /etc/periodic/5min/
COPY cronUpdates.txt /root/
COPY html/index.html /var/www/html/

RUN crontab /root/cronUpdates.txt

ENTRYPOINT []
CMD '/root/run.sh'
