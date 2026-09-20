# Just a quick script to update the last checked version manually.
# Get current version of Caddy from GitHub API
CADDY_VERSION=$(curl -s https://api.github.com/repos/caddyserver/caddy/releases/latest | jq -r '.tag_name' | cut -c 2-)

echo Changing last checked date with Version $CADDY_VERSION
echo $(date) - $CADDY_VERSION | tee .lastchecked

# Get current version of Caddy from Docker - May not be the same as if container not restarted
DOCKER_CADDY_VERSION=$(docker compose exec caddy caddy version| cut -d ' ' -f 1 | cut -c 2-)
echo Currently used Caddy Version: $DOCKER_CADDY_VERSION

if [ "$CADDY_VERSION" != "$DOCKER_CADDY_VERSION" ]; then
    echo "Caddy version has changed. Updating Dockerfile to use version $CADDY_VERSION"
    sed -i "s/^ARG CADDY_VERSION=.*/ARG CADDY_VERSION=$CADDY_VERSION/" Dockerfile
    # Build and restart the Caddy container
    echo "Building and restarting Caddy container..."
    docker compose build --no-cache caddy
    docker compose up -d caddy
else
    echo "Caddy version has not changed. No update needed."
fi

echo Done!


