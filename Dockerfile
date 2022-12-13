# Description: Dockerfile for vscode-server
# Author: inori_aizawa
# Date: 2022-12-13

FROM ubuntu:latest
ENV ACCEPT_SERVER_LICENSE_TERMS=false
WORKDIR /usr/app

# install the dependencies
RUN apt-get update \
    && apt-get install -y wget gnome-keyring dbus-x11
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
#download vscode-server 
RUN wget https://aka.ms/install-vscode-server/setup.sh
# make the setup.sh executable
RUN chmod +x setup.sh /docker-entrypoint.sh
# run the setup.sh and install vscode-server
RUN ./setup.sh 



# expose the port
EXPOSE 8000
# set the volumes
VOLUME [ "/vscode-server-data" ]
VOLUME [ "/root/.vscode-server" ]
VOLUME [ "/home" ]
VOLUME [ "/root/.local/share/keyrings/"]


# run the docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
