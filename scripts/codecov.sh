#!/usr/bin/env bash

set -o pipefail

TOKEN="${1}"
export CODECOV_TOKEN=${TOKEN}
bash <(curl -s https://codecov.io/bash)