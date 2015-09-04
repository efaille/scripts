#!/bin/sh

upgrade_server() {
  apt-get update && apt-get upgrade -y
}

install_ssh() {
  apt-get update && apt-get install -y openssh-server
}

configure_ssh() {
  sed -i -e "s/PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
  service ssh restart
}

install_docker() {
  curl -sSL https://get.docker.com/ | sh
}

setup() {
  upgrade_server
  install_ssh
  configure_ssh
  install_docker
}

setup
