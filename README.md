# Executing

1. Install ansible and git `sudo apt-get install ansible git`
2. Clone this repo `git clone https://github.com/lorrandavid/ansible`
3. Run it using one of the commands below

ansible-playbook --ask-vault-pass --ask-become-pass local.yml --skip-tags "personal"
ansible-playbook --ask-vault-pass --ask-become-pass local.yml --skip-tags "work"
