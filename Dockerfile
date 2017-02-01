FROM debian:8
MAINTAINER Jakub Kwiatkowski <jakub@ajbisoft.pl>
COPY sources.list /etc/apt/
RUN apt-get update && apt-get -y install postgresql \
	&& apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY docker-entrypoint.sh /
EXPOSE 5432
USER postgres
CMD ["/usr/lib/postgresql/9.4/bin/postgres", "-D", "/var/lib/postgresql/9.4/main", "-c", "config_file=/etc/postgresql/9.4/main/postgresql.conf"]
