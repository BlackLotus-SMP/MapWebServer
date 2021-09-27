FROM nginx

EXPOSE 80 443

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./certs/ /etc/nginx/certs/

RUN apt update && apt -y install software-properties-common cron && apt update && apt -y install certbot python-certbot-nginx && certbot --nginx -d otakucraft.kahzerx.com --agree-tos --register-unsafely-without-email --no-redirect && service cron start && echo "00 00 5,10,15,20,25 * * certbot renew --nginx" > crn && crontab crn
