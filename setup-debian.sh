#!/bin/sh

init_setup() {
  apt update && apt upgrade -y && apt auto-remove -y
  apt install -y curl ssh vim
}

setup_grub() {
  sed -i -e "s/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/" /etc/default/grub
  update-grub
}

setup_ssh() {
  sed -i -e "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config
  service ssh restart
}

setup_vim() {
  echo "set mouse=" > ~/.vimrc
  echo "syntax on" >> ~/.vimrc
}

install_docker() {
  curl -sSL https://get.docker.com/ | sh
}

setup() {
  init_setup
  setup_grub
  setup_ssh
  setup_vim
  install_docker
}

setup
