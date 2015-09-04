#!/bin/sh

upgrade_server() {
  apt-get update && apt-get upgrade -y
}

install_ssh() {
  apt-get update && apt-get install openssh-server
}

configure_ssh() {
  sed -i -e "s/;PermitRootLogin\s*=\s*without-password/PermitRootLogin = yes/g"
  service ssh restart -y
}

setup() {
  upgrade_server
  install_ssh
  configure_ssh
}

setup
