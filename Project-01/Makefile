# ------------------
# TERRAFORM-MAKEFILE
# v0.12.5
# ------------------
#
# Terraform makefile is a helper to run terraform commands
# on separate providers
#
# Copyright (C) 2017  Paul(r)B.r
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# This Makefile is maintained on Github.com.
# Please contribute upstream any changes by opening pull requests:
# https://github.com/paulRbr/terraform-makefile/pull/new/master
# Thanks! - Paul(rbr)


##
# INTERNAL VARIABLES
##
# Read all subsquent tasks as arguments of the first task
RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(args) $(RUN_ARGS):;@:)
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
landscape   := $(shell command -v landscape 2> /dev/null)
terraform   := $(shell command -v terraform 2> /dev/null)
#debug       :=


##
# TASKS
##

.PHONY: dev-apply
dev-apply: ## Apply it on Dev Environment
	@cd DEV-ENV && terraform init
	@cd DEV-ENV && terraform apply -auto-approve -var AWS_REGION=${AWS_DEFAULT_REGION} -var VAULT_PASS=${VAULT_PASS} -var SSH_USER=${SSH_USR} -var SSH_KEY=${SSH}


.PHONY: dev-destroy
dev-destroy: ## Destroy DEV Environment
	@cd DEV-ENV && terraform init
	@cd DEV-ENV && terraform destroy -auto-approve -var AWS_REGION=${AWS_DEFAULT_REGION} -var VAULT_PASS=${VAULT_PASS} -var SSH_USER=${SSH_USR} -var SSH_KEY=${SSH}

.PHONY: test-apply
test-apply: ## Apply it on Dev Environment
	@cd TEST-ENV && terraform init
	@cd TEST-ENV && terraform apply -auto-approve -var AWS_REGION=${AWS_DEFAULT_REGION} -var VAULT_PASS=${VAULT_PASS} -var SSH_USER=${SSH_USR} -var SSH_KEY=${SSH}


.PHONY: test-destroy
test-destroy: ## Destroy DEV Environment
	@cd TEST-ENV && terraform init
	@cd TEST-ENV && terraform destroy -auto-approve -auto-approve -var AWS_REGION=${AWS_DEFAULT_REGION} -var VAULT_PASS=${VAULT_PASS} -var SSH_USER=${SSH_USR} -var SSH_KEY=${SSH}

.PHONY: prod-apply
prod-apply: ## Apply it on Prod Environment
	@cd PROD-ENV && terraform init
	@pwd
	@cd PROD-ENV && terraform apply -auto-approve -var AWS_REGION=${AWS_DEFAULT_REGION} -var VAULT_PASS=${VAULT_PASS} -var SSH_USER=${SSH_USR} -var SSH_KEY=${SSH}
.PHONY: prod-apply
prod-destroy: ## Destroy it on Prod Environment
	@cd PROD-ENV && terraform init
	@cd PROD-ENV && terraform destroy -auto-approve -var AWS_REGION=${AWS_DEFAULT_REGION} -var VAULT_PASS=${VAULT_PASS} -var SSH_USER=${SSH_USR} -var SSH_KEY=${SSH}

.PHONY: r53-apply
r53-apply: ## SetupRoute53
	@cd PROD-ROUTE53 && terraform init
	@cd PROD-ROUTE53 && terraform apply -auto-approve -var ALB_DNS_NAME=${ALB_DNS_NAME}


help:
	@printf "\033[32mTerraform-makefile v$(version)\033[0m\n\n"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help

