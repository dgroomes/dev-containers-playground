# dev-containers-playground

📚 Learning and exploring the Development Containers specification and its related projects.

> Development Containers
> 
> An open specification for enriching containers with development specific content and settings.
> 
> -- <cite>https://containers.dev</cite>


## Overview

I've used a lot of Docker and containers, but I generally prefer to not use them as a shell for my development environment. I prefer using the host system directly because it's generally faster, has more freedom, and is already configured the way I need it.

But in 2025, I like using agentic coding agents and I want to cordon them off into their own space to avoid `rm -rf`-like mishaps. I need to up my "dev environment in a container" game, and I think the [Development Containers][dev-containers] project is a good way to do that.

The Development Containers project is a combination of things including the [Development Containers spec][dev-containers-spec], a collection of container-building-and-running instructions called [*features*][dev-containers-features] and [*templates*][dev-containers-templates], and a CLI tool.

The entity is often referred to as the "Development Containers _specification_". I find this branding awkward. The related components (features, templates, and CLI) don't have a strong brand either. Their are branded with the Development Containers project by name association, but with inconsistent names:

* The [devcontainers/cli][dev-containers-cli] repository uses the name ["Dev Container CLI"](https://github.com/devcontainers/cli/blob/eda6cf892e1440d1fbb454d6e457a2343113ded6/README.md?plain=1#L1) (abbreviated "Dev" and singular "Container")
* The [devcontainers/features][dev-containers-features] repository uses the name ["Development Container Features](https://github.com/devcontainers/features/blob/e3e3ed76c4778e1ec51cae7c11e74565d0052a7f/README.md?plain=1#L1) (unabbreviated "Development" and singular "Container")
* The [devcontainers/images](https://github.com/devcontainers/images) repository uses the name ["Development Containers Images"](https://github.com/devcontainers/images/blob/394d07c4a9ec0be46403ec97906646e0cefcfbde/README.md?plain=1#L1) (unabbreviated "Development" and plural "Containers")

When speaking out loud about this project, I think most people say "dev containers". When writing, it's a mixed bag. I think "DevContainers" would be a good fit, but in writing I'll stick with the "Development Containers project" for explicit clarity.

The Development Containers project also refers to the general and unbranded idea of "development containers" (lowercase). This is a good reminder that you can and should use whatever tools you like for your development workflow. Want to containerize your environment? Want to use NixOS? Want to use lots of Perl scripts? Whatever works for you!

In this repository I'm specifically exploring the Development Containers project, not just "development containers".


## Standalone subprojects

This repository illustrates different concepts, patterns and examples via standalone subprojects. Each subproject is
completely independent of the others and do not depend on the root project. This _standalone subproject constraint_
forces the subprojects to be complete and maximizes the reader's chances of successfully running, understanding, and
re-using the code.

The subprojects include:


### `basic/`

NOT YET IMPLEMENTED

Run a container with a couple Development Containers *features* baked in. This is a basic starter example.

See the README in [basic/](basic/).


### `custom/`

NOT YET IMPLEMENTED

Use a combination of publicly maintained *features* and your own custom features to define a bespoke development container.


## Reference

- [Dev Containers Specification](https://containers.dev/)
- [Dev Containers CLI](https://github.com/devcontainers/cli)
- [Available Dev Container Features](https://containers.dev/features)

[dev-containers]: https://containers.dev/
[dev-containers-spec]: https://containers.dev/implementors/spec/
[dev-containers-features]: https://containers.dev/features
[dev-containers-templates]: https://containers.dev/templates
[dev-containers-cli]: https://github.com/devcontainers/cli
