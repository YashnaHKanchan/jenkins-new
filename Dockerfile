FROM nginx:alpine
 
COPY usr.conf /etc/nginx/conf.d/
COPY index.html /usr/share/nginx/html/