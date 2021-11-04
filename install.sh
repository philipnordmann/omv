#!/bin/bash

TINC_NAME="${1}"
GIT_URL="${2}"
GIT_USERNAME="${3}"
GIT_TOKEN="${4}"

if [[ "${1}" == "" ||  "${2}" == "" ||  "${3}" == "" ||  "${4}" == "" ]]; then
    echo "not all arguments provided"
    exit 1
fi

sudo apt-get install python3 python3-venv python3-pip -y
python3 -m venv ansible-venv
${PWD}/ansible-venv/bin/pip3 install --upgrade pip
${PWD}/ansible-venv/bin/pip3 install ansible

${PWD}/ansible-venv/bin/ansible-playbook install.yml -e "git_repo_url=${GIT_URL}" -e "git_username=${GIT_USERNAME}" -e "git_token=${GIT_TOKEN}" -e "tinc_name=${TINC_NAME}" --ask-become-pass