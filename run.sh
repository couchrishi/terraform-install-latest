#!/bin/bash -x

trim() {
  # shellcheck disable=SC2001
  echo "$1" | sed -e "s/\\\n\$//"
}

terraform_cli="${WERCKER_STEP_ROOT}/terraform"

$terraform_cli --version

$terraform_cli init

echo "terraform ${WERCKER_TERRAFORM_INSTALL_LATEST_COMMAND} --${WERCKER_TERRAFORM_INSTALL_LATEST_VAR_FILE}"
if ! eval "$terraform_cli ${WERCKER_TERRAFORM_INSTALL_LATEST_COMMAND --${WERCKER_TERRAFORM_INSTALL_LATEST_VAR_FILE}"; then
  fail "Invalid command option"
fi