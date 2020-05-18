#!/bin/sh

# Run in strict mode
set -eu

# Set deploy key
SSH_PATH="$HOME/.ssh"
mkdir -p "$SSH_PATH"
echo "$DEPLOY_KEY" > "$SSH_PATH/deploy_key"
chmod 600 "$SSH_PATH/deploy_key"

# RSYNC Deployment
sh -c "rsync ${RSYNC_ARGS} -e 'ssh -i $SSH_PATH/deploy_key -o StrictHostKeyChecking=no' $GITHUB_WORKSPACE/${SRC:-""} ${USER_HOST}:${DEST}"
