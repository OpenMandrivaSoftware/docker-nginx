FROM ubuntu:trusty
MAINTAINER alexander@mezon.ru

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:nginx/stable && \
    apt-get update && \
    apt-get install -y nginx-full && \
    mkdir -p /tmp/{1,2,3,4,5,6,7,8,9,10} \
    apt-get clean

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
