ARG BASE_IMAGE=nvcr.io/nvidia/deepstream:5.1-21.02-triton
FROM ${BASE_IMAGE}

# Install dependencies
RUN apt-get update --fix-missing && apt-get install -y \
   ca-certificates \
   build-essential \
   autoconf libtool \
   python3 \
   python3-dev \
   python3-pip \
   python3-setuptools \
   python-gi-dev \
   libgstreamer1.0-dev \
   python3-opencv \
   libgstrtspserver-1.0-0 \
   gstreamer1.0-rtsp \
   libgirepository1.0-dev \
   gobject-introspection \
   gir1.2-gst-rtsp-server-1.0 \
   && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the WORKDIR and default ENTRYPOINT command
# Unfortunately the base container sets an ENTRYPOINT, not a CMD, so it is a
# very awkward to use this container except as a shell command.
# To do development, uncomment the 2 lines below, and comment the other two.
WORKDIR /outside
ENTRYPOINT /bin/bash