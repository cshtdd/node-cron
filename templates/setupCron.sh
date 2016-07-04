#!/bin/bash
echo "Starting node-cron"

cp /etc/cron.daily/logrotate /etc/cron.hourly/logrotate

env                                           >> /tmp/.env
cat /tmp/.env                                 >> /etc/cron.d/my-cron-job
echo -n "$TASK_SCHEDULE" | cat - /tmp/crontab >> /etc/cron.d/my-cron-job

echo "Running cron"

cron && tail -f /var/log/cron.log
