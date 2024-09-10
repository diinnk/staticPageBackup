FROM rtsp/lighttpd:latest

RUN apk add wget curl

COPY syncWebsite.sh /etc/periodic/15min/
COPY run.sh /root/
COPY hit80.sh /root/

ENTRYPOINT []
CMD '/root/run.sh'
