# Get latest release tag (e.g. b9692, b9701, ...)
LATEST=$(curl -s https://api.github.com/repos/ggml-org/llama.cpp/releases/latest | grep '"tag_name"' | cut -d '"' -f 4)
URL="https://github.com/ggml-org/llama.cpp/releases/download/${LATEST}/llama-${LATEST}-bin-ubuntu-vulkan-x64.tar.gz"

echo "Latest release: $LATEST"

# Download
wget -O llama-vulkan.tar.gz "$URL"

# Extract
mkdir -p llama-vulkan
tar -xzf llama-vulkan.tar.gz -C llama-vulkan

# Find llama-server and install it
sudo find llama-vulkan -name llama-server -type f -exec cp {} /usr/bin/llama-server \;

sudo chmod +x /usr/bin/llama-server

# Verify
llama-server --version