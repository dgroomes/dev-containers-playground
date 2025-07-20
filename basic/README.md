# basic

Use the DevContainers CLI to create and develop inside a container with basic development tools installed.


## Overview

Let's define and run a development container by layering in a publicly maintained Development Containers [*feature*][dev-containers-features] like the [Go language](https://github.com/bartventer/arch-devcontainer-features/tree/main/src/go) feature.

This is a basic starter example for getting up and running with DevContainers.


## Instructions

Follow these instructions to build and run the dev container.

1. Pre-requisites: Docker and the `devcontainers` CLI
   * I'm using Docker Desktop
   * I installed the `devcontainers` CLI from npm with the following command.
   * ```shell
     npm install -g @devcontainers/cli
     ```
2. Create and start a dev container:
   * ```shell
     devcontainer up --workspace-folder .
     ```
3. Attach the container into a shell session:
   * ```shell
     devcontainer exec --workspace-folder . bash
     ```
4. Build and run the `hello.go` Go program
   * Run this command inside the shell session in the container.
   * ```shell
     go run hello.go
     ```
   * Altogether, it should look something like the following.
   * ```shell
     vscode ➜ /workspaces/dev-containers-playground/basic (devpod) $ go run hello.go
     Hello from a Go program! The host OS is linux/arm64
     ```
   * Great, now you're cooking. You're in a development environment with the tools you need, like the Go language toolchain.
   * (Why is 'vscode' in the prompt? What is it about the `mcr.microsoft.com/devcontainers/base:debian-12` image that says "vscode" instead of a generic DevContainer container?)
5. Stop and remove the container:
    * Oddly, the DevContainers CLI has never implemented the 'down' command. See the related note later in this README. So you'll need to come up with the right container ID/name in your `docker stop` and `docker rm` commands.


## Warning: the DevContainers CLI is not fit for use

I recommend not using the DevContainers CLI for any development work.

I started exploring the DevContainers spec in 2022, and found that the tooling wasn't quite a fit for me yet. Although it was promising, especially because I had some success doing remote development in my favorite IDEs (JetBrains IDEs).

In 2025, I've found, so far, that the DevContainers ***CLI*** is still not a good fit for me.

In 2022, I ran into what became my deal-breaker issue with the CLI: [forwardPorts configuration option not working](https://github.com/devcontainers/cli/issues/186). In 2025, I wouldn't have imagined this feature is still unimplemented. But, it's still unimplemented. Here are a couple of other unimplemented features in the same vein:

* [Down command #386](https://github.com/devcontainers/cli/issues/386)
* [Add the ability to start and exec into a devcontainer (docker run -it) #943](https://github.com/devcontainers/cli/issues/943)

Also, the CLI is also implemented in TypeScript and requires Node.js. This is an unusual choice for container-based tooling because it is typically dominated by Go. I found that the error messages and stacktraces of the CLI were verbose and indirect. This is generally more common in Node.js devtools compared to Go devtools (not always, to be fair!).

Thankfully, the [DevPod][dev-pod] project has a clean-room implementation of the DevContainers spec and is written in Go. I'm very interested to try this out.
There is some basic functionality that has gone unimplemented for longer than you would expect for a project with such a backing (Microsoft) and with such a long life (since 2022). Here are the ones I've run into:


[dev-containers-features]: https://containers.dev/features
[dev-pod]: https://github.com/loft-sh/devpod
