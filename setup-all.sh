#!/bin/sh

install_docker() {
  curl -sSL https://get.docker.com/ | sh
}

pull_docker_images() {
  docker pull efaille/ubuntu
}

setup() {
  install_docker
  pull_docker_images
}

setup
