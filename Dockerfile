FROM jenkins/jenkins:lts

USER root

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Go
ENV GO_VERSION=1.20.5
RUN wget https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz \
    && rm go${GO_VERSION}.linux-amd64.tar.gz

# Set Go environment variables
ENV PATH=$PATH:/usr/local/go/bin
ENV GOPATH=/go
ENV PATH=$PATH:$GOPATH/bin

# Install govulncheck and osv-scanner
RUN go install golang.org/x/vuln/cmd/govulncheck@latest \
    && go install github.com/google/osv-scanner/cmd/osv-scanner@v1

# Switch back to jenkins user
USER jenkins