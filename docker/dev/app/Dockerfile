FROM ruby:2.7.2
ENV APP_ROOT /var/www/joynto

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    build-essential \
    nodejs

WORKDIR $APP_ROOT

RUN gem install bundler

RUN apt-get update -y && apt-get install -y nginx supervisor
RUN mkdir -p /var/log/supervisor
RUN groupadd nginx
RUN useradd -g nginx nginx
ADD app/nginx/nginx.conf /etc/nginx/nginx.conf
ADD app/nginx/joynto.conf /etc/nginx/conf.d/joynto.conf
ADD app/supervisor/app.conf /etc/supervisor/conf.d/app.conf

EXPOSE 3000
CMD ["/usr/bin/supervisord"]
