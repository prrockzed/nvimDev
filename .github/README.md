<div align="center">
  <h1>nvimDev</h1>
  <p>For those ready to transform their Workflow</p>
  <p>
    <a href="https://github.com/prrockzed/nvimDev/releases/latest">
      <img alt="Latest release" src="https://img.shields.io/github/v/release/prrockzed/nvimDev?style=for-the-badge&logo=starship&color=C9CBFF&logoColor=D9E0EE&labelColor=302D41&include_prerelease&sort=semver" />
    </a>
    <a href="https://github.com/prrockzed/nvimDev/blob/main/LICENSE">
      <img alt="License" src="https://img.shields.io/github/license/prrockzed/nvimDev?style=for-the-badge&logo=starship&color=ee999f&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/prrockzed/nvimDev/stargazers">
      <img alt="Stars" src="https://img.shields.io/github/stars/prrockzed/nvimDev?style=for-the-badge&logo=starship&color=c69ff5&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/prrockzed/nvimDev/issues">
      <img alt="Issues" src="https://img.shields.io/github/issues/prrockzed/nvimDev?style=for-the-badge&logo=bilibili&color=F5E0DC&logoColor=D9E0EE&labelColor=302D41" />
    </a>
    <a href="https://github.com/prrockzed/nvimDev">
      <img alt="Repo Size" src="https://img.shields.io/github/repo-size/prrockzed/nvimDev?color=%23DDB6F2&label=SIZE&logo=codesandbox&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" />
    </a>
  </p>
</div>

---

## Contents

- [Introduction](#introduction)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Contribution](#contribution)
- [Acknowledgements](#acknowledgements)

---

## Introduction

Currently in Development Phase. Keep Patience!!
</br>
Trying to make development(and Neovim in particular 😅) simple.

---

## Dependencies

What you need to have?

- OS - Linux/MacOS/WSL
- [Neovim 0.10.0+, built with LuaJIT](https://github.com/neovim/neovim/releases/tag/stable)
- A [Nerd Font](https://www.nerdfonts.com/font-downloads) (Optional)

---

## Installation

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

Wanna start 'nviming'?
</br>
Enter the below command to dive into your programming repo

```sh
nvim .
```

You are good to go now! 😎
</br>
Enjoy Coding

---

## Contribution

Contributions are welcome!
</br>
</br>
Whether you're fixing bugs, improving the configuration, adding new features or just want to update Readme!
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

## Acknowledgements

Thanks to [Neovim](https://github.com/neovim/neovim) for enabling the creation of a powerful and customizable terminal-based code editor
