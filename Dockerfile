ARG BASE_IMAGE=nvcr.io/nvidia/deepstream:5.1-21.02-triton
FROM ${BASE_IMAGE}

# Install dependencies
RUN apt-get update --fix-missing && apt-get install -y \
   python3-dev \
   python3-pip \
   python3-setuptools \
   python3-gi \
   python3-gst-1.0 \
   python3-opencv \
   python3-numpy -y \
   && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY apps /opt/nvidia/deepstream/deepstream-5.1/sources/apps
# Set the WORKDIR and default ENTRYPOINT command
# Unfortunately the base container sets an ENTRYPOINT, not a CMD, so it is a
# very awkward to use this container except as a shell command.
# To do development, uncomment the 2 lines below, and comment the other two.
WORKDIR /outside
ENTRYPOINT /bin/bash