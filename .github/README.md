<div align="center">
  <h1>nvimDev</h1>
  <h4 align="center">
    <a href="https://github.com/prrockzed/nvimdev/blob/main/INSTALL.md">Install</a>
    ·
    <a href="https://github.com/prrockzed/nvimDev/blob/main/.github/CONTRIBUTING.md">Contribute</a>
    </br>
    </br>
  <p>For those ready to transform their Workflow</p>
 </h4>

  <p>
    <a href="https://github.com/prrockzed/nvimDev/releases/latest">
      <img alt="Latest release" src="https://img.shields.io/github/v/release/prrockzed/nvimDev?style=for-the-badge&logo=github&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41&include_prerelease&sort=semver" />
    </a>
    <a href="https://github.com/prrockzed/nvimDev/releases/latest">
      <img alt="Release Date" src="https://img.shields.io/github/release-date/prrockzed/nvimDev?style=for-the-badge&logo=calendar&color=F2CDCD&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/prrockzed/nvimDev/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/prrockzed/nvimDev?style=for-the-badge&logo=git&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41"/>
    </a>
    <a href="https://github.com/prrockzed/nvimDev/stargazers">
      <img alt="Stars" src="https://img.shields.io/github/stars/prrockzed/nvimDev?style=for-the-badge&logo=starship&color=c69ff5&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    </br>
    <a href="https://github.com/prrockzed/nvimDev/issues">
      <img alt="Issues" src="https://img.shields.io/github/issues/prrockzed/nvimDev?style=for-the-badge&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/prrockzed/nvimDev/blob/main/LICENSE">
      <img alt="License" src="https://img.shields.io/github/license/prrockzed/nvimDev?style=for-the-badge&logo=creativecommons&color=ee999f&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/prrockzed/nvimDev">
      <img alt="Repo Size" src="https://img.shields.io/github/repo-size/prrockzed/nvimDev?style=for-the-badge&logo=codesandbox&color=%23DDB6F2&label=SIZE&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    </br>
    <a href="https://github.com/prrockzed/nvimDev">
      <img alt="Open Source" src="https://img.shields.io/badge/Free%20and%20Open%20Source-brightgreen?style=for-the-badge" />
    </a>
  </p>
</div>

---

## Contents

- [Introduction](#introduction)
- [Why nvimDev?](#why-nvimdev)
- [Requirements](#requirements)
- [Getting Started](#getting-started)
- [Support](#support)
- [Acknowledgements](#acknowledgements)

Note: Installation and Contribution is right at the top of this page

---

## Introduction

Welcome to **nvimDev** – a sleek, fast, and highly customizable Neovim distribution started by
</br>
**Priyanshu Ranjan**, final-year student at **IIT Kharagpur**. 🌟

This project started as a quest for the **perfect code editor**. While many Neovim distros exist, none had the **set of plugins or keybindings** I wanted(ofc this is not possible), nor did they offer a code structure that was simple to configure and understand. So, after experimenting with and ultimately discarding two previous Neovim configurations, I took inspiration from those experiences to build this ultimate Neovim distribution. 🚀

---

## Why **nvimDev**?

Most Neovim distros are either **too bloated** or **hard to customize**. The code structure is often complex, making it difficult for users to add their own configurations. That’s where **nvimDev** shines – it’s built to be:

- 🔥 **Lightweight** – Takes minimal space and RAM.
- ⚡ **Fast** – With lazy loading, your experience remains **buttery smooth**, no matter how many plugins you use.
- 🎨 **Aesthetic** – Get a beautiful UI experience right out of the box.
- 🖱️ **User-Friendly** – Simplified keybindings that make navigation feel like second nature.
- 🛠️ **Easy to Customize** – The code structure is neat, with separate folders for plugin configurations and core settings. Make it **your own** with just a few tweaks!

Whether you’re an **experienced Neovim user** or just a **beginner** looking for a powerful code editor, **nvimDev** is made for you! The learning curve is smooth and once you get the hang of it, it’ll feel like home. 🏡

Stay tuned for frequent updates as this project is still under development. 🌱 And yes, it’s **free and open-source**, written in Lua, and runs smoothly on any Unix system. Fast and Easy Installation. Use it anytime anywhere.

---

## Requirements

To get started with nvimDev, you’ll need the following:

- **Operating System**: Linux/MacOS/WSL (Windows support coming soon)
- **[Neovim](https://github.com/neovim/neovim/releases/tag/stable)**: Version 0.10.0+ (built with LuaJIT)
- **[Nerd Font](https://www.nerdfonts.com/font-downloads)**: For enhanced UI
- **[Clipboard-Tool](https://neovim.io/doc/user/provider.html#clipboard-tool)**: Essential for integrating with the system clipboard
- **Optional(but Recommended):**
  - Terminal: One with true color support (For better aesthetics)
  - [Ripgrep](https://github.com/BurntSushi/ripgrep) - Live grep telescope search (<Leader>Fl)

---

## Getting Started

If you're new to Neovim or looking for guidance, we highly recommend visiting the **[Wiki Section](https://github.com/prrockzed/nvimDev/wiki)** (Currently in Development Phase) for documentation. Beginners can find in-depth tutorials to help them get up and running, while advanced users will discover insights and tips to get the most out of nvimDev.

The folder structure of the project is explained in the **[v1.0.0 Release Notes](https://github.com/prrockzed/nvimDev/releases/tag/v1.0.0)**, so you can easily understand how everything is organized.

After installing, you can start the project by typing '`nvim`' in your terminal. If you ever feel overwhelmed or need assistance with the keybindings, simply press `<Space>` in normal mode to display all the important key mappings available to you.

Additionally, if you want to tweak the configuration to your liking or wish to contribute to the project, check out **[Guide to Getting Started](https://github.com/prrockzed/nvimDev/blob/main/.github/CONTRIBUTING.md#guide-to-getting-started)**

If you have any questions related to using Neovim, encounter issues, or wish to reach out to me for any other discussions about this project, please feel free to use the **[Discussion Forum](https://github.com/prrockzed/nvimDev/discussions)** available on the repository.

---
## Custom Configration
To create a custom configuration for Neovim, follow these steps:

- Create a custom configuration folder:

   Inside the Neovim configuration directory, typically located at `~/.config/nvim`, create a new folder for your custom configurations. You can name this folder anything you like, but for this example, we’ll name it `custom`.

```bash
mkdir -p ~/.config/nvim/lua/custom
```
- Create a custom init.lua file:

Inside the custom folder, create a new Lua file to hold your custom configurations. For example, create a file named my_config.lua:

```bash
touch ~/.config/nvim/lua/custom/my_config.lua
```

- Edit your init.lua file:
Open the main init.lua file located in ~/.config/nvim/. If it doesn’t exist, you can create it. Add the following line to ensure that Neovim loads your custom configuration:

```bash
require('custom.my_config')
```

- Add your custom configurations:
Open the my_config.lua file and start adding your custom Neovim settings, mappings, and plugins as needed. For example:

```bash
-- Example custom configuration
vim.o.number = true             
vim.o.relativenumber = true
```

- Reload Neovim:
After making these changes, restart Neovim or source your init.lua to apply the new configuration:

```bash
:source ~/.config/nvim/init.lua
```


## Support

If you like this project, please consider giving it a star ⭐ on GitHub – it helps the project grow and reach more people! Your support is much appreciated!
</br>

If you're interested in supporting the development of nvimDev further, please consider [sponsoring this project](https://github.com/sponsors/prrockzed). Your contributions will help cover expenses and enable more frequent updates and enhancements. Thank you for your support!

---

## Acknowledgements

Thanks to [Neovim](https://github.com/neovim/neovim) for enabling the creation of a powerful and customizable terminal-based code editor.
</br>
A special thank you to the creators and maintainers of the plugins used in the repo, which have significantly improved the functionality and user experience of nvimDev.
