# custom

Author custom DevContainer *features* to define a development container tailored to your exact needs.


## Overview

While the publicly maintained [DevContainers *features*][dev-containers-features] will get you started with a development container, you will find some gaps between what's available compared to the exact bespoke dev environment needs you have. Thankfully, the DevContainers spec makes it easy to write your own features and fill in the missing feature gaps.

It boils down to some JSON and a custom `install.sh` shell script. This subproject demonstrates some custom features to get up and running with a Rust development environment that includes Nushell, which is my preferred shell.

In this example, I'm using [DevPod][devpod] instead of the DevContainers CLI because I'm finding that DevPod has clearer build output (colorized), less noise in the error messages (No Node.js stacktraces, but instead clear error messages), and is overall smoother and more featureful than the DevContainers CLI.  


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
   * You should now be on the commandline in the container. We're getting somewhere! Altogether, it should look like the following.
   * ```text
     $ ssh custom.devpod
     root ➜ /workspaces/custom $
     ```
4. Get set up with Nushell and the project's `do.nu` scripts
   * Note: run the following commands in the SSH/shell session in the dev container.
   * Start a Nushell session with the following command.
   * ```shell
     nu
     ```
   * *Overlay* (Nushell concept) the commands defined in the `do.nu` file.
   * ```shell
     overlay use --prefix do.nu
     ```
   * Then build and run the Rust program with the following commands.
   * ```nushell
     do build; do run
     ```
   * It should output something like the following.
   * ```
     Hello from a Rust program running in a custom dev container! ✅
     ```
5. Exit, stop, and delete the dev container
   * Exit the SSH/shell session with 
   * ```shell
     devpod delete .
     ```
   * This will delete the container (remember, DevPod calls the dev container a "workspace" but I'd prefer to call it a "dev container").


## Wish List

General clean-ups, TODOs and things I wish to implement for this project:

- [ ] Use 'debian' base image directly. I'm skeptical of the value and cohesion of the DevContainer's branded base images. I don't want what I don't need.
- [ ] Try to figure out the 'containerUser' feature. I struggled with this. There is always the desire to run any computer process with less privilege, and this extends to the "don't run containers as root" chant. But it is often an uphill battle against the entrenched code paths and practices in the ecosystem. I gave it a shot. Not a good return. But consider revisiting. For now, my recommendation is to stick with root in DevContainers. It's not respecting my 'containerUser' setting in the feature build so my Rust toolchain can't get installed at `/home/me` like I wanted...
- [ ] DevPod isn't re-creating the image when I do `devpod up .` even when I've changed the contents of the feature. I wonder if I have to just up the version number of the features?
- [ ] Is there a way to more gracefully exit? I'm getting this:
  - ```text
    root ➜ /workspaces/custom $ exit
    logout
    19:18:06 error Error tunneling to container: wait: remote command exited without exit status or exit signal
    19:18:06 error Try using the --debug flag to see a more verbose output
    19:18:06 fatal tunnel to container: run in container: ssh session: Process exited with status 130
    ```
- [ ] Drop Nushell from the example. The Rust toolchain is enough for illustration and the extra Nushell steps are too much for the example.


## Reference

* [Development Container Features](https://containers.dev/features)
* [Feature authoring guide](https://containers.dev/implementors/features/)
* [`devcontainer.json` reference](https://containers.dev/implementors/json_reference/)

[dev-containers-features]: https://containers.dev/features
[devpod]: https://github.com/loft-sh/devpod
