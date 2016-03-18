#!/bin/bash
LOGROTATE_FILE=/etc/logrotate.d/$RAILS_ENV
echo $LOGROTATE_FILE
touch $LOGROTATE_FILE
echo $LOGROTATE_FILE
echo $STACK_PATH/log/\*.log > $LOGROTATE_FILE
echo "{" >> $LOGROTATE_FILE
echo "   missingok" >> $LOGROTATE_FILE
echo "   notifempty" >> $LOGROTATE_FILE
echo "   olddir" $STACK_PATH/log/archive
##### This compress the used file after rotation
echo "   compress"  >> $LOGROTATE_FILE

##### This means that you'll allways have the last two logs not compressed
##### If you delete this you will loose the logs written in the window of
##### time that is rotating                        
echo "   delaycompress" >> $LOGROTATE_FILE

##### Size for rotation
##### Keep in mind that the process of running logrotate happens on a daily basis
##### If the size increases a lot that daily check is not enough you'll have 
##### to move the logrotate from /etc/cron.daily to /etc/cron.hourly
echo "   size 100M" >> $LOGROTATE_FILE
echo "   monthly" >> $LOGROTATE_FILE
echo "   create 660 root app_writers" >> $LOGROTATE_FILE
echo "   postrotate"  >> $LOGROTATE_FILE
echo "       service nginx reload" >> $LOGROTATE_FILE
echo "   endscript"  >> $LOGROTATE_FILE
echo "}" >> $LOGROTATE_FILE
unset LOGROTATE_FILE
