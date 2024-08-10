.PHONY: help

TERRAFORM_COMMON_DIR = terraform/common
SAKURA_SSH_WEB_KEY = id_rsa_sakura_web

help:
	@echo "Available targets:"
	@echo "  run-dev     - Start the development server"
	@echo "  ssh-keygen  - Generate SSH keys"

run-dev:
	python manage.py runserver 0.0.0.0:8000

ssh-keygen:
	@terraform -chdir=$(TERRAFORM_COMMON_DIR) init
	@terraform -chdir=$(TERRAFORM_COMMON_DIR) apply -quiet
	@mkdir -p .ssh
	@terraform -chdir=$(TERRAFORM_COMMON_DIR) output -raw web_private_key > .ssh/$(SAKURA_SSH_WEB_KEY)
