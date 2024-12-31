default:
	rm -rf .terraform
	terraform init -backend-config=env-$(env)/backend.tfvars
	terraform $(action) -auto-approve -var-file=env-$(env)/main.tfvars

dev-apply:
	rm -rf .terraform
	terraform init -backend-config=env-dev/backend.tfvars
	terraform apply -auto-approve -var-file=env-dev/main.tfvars -var vault_token=hvs.DQho8IQB3MKgd4k1BgMuvTrG

dev-destroy:
	rm -rf .terraform
	terraform init -backend-config=env-dev/backend.tfvars
	terraform destroy -auto-approve -var-file=env-dev/main.tfvars

prod:
	rm -rf .terraform
	terraform init -backend-config=env-prod/backend.tfvars
	terraform apply -auto-approve -var-file=env-prod/main.tfvars

prod-destroy:
	rm -rf .terraform
	terraform init -backend-config=env-prod/backend.tfvars
	terraform destroy -auto-approve -var-file=env-prod/main.tfvars