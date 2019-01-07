FROM nginx

RUN apt-get update && apt-get install -y cron \
&& mkdir /usr/share/nginx/html/images \
&& echo '*/1 * * * * bash -c /usr/share/nginx/html/images/main.sh' > cron.conf \
&& crontab cron.conf

WORKDIR /usr/share/nginx/html/