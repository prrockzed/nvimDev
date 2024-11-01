<h1 align="center"> 🛠️ Installation 🛠️ </h1>

## Before You Begin

Make sure to check the [Requirements](https://github.com/prrockzed/nvimDev/blob/main/.github/README.md#requirements) before proceeding. This ensures your system is properly set up for a smooth installation experience.

Once you've met the necessary requirements, installing **nvimDev** is straightforward.
</br>
</br>
If you are a very beginner and don't want to through the hassle, just follow the simple steps given below:

1. Run the commands given in: **[Backup your Existing Configuration](#backup-your-existing-configuration)**
2. Run the command given in: **[Clone Section](#clone-linuxmacoswsl)** (depending on your Operating System)
3. Run the command in **[Getting Started](#getting-started)**

---

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

---
## Troubleshooting Problems 

- **Issue**: Neovim Does not Start

- **Solution**: Ensure That Neovim is Installed Correctly And That Path is Added to Your Environmental Variables

  To add Neovim to your PATH on Linux/MacOS, 

  open your .bashrc or .zshrc file and add the following line: 

  export PATH=$PATH:/usr/local/bin/nvim
 
- **Issue**: Plugins Not Loading 

- **Solution**: Make sure all dependencies are installed, including ripgrep and any required fonts. You can install ripgrep with:

- On Ubuntu/Debian 
 ```sh
sudo apt install ripgrep
```

- On MacOS
 ```sh
brew install ripgrep
```
 
- **Issue**: Virtualization not enabled

- **Solution**: Check if virtualization is enabled in the BIOS/UEFI settings. Enable it if necessary, and ensure that WSL or any other virtualization-dependent features are properly set up

## Clone (Windows)
Here are the instructions for cloning the repository on a Windows system:

- Install Git for Windows.

- Open Git Bash or Command Prompt as Administrator.

- Use the following command to clone the repository into the correct directory:

```sh
git clone https://github.com/prrockzed/nvimDev.git 
 %USERPROFILE%\.config\nvim
```
 
- Make sure to add Neovim to your system's 
  PATH variable:

  - Right-click on "This PC" or "Computer" in      File Explorer, then select Properties.        
  
  - Click Advanced system settings and then         Environment Variables. 
  

  - Under System Variables, find the Path           variable, select it, and click Edit.

  - Add the path to Neovim's installation             folder (e.g., C:\Program                     Files\Neovim\bin) and                        click OK


## Clone (Linux/MacOS/WSL)

   ```sh
   # Directly clone the repository to the ~/.config/nvim folder
   git clone https://github.com/prrockzed/nvimDev.git ~/.config/nvim
   ```

## Downloading from Releases

Like a specific release? Download from previous releases

- Go to the releases part in the about section
- Click on the specific release
- Download the the source code
- Move the contents of the folder to the nvim repo on your machine

### Installation(Using Command Line)

#### For .zip Files

   ```sh
   # Download the .zip file - Replace the `v1.0.0` release with the liking of your own release
   curl -L -o nvim-release.zip https://github.com/prrockzed/nvimDev/archive/refs/tags/v1.0.0.zip

   # Unpack the .zip file
   unzip nvim-release.zip -d nvim-release

   # Move the contents to the nvim folder
   mv nvim-release/* ~/.config/nvim/

   # Now delete the unzipped folder and the .zip file
   rm -rf nvim-release nvim-release.zip
   ```
   
#### For .tar.gz file:

   ```sh
   # Download the .tar.gz file - Replace the `v1.0.0` release with the liking of your own release
   curl -L -o nvim-release.tar.gz https://github.com/prrockzed/nvimDev/archive/refs/tags/v1.0.0.tar.gz

   # Create a directory to unpack the files
   mkdir -p nvim-release

   # Unpack the .tar.gz file
   tar -xzf nvim-release.tar.gz -C nvim-release

   # Move the contents to the Neovim folder
   mv nvim-release/* ~/.config/nvim

   # Now delete the unpacked folder and the .tar.gz file:
   rm -rf nvim-release nvim-release.tar.gz
   ```

---

## Getting Started

Wanna start 'nviming'? Enter the below command
   ```sh
   nvim .
   ```

You are good to go now! 😎
</br>
Enjoy Coding

---

## Unistallation
To uninstall **nvimDev**, you can remove the `nvim` folder and any related configuration files. Here are the steps:
   ```sh
   # Remove the nvim configuration folder:
   rm -rf ~/.config/nvim

   # Remove all their dependencies
   rm -rf ~/.local/share/nvim
   rm -rf ~/.local/state/nvim
   rm -rf ~/.cache/nvim
   ```
