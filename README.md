# Executing

## For personal

ansible-playbook --ask-vault-pass --ask-become-pass local.yml --skip-tags "work"

## For work

ansible-playbook --ask-vault-pass --ask-become-pass work.yml --skip-tags "personal"
