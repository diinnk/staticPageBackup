# staticPageBackup
Quick and dirty tool to wget a page for hosting an emergency/backup version of a website with minimal read/render functionality

## Environment variables
- SITES_TO_BACKUP (required)
  - Multiple sites can be provided. Sites separated by a semicolon. First site is considered the primary and will be forced as the index for the site.
- EXCLUDE_JS (optional, defaults to 0)
  - 1 (enabled) or 0 (disabled). Forcibly excludes any javascript files backed up.

## example docker/podman usage:

```
docker build -t staticpagebackup .

docker run -it --rm --name spb -e SITES_TO_BACKUP="<yoursite.com;your2ndSite.com>" -v /path/to/staticPageBackup/html:/var/www/html -p 8080:80 staticpagebackup
```