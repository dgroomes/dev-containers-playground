# dev-containers-playground

📚 Learning and exploring the Development Containers specification and related ecosystem tooling.

> Development Containers
> 
> An open specification for enriching containers with development specific content and settings.
> 
> -- <cite>https://containers.dev</cite>


## Overview

I've used a lot of Docker and containers, but I've generally preferred to not use them as a shell for my development environment. I prefer using the host system directly because it's generally faster, has more freedom, and is already configured the way I need it.

But in 2025, I like using agentic coding agents and I want to cordon them off into their own space to avoid `rm -rf`-like mishaps. I need to up my "dev environment in a container" game, and I think the [Development Containers spec][dev-containers-spec] has created potentially good options. Let me try it out. And maybe I'll find that I even prefer to do most of my development in a container?


## Naming is hard: "Development Containers" or "DevContainers" or "dev containers"?

The words "development" and "containers" are overloaded and conflated severely in this space. Let's break it down.

<dl>
    <dt>Development Containers specification</dt>
    <dd>
    The <em>Development Containers spec</em> defines the meaning of the <code>devcontainers.json</code> file. This is the core component of the ecosystem of tooling around it. Notice how "Development Containers" is capitalized.
    </dd>
    <dt>development containers</dt>
    <dd>
    The general idea of using containers for development. This is an unbranded concept that no one can own.
    </dd>
    <dt><code>devcontainers</code> GitHub org</dt>
    <dd>
      The source code for the Development Containers spec and its first-party tooling is in the <code>devcontainers</code> GitHub organization at <a href="https://github.com/devcontainers">https://github.com/devcontainers</a>.
    </dd>
</dl>

In the wild, you will see these names and variations of them referring to sometimes-ambiguous things in the space. Some of the common variations are:

* DevContainers
* dev container

I personally like the abbreviated, one-worded, and capitalized "DevContainers" name to refer to the official specification and its related tooling. I also like "dev container" to colloquially refer to a container used for development.

Even within the `devcontainers` GitHub org, the naming is inconsistent:

* The [devcontainers/cli][dev-containers-cli] repository uses the name ["Dev Container CLI"](https://github.com/devcontainers/cli/blob/eda6cf892e1440d1fbb454d6e457a2343113ded6/README.md?plain=1#L1) (abbreviated "Dev" and singular "Container")
* The [devcontainers/features][dev-containers-features] repository uses the name ["Development Container Features](https://github.com/devcontainers/features/blob/e3e3ed76c4778e1ec51cae7c11e74565d0052a7f/README.md?plain=1#L1) (unabbreviated "Development" and singular "Container")
* The [devcontainers/images](https://github.com/devcontainers/images) repository uses the name ["Development Containers Images"](https://github.com/devcontainers/images/blob/394d07c4a9ec0be46403ec97906646e0cefcfbde/README.md?plain=1#L1) (unabbreviated "Development" and plural "Containers")


## Standalone subprojects

This repository illustrates different concepts, patterns and examples via standalone subprojects. Each subproject is
completely independent of the others and do not depend on the root project. This _standalone subproject constraint_
forces the subprojects to be complete and maximizes the reader's chances of successfully running, understanding, and
re-using the code.

The subprojects include:


### `basic/`

Use the DevContainers CLI to create and develop inside a container with basic development tools installed.

See the README in [basic/](basic/).


### `custom/`

Author custom DevContainer *features* to define a development container tailored to your exact needs.


## Observations

DevContainers features are built on a foundation of shell scripting. Ad hoc shell scripting with Bash. Lots and lots of it. I remember having the same reaction in 2022 when I first looked at DevContainers. I get that there is a reason to use Bash/POSIX shell instead of a full programming language because it reduces a dependency on a runtime or compiler toolchain. But, these scripts have oodles of dependencies on the many commands they call. For example, in the [Go feature](https://github.com/devcontainers/features/blob/e3e3ed76c4778e1ec51cae7c11e74565d0052a7f/src/go/install.sh), it depends on:

* `curl`
* `git`
* `tar`
* `gpg`
* `awk`
* and more...

Maybe use Go/Node.js and execute subprocesses, and use their standard libraries for HTTP requests, file I/O, and string manipulation. They can even be tested!

There is a lot to be desired in the DevContainers first-party elements (the CLI and the features), but I'm hopeful that the core spec is all we need. I can use [DevPod][dev-pod] and write my own features, as needed.


## Wish List

General clean-ups, TODOs and things I wish to implement for this project:

- [x] DONE Implement the `basic/` subproject
   - DONE Re-work it to not use SSH because of the port forward shortcomings of the CLI. Just run the basic Go program. This truly becomes a "hello world" example.
- [x] DONE Implement the `custom/` subproject
   - Use DevPod
   - (Update: I used custom features) I want to use a custom template.
   - (Update: I'll get to that soon enough; also DevPod kind of already does it?) Consider using SSH here.
- [x] (Answer: yes, looks like it from the docs) Can "features" depend on other features? It's probably not a good idea to get very nested, but I want to know what's possible. 
- [ ] Make a connection to things like Dagger and Nix. I've had my eye on these things. I like their ideas. I'm not sure they are a good fit for me right now, but it's important to keep them in the mix because I'm especially unsure about how useful DevContainers is for me and I don't want to find myself building a substantial dependency on DevContainers because of its shakey foundations on ad hoc shell scripting and a never-fully-baked reference implementation (the CLI).


## Reference

- [DevContainers Specification](https://containers.dev/)
- [DevContainers CLI](https://github.com/devcontainers/cli)
- [*Available Dev Container Features*](https://containers.dev/features)

[dev-containers]: https://containers.dev/
[dev-containers-spec]: https://containers.dev/implementors/spec/
[dev-containers-features]: https://containers.dev/features
[dev-containers-templates]: https://containers.dev/templates
[dev-containers-cli]: https://github.com/devcontainers/cli
[dev-pod]: https://github.com/loft-sh/devpod
