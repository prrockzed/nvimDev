<div align="center">
  <h1>nvimDev</h1>
  <p>For those ready to transform their Workflow</p>
  <p>
    <a href="https://github.com/prrockzed/nvimDev/releases/latest">
      <img alt="Latest release" src="https://img.shields.io/github/v/release/prrockzed/nvimDev?style=for-the-badge&logo=github&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41&include_prerelease&sort=semver" />
    </a>
    <a href="https://github.com/prrockzed/nvimDev/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/prrockzed/nvimDev?style=for-the-badge&logo=git&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41"/>
    </a>
    <a href="https://github.com/prrockzed/nvimDev/stargazers">
      <img alt="Stars" src="https://img.shields.io/github/stars/prrockzed/nvimDev?style=for-the-badge&logo=starship&color=c69ff5&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/prrockzed/nvimDev/issues">
      <img alt="Issues" src="https://img.shields.io/github/issues/prrockzed/nvimDev?style=for-the-badge&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    </br>
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

## 📑 Contents

- [Introduction](#introduction)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Contribution](#contribution)
- [Acknowledgements](#acknowledgements)

---

## ✨ Introduction

Welcome to **nvimDev** – a sleek, fast, and highly customizable Neovim distribution built by me,
</br>
**Priyanshu Ranjan**, final-year student at **IIT Kharagpur**. 🌟

This project started as a quest for the **perfect code editor**. While many Neovim distros exist, none had the **set of plugins or keybindings** I wanted(ofc this is not possible), nor did they offer a code structure that was simple to configure and understand. So, I decided to build one myself! 🚀

### Why **nvimDev**?

Most Neovim distros are either **too bloated** or **hard to customize**. The code structure is often complex, making it difficult for users to add their own configurations. That’s where **nvimDev** shines – it’s built to be:

- 🔥 **Lightweight** – Takes minimal space and RAM.
- ⚡ **Fast** – With lazy loading, your experience remains **buttery smooth**, no matter how many plugins you use.
- 🎨 **Aesthetic** – Get a beautiful UI experience right out of the box.
- 🖱️ **User-Friendly** – Simplified keybindings that make navigation feel like second nature.
- 🛠️ **Easy to Customize** – The code structure is neat, with separate folders for plugin configurations and core settings. Make it **your own** with just a few tweaks!

Whether you’re an **experienced Neovim user** or just a **beginner** looking for a powerful code editor, **nvimDev** is made for you! The learning curve is smooth and once you get the hang of it, it’ll feel like home. 🏡

Stay tuned for frequent updates as this project is still under development. 🌱 And yes, it’s **free and open-source**, written in Lua, and runs smoothly on any Unix system. Fast and Easy Installation. Use it anytime anywhere.

---

## ⚡ Requirements

What you need to have?

- OS - Linux/MacOS/WSL
- [Neovim 0.10.0+, built with LuaJIT](https://github.com/neovim/neovim/releases/tag/stable)
- A [Nerd Font](https://www.nerdfonts.com/font-downloads) (Optional)
- A terminal with true color support (Optional)

---

## 🛠️ Installation

### Backup your Existing Configuration

At first, backup your existing neovim configuration
</br>
Follow the below commands to backup:

```sh
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

</br>
If you don't have one or don't care about it, just forget it
</br>
</br>
Mastering manual processes is essential for any programmer!
</br>
So, let's take the time to clone the repository manually(it's easy)

### Clone (Linux/MacOS/WSL)

- Follow one of the following commands. Either one is fine.

```sh
# Directly clone the repository to the ~/.config/nvim folder
git clone https://github.com/prrockzed/nvimDev.git ~/.config/nvim
```

<p align="center">OR</p>

```sh
# Clone the repository and symlink it with your ~/.config/nvim folder
git clone https://github.com/prrockzed/nvimDev.git

# Replace the ~/path/to/nvimDev with your own path
ln -s ~/path/to/nvimDev ~/.config/nvim
```

- Now delete the .git folder to enable adding this to your own repository later

```sh
rm -rf ~/.config/nvim/.git
```

### Downloading from Releases

Like a specific release? Download from previous releases

- Go to the releases part in the about section
- Click on the specific release
- Download the the source code
- Move the contents of the folder to the nvim repo on your machine

### Getting Started

Wanna start 'nviming'? Enter the below command

```sh
nvim .
```

You are good to go now! 😎
</br>
Enjoy Coding

---

## 🤝 Contribution

Whether you're fixing bugs, improving the configuration, adding new features or just want to update Readme!
</br>
Want to document the Distro? Add about Configuration, Keybindings, Commands and Plugins to the Wiki Section.
</br>
</br>
I’m eager to collaborate with anyone passionate about improving nvimDev.
</br>
If you have ideas or suggestions, feel free to open an issue or submit a pull request.
</br>

### How to Contribute:

1. Fork the repository.

2. Create a new branch

```sh
# replace feature-name with your feature
git checkout -b feature-name
```

4. Make your changes and commit

```sh
# write a meaningful commit message concluding your feature
git commit -m "Added some feature"
```

6. Push to the branch

```sh
git push origin feature-name
```

8. Open a pull request

</br>
Feel free to reach out if you have any questions! Let's make this project better together.

---

## ⭐ Acknowledgements

Thanks to [Neovim](https://github.com/neovim/neovim) for enabling the creation of a powerful and customizable terminal-based code editor
