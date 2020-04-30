## Terraform

### Commands

```sh
terraform plan -o plan.tfplan
terraform apply
```

### Graph to SVG

terraform graph | dot -T svg > test.svg                             
firefox "file://$(pwd)/test.svg"  
