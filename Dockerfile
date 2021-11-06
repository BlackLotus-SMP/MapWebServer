FROM nginx

EXPOSE 80 443

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./certs/ /etc/nginx/certs/

RUN apt update && apt -y install software-properties-common cron && apt update && apt -y install certbot python-certbot-nginx && echo "00 00 5,10,15,20,25 * * certbot renew --nginx" > crn
