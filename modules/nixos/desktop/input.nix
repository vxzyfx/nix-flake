{ config, lib, pkgs, ... }:
{
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "zh_CN.UTF-8/UTF-8"
    ];
    inputMethod = {
      type = "fcitx5";
      enable = true;

      fcitx5 = {
        waylandFrontend = true; #
        addons = with pkgs; [
          fcitx5-chinese-addons
          fcitx5-gtk
          libsForQt5.fcitx5-qt
          fcitx5-tokyonight
        ];
        settings = {
          addons = {
            classicui.globalSection.Font = "Microsoft YaHei 12";
            classicui.globalSection.Theme = "Tokyonight-Storm";
            classicui.globalSection.DarkTheme = "Tokyonight-Storm";
            pinyin.globalSection = {
              PageSize = 9;
              CloudPinyinEnabled = "True";
              CloudPinyinIndex = 2;
            };
            cloudpinyin.globalSection = {
              Backend = "Baidu";
            };
          };
          inputMethod = {
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
              DefaultIM = "keyboard-us";
            };
            "Groups/0/Items/0".Name = "keyboard-us";
            "Groups/0/Items/1".Name = "pinyin";
            GroupOrder."0" = "Default";
          };
        };
      };
    };
  };

}

