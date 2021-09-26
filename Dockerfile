FROM nginx

EXPOSE 80 443

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf
