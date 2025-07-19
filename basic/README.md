# basic

NOT YET IMPLEMENTED

Run a container with a couple Development Containers *features* baked in. This is a basic starter example.


## Overview

Let's define and run a development container by layering in a couple of publicly maintained Development Containers [features][dev-containers-features] like the [SSH server](https://github.com/devcontainers/features/tree/main/src/sshd) feature and the [Go language](https://github.com/bartventer/arch-devcontainer-features/tree/main/src/go) feature.


## Instructions

Follow these instructions to build and run the dev container.

1. Pre-requisites: Docker and the `devcontainers` CLI
   * I'm using Docker Desktop
   * I installed the `devcontainers` CLI from npm with the following command.
   * ```shell
     npm install -g @devcontainers/cli
     ```
2. Start the Dev Container using the CLI:
   * ```bash
     devcontainer up --workspace-folder .
     ```
3. From your host, connect via SSH:
   * ```shell
     TODO
     ```
   * Great, now you're cooking. You're in a development environment with the tools you need, like the Go language toolchain. Try out some development work the next steps.
4. Build and run the `hello.go` Go program
   * Run this command inside the SSH session that's connected to the dev container.
   * ```shell
     TODO
     ```
   * Altogether, it should look something like the following.
   * ```shell
     go run TODO
     
     Hello from a Go program! The host OS is <TODO whatever linux/debian string we can find conventionally> 
     ```

Alternatively, you can get a more compressed workflow by using <TODO some devcontainer command that runs and connects to the container> to both start and connect to the container. I'm personally trying to use SSH to connect to my dev container because my plan is to connect via SSH from my IDE (e.g. VSCode).

[dev-containers-features]: https://containers.dev/features
