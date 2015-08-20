#!/bin/sh

install_docker() {
  curl -sSL https://get.docker.com/ | sh
}

setup() {
  install_docker
}

setup
