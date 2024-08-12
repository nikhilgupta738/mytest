#!/usr/bin/env bash

set -euo pipefail

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check Docker installation
check_docker() {
    echo "Checking Docker..."
    if ! command_exists docker; then
        echo "Docker is not installed."
        exit 1
    fi

    echo "Docker is installed."

    # Check if Docker daemon is running
    if ! docker info >/dev/null 2>&1; then
        echo "Docker daemon is not running or Docker is not functioning correctly."
        exit 1
    fi

    echo "Docker is running and functioning correctly."
}

# Function to check Docker Compose installation
check_docker_compose() {
    echo "Checking Docker Compose..."
    if ! command_exists docker-compose; then
        echo "Docker Compose is not installed."
        exit 1
    fi

    echo "Docker Compose is installed."
}

# Function to run all checks
run_checks() {
    echo "Starting dependency checks..."

    check_docker
    check_docker_compose

    echo "All dependencies are installed and functioning correctly."
}

# Run the checks
run_checks



