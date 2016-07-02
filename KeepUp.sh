#!/bin/bash

# TODO: Do the work.
# Homebrew.
if [ -x "$(command -v brew)" ]; then
  # Update Homebrew packages.
  brew update
  # Upgrade Homebrew packages.
  brew upgrade all
fi

# Composer.
if [ -x "$(command -v composer)" ]; then
  # Update Composer packages that live in ~/.composer.
  composer global update
fi

# Drupal
if [ -a ~/.composer/vendor/drupal/coder/coder_sniffer ]; then
  # Update Drupal Coding Standards.
  # Suppress any output from command in favor of a custom response for success/failure.
  phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer > /dev/null
  if [ $? -q 0 ]; then
    echo 'Drupal Coding Standards were updated successfully.'
  else
    echo 'WARNING: Issue updating Drupal Coding Standards. Please run `phpcs --config-set installed_paths ~/.composer/vendor/drupal/coder/coder_sniffer` to debug any errors.'
  fi
fi
