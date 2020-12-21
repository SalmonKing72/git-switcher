#!/bin/bash
# This script asks the user for a time, waits the specified amount
# of time, and shows an alert dialog.

USER=$(zenity --entry --text="Enter your git or github username")
EMAIL=$(zenity --entry --text="Enter your git or github user email address")
KEY=$(zenity --entry --text="Enter the name of your user private key")

git config user.name $USER
git config user.email $EMAIL
eval $(ssh-agent -s)
ssh-add ~/.ssh/$(echo $KEY)
ssh -T git@github.com
git push -n