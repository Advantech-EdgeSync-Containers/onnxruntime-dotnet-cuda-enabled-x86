#!/bin/bash
# Verify CUDA path configuration

echo "===== CUDA Path Test ====="
echo "Checking for CUDA installation..."

# Check if CUDA is in PATH
echo "PATH = $PATH"
echo

# Check for nvcc in PATH
which nvcc
if [ $? -eq 0 ]; then
    echo "nvcc found in PATH"
    nvcc -V
else
    echo "nvcc NOT found in PATH!"
    
    # find nvcc on the system
    echo "Searching for nvcc on the system..."
    find /usr -name nvcc 2>/dev/null
    
    # Check if CUDA is installed in standard locations
    if [ -d "/usr/local/cuda" ]; then
        echo "CUDA found in /usr/local/cuda"
        echo "CUDA binaries:"
        ls -la /usr/local/cuda/bin
        
        # run nvcc directly
        echo "Trying to run nvcc directly:"
        /usr/local/cuda/bin/nvcc -V
        
        # Fix PATH if needed
        echo -e "\nTo fix this issue, add the following to your .bashrc:"
        echo 'export PATH=/usr/local/cuda/bin:$PATH'
        echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH'
    else
        echo "CUDA installation not found in standard location (/usr/local/cuda)"
        echo "Checking other possible locations:"
        ls -la /usr/local/ | grep cuda
    fi
fi

# Check for CUDA libraries
echo -e "\nChecking CUDA libraries:"
echo "LD_LIBRARY_PATH = $LD_LIBRARY_PATH"
if [ -d "/usr/local/cuda/lib64" ]; then
    echo "CUDA libraries found in /usr/local/cuda/lib64:"
    ls -la /usr/local/cuda/lib64 | grep -E 'libcudart|libcuda' | head -3
    echo "..."
else
    echo "CUDA libraries not found in standard location"
fi

# Check cuDNN installation
echo -e "\nChecking cuDNN installation:"
find /usr -name cudnn.h 2>/dev/null | head -1

echo -e "\nQuick fix to make nvcc available in current session:"
echo 'export PATH=/usr/local/cuda/bin:$PATH'
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH'