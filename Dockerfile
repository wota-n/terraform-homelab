FROM alpine:3.14

# Install dependencies
RUN apk add --no-cache git curl bash

# Install tfenv
RUN git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
ENV PATH="$PATH:/root/.tfenv/bin"

# Install specific Terraform version
RUN tfenv install 1.9.5
RUN tfenv use 1.9.5

# Verify installation
RUN terraform --version

# Set the working directory
WORKDIR /workspace

# Default command
CMD ["bash"]
