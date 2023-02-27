FROM nginx:latest

# drop symlinks
RUN unlink /var/log/nginx/access.log
RUN unlink /var/log/nginx/error.log
#config
COPY ./nginx.conf /etc/nginx/nginx.conf

#content, comment out the ones you dont need!
#COPY ./*.html /usr/share/nginx/html/
#copy ./*.css /usr/share/nginx/html/
#copy ./*.png /usr/share/nginx/html/
#copy ./*.js /usr/share/nginx/html/