FROM beecastle/rsync-ssh:latest

MAINTAINER Hamish Rickerby <hamish@beecastle.com>

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
