# mesos.apache.org
#
# VERSION 0.0.1

FROM ubuntu:14.04
MAINTAINER "Artem Harutyunyan"

LABEL Description="This image is used to download the source of mesos.apache.org from SVN and Git and generate the web site. Once it's ran it generates the web site and starts the web server serving the site on port 4567."


ADD files/run_site.sh /tmp/run_site.sh
RUN apt-get update
RUN apt-get install -y subversion g++ ruby ruby-dev make rake nodejs git
RUN gem install bundler

EXPOSE 4567

CMD /tmp/run_site.sh
