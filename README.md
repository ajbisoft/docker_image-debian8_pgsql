# Docker image: debian8_pgsql

## Description

Official Debian 8 (debian:8) + postgresql docker image with some customization:
* /etc/apt/sources.list modified to include jessie-updates and to use Polish mirror by default
* CMD set to autostart postgresql service

## Usage

There are two main run-time settings that may be passed to newly created container from this image:
* Port must be published when starting container by adding `-p 5432:5432` to your `docker run` statement if you want mysql service to be binded to host interfaces
* There is no VOLUME statement in Dockerfile, so data volume must be attached when starting container by adding `-v <path_to_your_datadir>:/var/lib/postgresql` to your `docker run` statement. Please check permissions as container will not start if those are wrong.

## Example

To successfully start a new container using this image please specify port (here port 3306) and volume options as in following example:
`docker run -dp 5432:5432 -v <path_to_your_datadir>:/var/lib/postgresql --name <your-app-name> ajbisoft/debian8_pgsql`
This will expose and publish mysql container on port 5432 on all host interfaces, but you may skip `-p 5432:5432` option and use container linking to access PostgreSQL container from within your app.

## Summary

This docker image is best suited for simple PostgreSQL applications. It can be used to make PostgreSQL service avaiable on your host or it may be used within container network only. To run PHP web applications with this container you might be interested in my `ajbisoft/debian8_lapp` container.

Should you need to use another database backend (like MySQL) with your project, please see my other docker images!
