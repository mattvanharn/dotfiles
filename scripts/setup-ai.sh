#!/bin/bash
# AI development environment setup

# NVIDIA drivers
sudo pacman -S --needed nvidia-dkms nvidia-utils libva-nvidia-driver-git

# Containerization
sudo pacman -S --needed docker docker-buildx
sudo systemctl enable docker
sudo usermod -aG docker $USER

# Python environment
sudo pacman -S --needed python-pip python-venv miniconda

# AI tools
pip install torch torchvision --index-url https://download.pytorch.org/whl/cu118

# NVIDIA container toolkit
paru -S nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

# Verification
echo "Verifying AI environment:"

verify_cuda() {
  python3 -c "import torch; print(torch.cuda.is_available())"
}

verify_docker() {
  docker run --rm --gpus all nvidia/cuda:12.2.0-base nvidia-smi
}

if verify_cuda | grep -q True; then
  echo "✅ CUDA available in PyTorch"
else
  echo "❌ CUDA not available"
fi

verify_docker && echo "✅ Docker GPU access working"
