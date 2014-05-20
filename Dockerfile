FROM    	ubuntu:12.04

# Add 10gen official apt source to the sources list
RUN			apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN 		echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

# Install MongoDB
RUN			apt-get update -y
RUN 		apt-get install -y mongodb-10gen=2.4.6

# We should definitely be loading data it from a data container
RUN 		mkdir -p /data/db

EXPOSE 		27017
ENTRYPOINT	["/usr/bin/mongod"]