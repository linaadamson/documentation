#!/usr/bin/env bash

# Get passed arguments
while getopts r: flag
do
    case "${flag}" in
        r) repo=${OPTARG};;
    esac
done

# Read directory_path and app_name from config.json
DIRECTORY_PATH=$(jq -r '.DIRECTORY_PATH' bin/config.json)
APP_NAME=$(jq -r '.APP_NAME' bin/config.json)

# clone the repo
git clone $repo /var/www/html/doc-service

# Change directory to the cloned repository
cd /var/www/html/doc-service

# Run npm install to install dependencies
npm install

# Run npm run build to build the app
npm run build

# move build folder
mv build/* $DIRECTORY_PATH

# give permissions
chown -R www-data:www-data $DIRECTORY_PATH

#Set up Apache Virtual Host
cp -f bin/apache.conf /etc/apache2/sites-available/${APP_NAME}.conf
a2ensite ${APP_NAME}
service apache2 restart

# remove the doc-service folder
rm -r /var/www/html/doc-service