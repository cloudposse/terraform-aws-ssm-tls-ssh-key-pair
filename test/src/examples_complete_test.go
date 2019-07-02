package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// Test the Terraform module in examples/complete using Terratest.
func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/complete",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.us-west-1.tfvars"},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	sshKeyName := terraform.Output(t, terraformOptions, "ssh_key_name")

	expectedSHHKeyName := "eg-test-ssm-tls-ssh-key-pair"
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedSHHKeyName, sshKeyName)

	// Run `terraform output` to get the value of an output variable
	kmsKeyArn := terraform.Output(t, terraformOptions, "kms_key_arn")

	// Verify we're getting back the outputs we expect
	assert.Contains(t, kmsKeyArn, "arn:aws:kms:us-west-1:126450723953:key/")

	// Run `terraform output` to get the value of an output variable
	kmsAliasName := terraform.Output(t, terraformOptions, "kms_alias_name")

	expectedKmsAliasName := "alias/eg-test-ssm-tls-ssh-key-pair"
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedKmsAliasName, kmsAliasName)
}
