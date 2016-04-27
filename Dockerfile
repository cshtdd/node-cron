FROM node:5
RUN apt-get update && apt-get install -y cron

RUN mkdir -p /usr/src/app

RUN echo ' root cd /usr/src/app && npm start >> /var/log/cron.log 2>&1           \n\
# An empty line is required                                                      \n\
' > /tmp/crontab

RUN touch /etc/cron.d/my-cron-job
RUN chmod 0644 /etc/cron.d/my-cron-job
RUN touch /var/log/cron.log


RUN echo '#!/bin/bash                                                     \n\
env                                           >> /tmp/.env                \n\
cat /tmp/.env                                 >> /etc/cron.d/my-cron-job  \n\
echo -n "$TASK_SCHEDULE" | cat - /tmp/crontab >> /etc/cron.d/my-cron-job  \n\
cron && tail -f /var/log/cron.log                                         \n\
' > /tmp/setupCron.sh
RUN chmod +x /tmp/setupCron.sh

CMD ["/tmp/setupCron.sh"]
