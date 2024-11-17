{pkgs, ...}:
{
  i18n.inputMethod.enabled = "fcitx5";
  i18n.inputMethod.fcitx5.addons = with pkgs; [ fcitx5-rime ];
  programs.alacritty = {
    enable = true;
    settings = {
      colors.bright = {
        black = "#444b6a";
        blue = "#7da6ff";
        cyan = "#0db9d7";
        green = "#b9f27c";
        magenta = "#bb9af7";
        red = "#ff7a93";
        white = "#acb0d0";
        yellow = "#ff9e64";
      };
      colors.normal = {
        black = "#32344a";
        blue = "#7aa2f7";
        cyan = "#449dab";
        green = "#9ece6a";
        magenta = "#ad8ee6";
        red = "#f7768e";
        white = "#787c99";
        yellow = "#e0af68";
      };
      colors.primary = {
        background = "#1a1b26";
        foreground = "#a9b1d6";
      };
      cursor.style = {
        shape = "Underline";
      };
      env = {
        TERM = "xterm-256color";
      };

      font = {
        size = 12.0;
      };

      font.normal = {
        family = "JetBrainsMono NFM";
        style = "Regular";
      };
    };
  };
  programs.neovim = {
    enable = true;
    extraLuaConfig = ''
      local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
      if not (vim.uv or vim.loop).fs_stat(lazypath) then
        local lazyrepo = "https://github.com/folke/lazy.nvim.git"
        local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
          vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
          }, true, {})
          vim.fn.getchar()
          os.exit(1)
        end
      end
      vim.opt.rtp:prepend(lazypath)
      
      require("lazy").setup({
        spec = {
          { "LazyVim/LazyVim", import = "lazyvim.plugins" },
          { import = "plugins" },
        },
        defaults = {
          lazy = false,
          version = false,
        },
        install = { colorscheme = { "tokyonight" } },
        checker = {
          enabled = true,
          notify = false,
        },
        performance = {
          rtp = {
            disabled_plugins = {
              "gzip",
              "tarPlugin",
              "tohtml",
              "tutor",
              "zipPlugin",
            },
          },
        },
      })
    '';
  };
}
