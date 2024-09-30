<h1 align="center"> 🛠️ Installation 🛠️ </h1>

## Before You Begin

Make sure to check the [Requirements](https://github.com/noobdumbledore/nvimDev/blob/main/.github/README.md#requirements) before proceeding. This ensures your system is properly set up for a smooth installation experience.

Once you've met the necessary requirements, installing **nvimDev** is straightforward.
</br>
</br>
If you are a very beginner and don't want to through the hassle, just follow the simple steps given below:

1. Run the commands given in: **[Backup your Existing Configuration](#backup-your-existing-configuration)**
2. Run the 1st command given in: **[Clone Section](#clone-linuxmacoswsl)** (depending on your Operating System)
3. Run the command in **[Getting Started](#getting-started)**

</br>

## Backup your Existing Configuration

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

## Clone (Linux/MacOS/WSL)

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

## Downloading from Releases

Like a specific release? Download from previous releases

- Go to the releases part in the about section
- Click on the specific release
- Download the the source code
- Move the contents of the folder to the nvim repo on your machine

## Getting Started

Wanna start 'nviming'? Enter the below command

```sh
nvim .
```

You are good to go now! 😎
</br>
Enjoy Coding
