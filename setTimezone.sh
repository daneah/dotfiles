#!/usr/bin/sh

ZONEINFO=/usr/share/zoneinfo
cd $ZONEINFO

echo -n "Complete the path to the timezone file: /usr/share/zoneinfo/"
read -e -p "" TIMEZONE

TIMEZONE=$ZONEINFO/$TIMEZONE

echo "Setting timezone to $TIMEZONE..."
cp /etc/localtime /etc/localtime-old 2>/dev/null
date
read -e -p "Is the time correct? [y/N]: " CHOICE

if [[ "$CHOICE" =~ ^[yY]|yes|Yes|YES$ ]]
then
    ln -sf $TIMEZONE /etc/localtime
    echo "Timezone updated."
else
    echo "Aborted."
fi
