FROM debian:8
MAINTAINER Jakub Kwiatkowski <jakub@ajbisoft.pl>
COPY sources.list /etc/apt/
RUN apt-get update && apt-get -y install postgresql \
	&& apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY docker-entrypoint.sh /
EXPOSE 5432
USER postgres
ENTRYPOINT ["/docker-entrypoint.sh"]
