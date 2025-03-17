#!/bin/bash
# Usage: ./check_permissions.sh /path/to/directory username

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <directory> <username>"
    exit 1
fi

DIRECTORY=$1
USER=$2

echo "Checking permissions for directory: $DIRECTORY for user: $USER"
# Get directory owner, group, and permission bits
OWNER=$(stat -c '%U' "$DIRECTORY")
GROUP=$(stat -c '%G' "$DIRECTORY")
PERMISSIONS=$(stat -c '%A' "$DIRECTORY")

echo "Owner: $OWNER"
echo "Group: $GROUP"
echo "Permissions: $PERMISSIONS"

# Additional check: see if the user is the owner or belongs to the group
if [ "$USER" == "$OWNER" ]; then
    echo "$USER is the owner of $DIRECTORY."
else
    # Check group membership
    if id -nG "$USER" | grep -qw "$GROUP"; then
        echo "$USER is a member of the group $GROUP for $DIRECTORY."
    else
        echo "$USER is neither the owner nor a member of the group $GROUP for $DIRECTORY."
    fi
fi

