### VIM 插件配置

加入插件管理器 [vundle](https://github.com/VundleVim/Vundle.vim), 插件配置项中包含[vim-go](https://github.com/fatih/vim-go), 但未安装。

预装的插件包含 ctrlp ， NERDTree ， Powerline，由于历史原因，这些不是采用Vundle安装.

F2打开NERDTree

F4能够添加作者等信息

ctrl + p 打开 ctrlp功能

:PluginInstall 安装vundle管理的插件

#### 用法

1. 将vim_plugin.tar.gz解压到用户目录（会与用户目录下的.vim文件夹合并）

  ```shell
  tar xzf vim_plugin.tar.gz -C ~/
  ```

2. 将vimrc改为.vimrc ， 并覆盖用户目录下的相应文件

  ```shell
  mv vimrc ~/.vimrc

  ```
3. vundle的使用，见其官方说明。

#### 效果

![效果](effect.png)
