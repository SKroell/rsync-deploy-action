FROM alpine:latest

# Update
RUN apk update

# Install rsync and openssh packages
RUN apk add rsync openssh-client

# Copy and run entrypoint
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]