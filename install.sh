#!/bin/bash

OVPN_TMP_DL_URL="${1}"
OVPN_USERNAME="${2}"
OVPN_PASSWORD="${3}"

if [[ "${1}" == "" ||  "${2}" == "" ||  "${3}" == "" ]]; then
    echo "not all arguments provided"
    exit 1
fi

sudo apt-get install python3 python3-venv python3-pip -y
python3 -m venv ansible-venv
${PWD}/ansible-venv/bin/pip3 install --upgrade pip
${PWD}/ansible-venv/bin/pip3 install ansible

${PWD}/ansible-venv/bin/ansible-playbook install.yml -e "ovpn_download_url=${OVPN_TMP_DL_URL}" -e "ovpn_username=${OVPN_USERNAME}" -e "ovpn_password=${OVPN_PASSWORD}" --ask-become-pass