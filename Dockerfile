FROM ubuntu:latest
MAINTAINER testuser@test.com

RUN	apt-get update

COPY target/automation-0.0.1-SNAPSHOT.jar /
