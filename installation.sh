#!/bin/bash
set -euo pipefail

USERID=$(id -u)

if [ "$USERID" -ne 0 ]; then
  echo "ERROR:: You must have sudo/root access to execute this script."
  exit 1
fi

# Check and install MySQL
if ! dnf list installed mysql &>/dev/null; then
  echo "MySQL not found. Installing..."
  if dnf install mysql -y; then
    echo "Installing MySQL... success"
  else
    echo "Installing MySQL... failure"
    exit 1
  fi
else
  echo "MySQL is already installed."
fi

# Check and install Git
if ! dnf list installed git &>/dev/null; then
  echo "Git not found. Installing..."
  if dnf install git -y; then
    echo "Installing Git... success"
  else
    echo "Installing Git... failure"
    exit 1
  fi
else
  echo "Git is already installed."
fi
