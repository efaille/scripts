#!/bin/sh

upgrade_server() {
  apt update && apt upgrade -y
}

increase_swap() {
  fallocate -l 4G /swapfile
  chmod 600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo "/swapfile   none    swap    sw    0   0" >> /etc/fstab
}

install_docker() {
  curl -sSL https://get.docker.com/ | sh
}

run_nginx_proxy() {
  docker run --name nginx-proxy --restart=always -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock efaille/nginx-proxy
}

run_personal_website() {
  docker run --name erickfaille.com --restart=always -d -e VIRTUAL_HOST=erickfaille.com,www.erickfaille.com efaille/erickfaille.com
}

setup() {
  upgrade_server
  increase_swap
  install_docker

  run_nginx_proxy
  run_personal_website
}

setup
