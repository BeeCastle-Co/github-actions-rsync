#!/bin/sh

set -eu

# Set deploy key
SSH_PATH="$HOME/.ssh"
mkdir -p "$SSH_PATH"
echo "$SSH_PRIVATE_KEY" > "$SSH_PATH/deploy_key"
chmod 600 "$SSH_PATH/deploy_key"

RSYNC_SOURCE="$1"
RSYNC_TARGET="$2"

echo "$RSYNC_SOURCE $RSYNC_TARGET"

# Do deployment
sh -c "rsync ${RSYNC_OPTIONS} -e 'ssh -i $SSH_PATH/deploy_key -o StrictHostKeyChecking=no' ${GITHUB_WORKSPACE}${RSYNC_SOURCE} ${SSH_USERNAME}@${SSH_HOSTNAME}:${RSYNC_TARGET}"
