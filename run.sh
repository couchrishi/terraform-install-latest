#!/bin/bash -x

trim() {
  # shellcheck disable=SC2001
  echo "$1" | sed -e "s/\\\n\$//"
}

terraform_cli="${WERCKER_STEP_ROOT}/terraform"

$terraform_cli --version

$terraform_cli init

cat terraform.tfvars

echo "terraform ${WERCKER_TERRAFORM_INSTALL_LATEST_COMMAND}"
if ! eval "$terraform_cli ${WERCKER_TERRAFORM_INSTALL_LATEST_COMMAND}"; then
  fail "Invalid command option"
fi