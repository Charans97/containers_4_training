# Using Ubuntu as the base image
FROM ubuntu:20.04
 
# To prevent some messages from APT from causing issues
ARG DEBIAN_FRONTEND=noninteractive
 
# Install required packages
RUN apt-get update
 
# Set entry point
CMD ["sh", "-c", "sleep infinity"]
