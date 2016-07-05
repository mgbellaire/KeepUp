#!/bin/bash

# TODO: Do the work.

# Set up environment.
if [ ! -d ./src ]; then
  # Create directory for loading binaries later used to work work around
  # warning messages like Composer's "xdebug is enabled" message.
  mkdir ./src
fi

# Homebrew.
if [ -x "$(command -v brew)" ]; then
  # Update Homebrew packages.
  brew update
  # Upgrade Homebrew packages.
  brew upgrade all
fi

# Composer.
if [ -x "$(command -v composer)" ]; then
  # Download PHP binary for composer.
  # Instructions taken from https://getcomposer.org/download/.
  if [ ! -e ./src/composer.phar ]; then
    cd ./src
    php -nr "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -nr "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -nr "unlink('composer-setup.php');"

    # Jump back into main directory.
    cd ..
  fi

  # Update Composer packages that live in ~/.composer.
  # Run without using php.ini via "-n" switch.
  php -n ./src/composer.phar global update
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
