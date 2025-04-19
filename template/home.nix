{ 
config, 
pkgs, 
... 
}: 
{
home = {
stateVersion = "Версия";
username = "Твой-Юзернейм";
homeDirectory = "Домашняя-Директория";
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
    "https://github.com/Твой-Юзернейм/Твой-Репозиторий/raw/main/Директория-В-Репозитории/Название-Архива.tar.gz"
    "Полученный-Хеш"
    "Название-Папки-Курсора (без .tar.gz)";
};
}
