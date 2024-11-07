#!/usr/bin/env bash

source tool/shared/before-install.sh

# Site-specific settings here: currently, none.

travis_fold start before_install.flutter
echo "Refreshing Flutter repo and running doctor:"
(
  set -x;
  cd flutter;
  git checkout beta;
  git pull;
  bin/flutter doctor;
)
travis_fold end before_install.flutter
