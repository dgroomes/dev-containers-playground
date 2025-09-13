# custom

Author custom DevContainer *features* to define a development container tailored to your exact needs.


## Overview

While the publicly maintained [DevContainers *features*][dev-containers-features] will get you started with a development container, you will find some gaps between what's available compared to the exact bespoke dev environment needs you have. Thankfully, the DevContainers spec makes it easy to write your own features and fill in the missing feature gaps.

It boils down to some JSON and a custom `install.sh` shell script. This subproject demonstrates some custom features to get up and running with a Rust development environment.

In this example, I'm using [DevPod][devpod] instead of the DevContainers CLI because I'm finding that DevPod:

* Has clearer build output (colorized)
* Has less noise (fewer internal implementation details leaking out, like Node.js stracktraces)
* Has error messages (DevContainers CLI seems to assume happy path only)
* Is overall smoother and more featureful than the DevContainers CLI.  


## Instructions

Follow these instructions to build and run the dev container.

1. Pre-requisites: Docker and DevPod
   * I'm using Docker Desktop
   * I installed DevPod with the following command.
   * ```shell
     brew install --cask devpod
     ```
   * With DevPod, you need to configure a *provider*. I used the following command to set up the Docker provider.
   * ```shell
     devpod provider add docker
     ```
   * Similarly, I configured DevPod to not start an IDE by default using the following command. If you don't do this, then DevPod will open VS Code in a browser window, which is neat but not what I want.
   * ```shell
     devpod ide use none
     ```
   * DevPod config is at `~/.devpod/config.yaml`
2. Create and start a dev container
   * ```shell
     devpod up .
     ```
3. SSH into a shell session in the container
   * ```shell
     ssh custom.devpod
     ```
   * I'm a little surprised there isn't an all inclusive command to create, start and attach to the dev container, like we are used to with `docker run ...`. But maybe it's a good thing to separate these concerns so explicitly?
   * Also, this `ssh` is a little circuitous. DevPod added an entry into the `~/.ssh/config` file for the container and it has a `ProxyCommand` that calls `devpod ssh ...`. This is clever, and ultimately I like that we have a dev container that can be accessed via SSH.
   * You should now be on the commandline in the container.
4. Build and run the Rust program
   * Note: run the following command in the SSH/shell session in the dev container.
   * ```shell
     cargo run
     ```
   * It should output something like the following.
   * ```
     Hello from a Rust program running in a custom dev container! ✅
     ```
5. Exit, stop, and delete the dev container
   * ```shell
     exit
     ``` 
   * ```shell
     devpod delete .
     ```
   * This will delete the container (remember, DevPod calls the dev container a "workspace" but I'd prefer to call it a "dev container").


## Wish List

General clean-ups, TODOs and things I wish to implement for this project:

- [x] DONE Use 'debian' base image directly. I'm skeptical of the value and cohesion of the DevContainer's branded base images. I don't want what I don't need.
- [ ] Try to figure out the 'containerUser' feature. I struggled with this. There is always the desire to run any computer process with less privilege, and this extends to the "don't run containers as root" chant. But it is often an uphill battle against the entrenched code paths and practices in the ecosystem. I gave it a shot. Not a good return. But consider revisiting. For now, my recommendation is to stick with root in DevContainers. It's not respecting my 'containerUser' setting in the feature build so my Rust toolchain can't get installed at `/home/me` like I wanted...
- [ ] DevPod isn't re-creating the image when I do `devpod up .` even when I've changed the contents of the feature. I wonder if I have to just up the version number of the features? UPDATE: no that doesn't seem to do it either. It's also not enough to do `devpod delete .` because it doesn't delete the underlying image, and upon a later `devpod up .` it re-uses the existing image. So I've resorted to scripting out some shell code to find images matching the name "vsc-*" and deleting them.
- [ ] Is there a way to more gracefully exit? I'm getting this:
  - ```text
    root ➜ /workspaces/custom $ exit
    logout
    19:18:06 error Error tunneling to container: wait: remote command exited without exit status or exit signal
    19:18:06 error Try using the --debug flag to see a more verbose output
    19:18:06 fatal tunnel to container: run in container: ssh session: Process exited with status 130
    ```
- [x] DONE Drop Nushell from the example. The Rust toolchain is enough for illustration and the extra Nushell steps are too much for the example.
- [ ] Why is the custom image named with a "vsc-" prefix? I'm trying to isolate the VSCode ecosystem dependency? Where is this even coming from? Note: see <https://stackoverflow.com/questions/75915194/vscode-devcontainers-why-are-two-images-built>. Such a low value thing. I'm again skeptical of the DevContainers and related ecosystem. I'll just handroll some Dockerfiles and scripts.  


## Reference

* [Development Container Features](https://containers.dev/features)
* [Feature authoring guide](https://containers.dev/implementors/features/)
* [`devcontainer.json` reference](https://containers.dev/implementors/json_reference/)

[dev-containers-features]: https://containers.dev/features
[devpod]: https://github.com/loft-sh/devpod
