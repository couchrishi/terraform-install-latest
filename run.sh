#!/bin/bash -x

trim() {
  # shellcheck disable=SC2001
  echo "$1" | sed -e "s/\\\n\$//"
}

terraform_cli="${WERCKER_STEP_ROOT}/terraform"

if [ -n "${WERCKER_TERRAFORM_INSTALL_LATEST_VAR_FILE}" ]; then
  cd $terraform_cli
  echo ${WERCKER_TERRAFORM_INSTALL_LATEST_VAR_FILE} > terraform.tfvars
  awk '{gsub(/\\n/,"\n")}1' terraform.tfvars
fi

$terraform_cli --version

$terraform_cli init

echo "terraform ${WERCKER_TERRAFORM_INSTALL_LATEST_COMMAND}"
if ! eval "$terraform_cli ${WERCKER_TERRAFORM_INSTALL_LATEST_COMMAND}"; then
  fail "Invalid command option"
fi