#!/bin/sh

#SITES_TO_BACKUP="staytuned.plen.ch/barMenu;staytuned.plen.ch/singleColumnMenu"
#EXCLUDE_JS=1

i=0
EXCLUDE_JS_FINAL=$(echo "${EXCLUDE_JS:-0}")
SITES=$(echo $SITES_TO_BACKUP | tr ";" "\n")

for SITE in $SITES
do
  i=$((i+1))
  CLEAN_SITE=$(echo $SITE | sed 's/[^0-9a-zA-Z\.]*//g')

  wget -r -p -np -k --no-host-directories --html-extension --directory-prefix=$CLEAN_SITE $SITE

  if [ "$?" -eq "0"  ];
  then
    if [ "$EXCLUDE_JS_FINAL" -eq "1" ]; then rm -rf $CLEAN_SITE/assets/javascripts/; fi
    FOUND_INDEX_DOT_HTML=$(find $CLEAN_SITE -type f -name "index.html")
    if [ "$i" -eq "1" ]
    then
      if [ -z "$FOUND_INDEX_DOT_HTML" ]
      then
        echo "FOUND NO INDEX"
        FOUND_TOP_HTML_FILE=$(find $CLEAN_SITE -type f -name "*.html" | head -n1)
        echo $FOUND_TOP_HTML_FILE
        mv $FOUND_TOP_HTML_FILE $(dirname $FOUND_TOP_HTML_FILE)"/index.html"
      fi
    fi

    cp -r $CLEAN_SITE/* /var/www/html/
    echo "$(date) - Exit code 0, website updated from $SITE" # >> /root/cron.log
  else
    echo "$(date) - Non-exit code 0 encountered, website not updated from $SITE" # >> /root/cron.log
  fi
done




