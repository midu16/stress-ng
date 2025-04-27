# Use Fedora 42 as the base image
FROM fedora:42

# Install stress-ng, iperf3, and required dependencies
RUN dnf install -y \
    stress-ng \
    iperf3 \
    python3 \
    curl \
    iputils \
    hostname \
    which \
    bash \
  && dnf clean all

# Set executable permissions for stress-ng and iperf3 binaries (if necessary)
RUN chmod +x /usr/bin/stress-ng /usr/bin/iperf3

# Set PATH explicitly for the binaries (though it's usually not needed in Fedora)
ENV PATH="/usr/bin:$PATH"

# Set the working directory
WORKDIR /tmp

# Default command to run bash shell
CMD ["/bin/bash"]
