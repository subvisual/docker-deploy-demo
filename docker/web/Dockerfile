FROM groupbuddies/ruby:2.1.5

ADD nginx.conf /etc/nginx/sites-enabled/default

RUN mkdir -p /etc/service/puma
ADD puma.runit /etc/service/puma/run

ENV APP_NAME ddd
ENV RAILS_ENV production
ENV PORT 3001
ENV SOCKET_PATH /usr/src/app/sockets
