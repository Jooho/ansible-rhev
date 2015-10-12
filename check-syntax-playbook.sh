#!/usr/bin/env bash
# copied from here : https://raymii.org/s/tutorials/Ansible_-_Playbook_Testing.html
set -o errexit
set -o nounset
# set -o xtrace
set -o pipefail

__DIR__="$(cd "$(dirname "${0}")"; echo $(pwd))"
__BASE__="$(basename "${0}")"
__FILE__="${__DIR__}/${__BASE__}"

echo "################################"
echo "Build Information"
echo "Directory: ${__DIR__}"
echo "Filename: ${__FILE__}"
echo "Version Information:"
echo "Ansible Version: $(ansible --version)"
echo "Ansible Playbook Version: $(ansible-playbook --version)"
#echo "Operating System: $(lsb_release -d | awk -F: '{ print $2 }' | tr -d '\t')"
echo "Kernel: $(uname -a)"
echo "################################"

echo "### Starting tests"

find ./rhev_ansible -maxdepth 1 -name '*.yaml'| xargs -n1  ansible-playbook --syntax-check --list-tasks -i test/test_hosts.yaml
