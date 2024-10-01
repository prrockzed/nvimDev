<h1 align="center"> 🤝 Contribution 🤝 </h1>

I know you are eager to contribute, but first, go through the following documents:

1. [Requirements](https://github.com/prrockzed/nvimDev/blob/main/.github/README.md#requirements)
2. [Installation](https://github.com/prrockzed/nvimdev/blob/main/INSTALL.md)
3. [Code of Conduct](https://github.com/prrockzed/nvimDev/blob/main/.github/CODE_OF_CONDUCT.md) — _Required only for first-time contributors. Regular contributors may skip this._
4. [Release v1.0.0](https://github.com/prrockzed/nvimdev/releases/tag/v1.0.0) — For reference on the folder structure of the project.

</br>
Whether you want to fix bugs, improve the configuration, add new features(or plugins), or just update the Readme or docs!
</br>
Want to document the Distro? Add about Configuration, Keybindings, Commands and Plugins to the Wiki Section.
</br>
</br>
I’m eager to collaborate with anyone passionate about improving nvimDev.
</br>
If you have ideas or suggestions, feel free to open an issue and submit a pull request.
</br>

### How to Contribute:

1. **Create an Issue**

   Before starting any contribution, please create an issue using one of the [Issue Templates](https://github.com/prrockzed/nvimdev/issues/new/choose). Clearly explain the issue or feature you want to work on. We will review it and decide if it fits the project needs. Once approved, the issue will be assigned to you, and you can start working on it.

2. **Fork the Repository**

   Fork the repository to your own GitHub account to start working on your contribution.

3. **Clone the Repository**

   Clone the forked repo to your local machine to start coding. The following command will clone the repository to your nvim folder, due to which nvimDev will be your default nvim configuration. If you don't have your own neovim configuration, then forget about this and just run the following command. If you have one, then I recommend you to backup your existing cofiguration(check out [Backup Your Existing Configuration](https://github.com/prrockzed/nvimDev/blob/main/INSTALL.md#backup-your-existing-configuration))

   ```sh
   # Replace <...> with your github username and repository name
   git clone https://github.com/<YOUR GITHUB USERNAME>/<REPOSITORY_NAME>.git ~/.config/nvim
   ```

4. **Create a New Branch**

   Create a branch for your feature or bug fix.

   ```sh
   # replace feature-name with the feature or issue name you're working on
   git checkout -b feature-name
   ```

5. **Make your changes and commit**

   After implementing your changes, commit them with a meaningful message that describes your work.

   ```sh
   # stage your changes
   git add .
   ```

   ```sh
   # write a meaningful commit message concluding your feature
   git commit -m "Added some feature"
   ```

6. **Push the changes**

   Push your branch to your forked repository.

   ```sh
   git push origin feature-name
   ```

7. **Open a pull request**

   Once your changes are pushed, open a Pull Request (PR) to the main repository. Make sure to link the issue you've been assigned in the PR description.
   </br>

## Guide to Getting Started

Welcome to the **nvimDev** project! If you're looking to contribute or customize the configuration, here's a brief overview to help you understand the code structure.

The project follows a modular structure, with an `init.lua` file in almost every folder. The main `init.lua` file in the `nvim` folder serves as the entry point for Neovim, executing each line sequentially:

1. **Core**: It first navigates to the `nvimdev/core` folder, where it links to the `keymaps` and `options` files.
2. **Plugins**: After processing the core files, it returns to the main `init.lua` and moves to the `nvimdev/plugins` folder, where another `init.lua` links to the lazy plugin manager and loads all installed plugins. And this goes on for plugin_config folder as well, where configuration of all the plugins are loaded.

For a detailed look at the project structure, refer to the Folder Structure in **[v1.0.0 Release](https://github.com/prrockzed/nvimDev/releases/tag/v1.0.0)**.

This concise guide is aimed at beginners to help you familiarize yourself with the code structure and doesn't take into account the actual working of Neovim.
</br>

## Note:

If you have any security issues, check out the [Security Policy](https://github.com/prrockzed/nvimDev/blob/main/.github/SECURITY.md)
</br>

Feel free to reach out if you have any questions or suggestions! You can use the [Discussions forum](https://github.com/prrockzed/nvimDev/discussions) to ask questions, propose ideas, or start a conversation.
</br>
</br>
Let's make this project better together.
