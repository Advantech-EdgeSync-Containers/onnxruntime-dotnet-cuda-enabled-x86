# ONNX Runtime .NET on CUDA-enabled x86

**Version:** 1.0 | **Release Date:** July 2025 | **Copyright:** © 2025 Advantech Corporation

## Overview

The **.NET-x86-GPU-passthrough** provides a comprehensive environment for .NET development support and GPU Usage.

## Repository Structure

```
.NET-X86-GPU-PASSTHROUGH/
└── dotnet_x86_gpu_passthrough/   # .NET x86 GPU passthrough container
    ├── build.sh                  # Build script for .NET x86 GPU passthrough container
    ├── wise-test.sh/             # WiseTest 
    ├── cuda_diagnostic.sh        # CUDA diagnostic script
    └── docker-compose.yml        # Docker configuration
```

## Host Installation Requirements

### .NET x86 GPU Passthrough Container Requirements
- NVIDIA GPU (tested on RTX 4000 Ada Generation)
- NVIDIA driver 550.120 or later
- NVIDIA Container Toolkit 

## Quick Start Guide

### Clone the Repository

```bash
# Clone the repository
git clone https://github.com/Advantech-EdgeSync-Containers/.NET-x86-GPU-passthrough.git
cd .NET-x86-GPU-passthrough
```

### Choose Your Container

#### For AI development with GPU passthrough (.NET x86 GPU Passthrough):

```bash
cd dotnet_x86_gpu_passthrough
chmod +x build.sh
./build.sh
```

## .NET x86 GPU Passthrough Container

The Advantech .NET x86 GPU Passthrough container provides a pre-configured CUDA and .NET development environment with GPU passthrough capabilities, designed for industrial AI and machine learning applications. This solution simplifies the deployment of GPU-accelerated workloads in edge computing environments while ensuring consistent, reproducible results across development and production environments.

## Validated Hardware Platform

The Advantech .NET x86 GPU Passthrough has been thoroughly tested and validated on the following hardware platform:

- **CPU**: AMD EPYC 7543P 32-Core Processor (64 logical cores)
- **Memory**: 642GB RAM (642GB available)
- **GPU**: 1x NVIDIA RTX 4000 Ada Generation (20GB VRAM)
- **Operating System**: Ubuntu 22.04.5 LTS (Jammy Jellyfish)
- **Kernel Version**: 6.5.0-18-generic
- **NVIDIA Driver**: 575.64.03
- **CUDA Version**: 12.9
- **cuDNN Version**: 8.9.7

## Test Results

The diagnostic report confirms full functionality of all GPU components:

```
====== FINAL REPORT ======
✅ ALL CHECKS PASSED: Your CUDA environment appears to be properly configured

┌─────────────────────────────────────────────────────┐
│ CUDA Environment Summary                            │
├───────────────────────┬─────────────────────────────┤
│ Overall Status        │ PASS                        │
├───────────────────────┼─────────────────────────────┤
│ NVIDIA Driver         │ 575.64.03                   │
│ CUDA Version          │ 12.2                        │
│ cuDNN Version         │ 8.9.7                       │
│ GPU Count             │ 1                           │
├───────────────────────┼─────────────────────────────┤
│ Driver Status         │ ✓ Passed                    │
│ CUDA Toolkit Status   │ ✓ Passed                    │
│ cuDNN Status          │ ✓ Passed                    │
│ CUDA Test Status      │ ✓ Passed                    │
└───────────────────────┴─────────────────────────────┘
```

### GPU Performance Validation

Detail of detected GPUs showing full hardware access and acceleration capabilities:

```
Device 0: NVIDIA RTX 4000 Ada Generation
  Compute capability: 8.9
  Total global memory: 18.31 GB
  Multiprocessors: 48
```

### NVIDIA Driver Performance

The container has passed all driver functionality tests with full access to the underlying NVIDIA hardware:

```
Fri Jul 18 09:29:10 2025       
+-----------------------------------------------------------------------------------------+
| NVIDIA-SMI 575.64.03              Driver Version: 575.64.03      CUDA Version: 12.9     |
|-----------------------------------------+------------------------+----------------------+
| GPU  Name                 Persistence-M | Bus-Id          Disp.A | Volatile Uncorr. ECC |
| Fan  Temp   Perf          Pwr:Usage/Cap |           Memory-Usage | GPU-Util  Compute M. |
|                                         |                        |               MIG M. |
|=========================================+========================+======================|
|   0  NVIDIA RTX 4000 Ada Gene...    Off |   00000000:C1:00.0 Off |                    0 |
| 30%   37C    P8             11W /  130W |      15MiB /  19195MiB |      0%      Default |
|                                         |                        |                  N/A |
+-----------------------------------------+------------------------+----------------------+
                                                                                         
+-----------------------------------------------------------------------------------------+
| Processes:                                                                              |
|  GPU   GI   CI              PID   Type   Process name                        GPU Memory |
|        ID   ID                                                               Usage      |
|=========================================================================================|
+-----------------------------------------------------------------------------------------+
```

## GPU Passthrough Capabilities

The Advantech .NET x86 GPU Passthrough container supports full GPU passthrough for:

- NVIDIA RTX/Quadro series (tested with RTX 4000 Ada Generation)
- NVIDIA Tesla/A-series accelerators 
- NVIDIA GeForce RTX/GTX series
- Multi-GPU configurations with automatic load balancing
- Support for CUDA compute capability 8.x to 9.x devices

The container can handle:
- Up to 8 GPUs simultaneously
- Up to 96GB VRAM per GPU
- Mixed GPU types in the same system
- Dynamic GPU allocation

## CUDA and cuDNN Installation Details

### CUDA Installation Paths

The container is configured with the following CUDA paths:

```
CUDA Installation Path: /usr/local/cuda
CUDA Binary Path: /usr/local/cuda/bin
CUDA Library Path: /usr/local/cuda/targets/x86_64-linux/lib
```

### CUDA Library Access

Essential CUDA libraries are properly linked and accessible:

```
libcudart.so -> /usr/local/cuda/targets/x86_64-linux/lib/libcudart.so
libcublas.so -> /usr/local/cuda/targets/x86_64-linux/lib/libcublas.so
libcufft.so -> /usr/local/cuda/targets/x86_64-linux/lib/libcufft.so
libcurand.so -> /usr/local/cuda/targets/x86_64-linux/lib/libcurand.so
libcusparse.so -> /usr/local/cuda/targets/x86_64-linux/lib/libcusparse.so
libcusolver.so -> /usr/local/cuda/targets/x86_64-linux/lib/libcusolver.so
```

Additional libraries included:
- libnvrtc.so - NVIDIA CUDA Runtime Compilation
- libnvjpeg.so - NVIDIA JPEG processing 
- libnvblas.so - NVIDIA BLAS
- libnvToolsExt.so - NVIDIA Tools Extension

### cuDNN Configuration

The container includes cuDNN 8.9.7 with these components:

```
Header location: /usr/include/cudnn.h
Library locations:
  - libcudnn.so.8 -> /usr/lib/x86_64-linux-gnu/libcudnn.so.8
  - libcudnn_ops_train.so.8 -> /usr/lib/x86_64-linux-gnu/libcudnn_ops_train.so.8
  - libcudnn_ops_infer.so.8 -> /usr/lib/x86_64-linux-gnu/libcudnn_ops_infer.so.8
  - libcudnn_cnn_train.so.8 -> /usr/lib/x86_64-linux-gnu/libcudnn_cnn_train.so.8
  - libcudnn_cnn_infer.so.8 -> /usr/lib/x86_64-linux-gnu/libcudnn_cnn_infer.so.8
  - libcudnn_adv_train.so.8 -> /usr/lib/x86_64-linux-gnu/libcudnn_adv_train.so.8
  - libcudnn_adv_infer.so.8 -> /usr/lib/x86_64-linux-gnu/libcudnn_adv_infer.so.8
```

## Pre-installed Development Tools

The Advantech .NET x86 GPU Passthrough container comes with these essential development tools pre-installed:

- **Build Tools**: gcc/g++, make, cmake, build-essential
- **Version Control**: git
- **Python Environment**: Python 3 with pip
- **.NET Environment**: .NET SDK 9.0
- **Utilities**: wget, curl, vim, unzip
- **System Tools**: ca-certificates, gnupg2, lsb-release, software-properties-common

## Production-Ready Features

The container includes several features designed for production deployments:

- **Automatic Restart**: Container configured with `restart: unless-stopped` policy
- **Persistent Storage**: Volume mapping from host to container for data preservation
- **Resource Management**: Shared memory allocation (8GB) optimized for deep learning
- **Error Handling**: Comprehensive error detection in build and verification scripts
- **Version Control**: Support for specific CUDA and cuDNN version selection
- **Environment Persistence**: PATH and LD_LIBRARY_PATH configured for consistent access

## Application Support

The Advantech .NET x86 GPU Passthrough container is optimized for these AI/ML frameworks and applications:

- **Deep Learning Frameworks**: TensorFlow, PyTorch, JAX, MXNet
- **Computer Vision Libraries**: OpenCV, NVIDIA TensorRT
- **HPC Applications**: CUDA-accelerated scientific computing
- **Data Science**: NumPy, SciPy, scikit-learn with GPU acceleration
- **NLP Processing**: BERT, GPT, and transformer models
- **Industrial Applications**: Edge AI, Computer Vision, Predictive Maintenance

## Features

- **Automatic CUDA Detection**: Automatically detects installed CUDA version from your system
- **Flexible Configuration**: Supports command-line configuration of CUDA and cuDNN versions
- **Multi-Version Support**: Compatible with CUDA versions from 11.8 to 12.4 and corresponding cuDNN libraries
- **Complete GPU Passthrough**: Utilizes all available NVIDIA GPUs with full compute capabilities
- **Optimized Memory Management**: Configured with 8GB shared memory for high-performance GPU operations
- **Pre-installed Development Tools**: Ubuntu 22.04 LTS base with essential development packages

## System Requirements

- Host system with NVIDIA GPU(s)
- NVIDIA drivers compatible with CUDA 11.8+
- Docker and Docker Compose
- Linux-based operating system (Ubuntu 20.04+ recommended)

## Quick Start

1. Clone the repository to your local machine
2. Run the build script to detect and configure your CUDA environment:

   ```bash
   ./build.sh
   ```

## Verification and Diagnostics

The container includes diagnostic scripts and .NET test project to check enviroment for access to GPU resources:

### Basic CUDA Path Verification

Run the CUDA path diagnostic script to check your installation configuration:

```bash
cd /advantech
./cuda-diagnostic.sh
```

This script verifies:
- CUDA binary and library paths
- Environment variable configuration
- nvcc compiler availability
- Library dependencies

### Comprehensive CUDA Test

Run the CUDA test script to verify full GPU functionality:

```bash
cd /advantech
./wise-test.sh
```

This script performs:
- NVIDIA driver validation via nvidia-smi
- CUDA toolkit version verification
- cuDNN installation verification
- Compilation and execution of a CUDA test program
- GPU capability detection and reporting

### GPU-enabled ONNX Runtime Execution Provider Test

Follow these steps to run .NET test project:

```bash
cd /app/src/OnnxRuntimeGpuTest/
dotnet run
```

## CUDA Compatibility Matrix

| CUDA Version | Min Driver Version | Compatible cuDNN |
|--------------|-------------------|--------------------|
| CUDA 11.8    | 470.57.02         | cuDNN 8.2.x–8.9.x  |
| CUDA 12.0    | 525.60.13         | cuDNN 8.7.x, 8.8.x |
| CUDA 12.1    | 530.30.02         | cuDNN 8.9.x        |
| CUDA 12.2    | 535.54.03         | cuDNN 8.9.x, 8.10.x|
| CUDA 12.3    | 545.23.06         | cuDNN 8.9.x, 8.10.x|
| CUDA 12.4    | 550.27.05         | cuDNN 9.0.x        |

## Environment Variables

The container is configured with the following key environment variables:

- `NVIDIA_VISIBLE_DEVICES=all`: Makes all GPUs available to the container
- `NVIDIA_DRIVER_CAPABILITIES=compute,utility`: Enables compute and utility functions
- `PATH=/usr/local/cuda/bin:${PATH}`: Ensures CUDA binaries are accessible
- `LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH}`: Ensures CUDA libraries are accessible


### Using the Container

#### X11 Forwarding
The container is configured with X11 forwarding to support GUI applications. The build script automatically sets up environment variables:
- XAUTHORITY
- XDG_RUNTIME_DIR

#### Docker Configuration
The container uses the following Docker settings:
- NVIDIA runtime enabled
- Hardware acceleration configured
- Host network mode
- Volumes mounted for persistent storage

### Best Practices

- Pre-allocate GPU memory where possible
- Batch inference for better throughput
- Monitor GPU usage with `nvidia-smi`
- Balance loads between available GPUs

## Troubleshooting

- **GPU Access Issues**: Verify NVIDIA driver installation with `nvidia-smi`
- **CUDA Errors**: Check compatibility between driver and CUDA versions
- **Container Startup Failures**: Ensure NVIDIA Container Toolkit is installed

## Support and Contact

For other issues with these containers:
- Contact Advantech support

---

**Copyright © 2025 Advantech Corporation. All rights reserved.**
