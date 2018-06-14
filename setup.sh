#!/usr/bin/env bash

# install ansible
installAnsible () {
  sudo apt-get update
  sudo apt-get install software-properties-common -y
  sudo apt-add-repository ppa:ansible/ansible
  sudo apt-get update
  sudo apt-get install ansible -y
}

#install kubetcl
installKubetcl () {
  curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
  sudo chmod +x ./kubectl
  sudo mv ./kubectl /usr/local/bin/kubectl
  cp /home/ubuntu/.ssh/authorized_keys ~/.ssh/id_rsa.pub
}

#install kops
installKops () {
  wget https://github.com/kubernetes/kops/releases/download/1.8.0/kops-linux-amd64
  sudo chmod +x kops-linux-amd64
  sudo mv kops-linux-amd64 /usr/local/bin/kops
}

#install awscli
installAwscli () {
  sudo apt-get install awscli -y
}


installAnsible
installKubetcl
installKops
installAwscli