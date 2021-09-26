FROM nginx

EXPOSE 80 443

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./certs/ /etc/nginx/certs/

RUN apt update && apt -y install software-properties-common && apt update && apt -y install certbot python-certbot-nginx && certbot --nginx -d otakucraft.kahzerx.com --register-unsafely-without-email --no-redirect
