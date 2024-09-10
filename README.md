# staticPageBackup
Quick and dirty tool to wget a page for hosting an emergency/backup version of a website with minimal read/render functionality

## example docker/podman usage:

```
docker build -t staticpagebackup .

docker run -it --rm --name spb -e SITE_TO_BACKUP=<yoursite.com> -v /path/to/staticPageBackup/html:/var/www/html -p 8080:80 staticpagebackup
```
