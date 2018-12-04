#!/bin/bash -x

trim() {
  # shellcheck disable=SC2001
  echo "$1" | sed -e "s/\\\n\$//"
}

terraform_cli="${WERCKER_STEP_ROOT}/terraform"

$terraform_cli --version

ls -a
$terraform_cli init

cat ${WERCKER_TERRAFORM_INSTALL_LATEST_VAR_FILE}
echo "$terraform_cli ${WERCKER_TERRAFORM_INSTALL_LATEST_COMMAND}"
ls -a
cat terraform.tfvars
$terraform_cli ${WERCKER_TERRAFORM_INSTALL_LATEST_COMMAND}