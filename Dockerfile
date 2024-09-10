FROM rtsp/lighttpd:latest

RUN apk add wget

COPY syncWebsite.sh /etc/periodic/15min/
COPY run.sh /root/

ENTRYPOINT []
CMD '/root/run.sh'
