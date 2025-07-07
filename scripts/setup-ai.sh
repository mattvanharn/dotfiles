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
docker run --rm --gpus all nvidia/cuda:12.2.0-base nvidia-smi
