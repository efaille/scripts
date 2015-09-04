#!/bin/sh

upgrade_server() {
  apt-get update && apt-get upgrade -y
}

install_ssh() {
  apt-get update && apt-get install openssh-server
}

configure_ssh() {
  service ssh restart
}

setup() {
  upgrade_server
  install_ssh
  configure_ssh
}

setup
