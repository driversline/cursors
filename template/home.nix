{ 
config, 
pkgs, 
... 
}: 
{
home = {
stateVersion = "Версия-NixOS (24.11)";
username = "Ваш-Юзернейм";
homeDirectory = "Домашняя-Директория (/home/ )";
pointerCursor =
let
  getFrom = url: hash: name: {
      gtk.enable = false;
      x11.enable = true;
      name = name;
      size = 18;
      package =
        pkgs.runCommand "moveUp" {} ''
          mkdir -p $out/share/icons
          ln -s ${pkgs.fetchzip {
            url = url;
            sha256 = hash;
          }} $out/share/icons/${name}
      '';
    };
in
  getFrom
    "https://github.com/Ваш-Юзернейм/Название-Репозитория/raw/main/Директория-В-Репозитории/Название-Архива.tar.gz"
    "Полученный-Хеш (nix-prefetch-url --unpack)"
    "Название-Папки-Курсора (без .tar.gz)";
};
}
