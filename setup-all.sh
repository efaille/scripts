#!/bin/sh

install_docker() {
  curl -sSL https://get.docker.com/ | sh
}

pull_docker_images() {
  docker pull efaille/ubuntu
}

setup() {
  pull_docker_images
}

setup
