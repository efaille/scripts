#!/bin/sh

install_docker() {
  curl -sSL https://get.docker.com/ | sh
}

pull_docker_images() {
  docker pull efaille/ubuntu
  docker pull efaille/java
  docker pull efaille/nginx
  docker pull efaille/mongodb
  docker pull efaille/iojs
  docker pull efaille/maven
  docker pull efaille/minecraft
  docker pull efaille/spring-boot
  docker pull efaille/nginx-angularjs
  docker pull efaille/nginx-angularjs-api
  docker pull efaille/nginx-proxy
}

setup() {
  install_docker
  pull_docker_images
}

setup
