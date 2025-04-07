{ 
config, 
pkgs, 
... 
}: 
{
home = {
stateVersion = "24.11";
username = "user";
homeDirectory = "/home/user";
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
    "https://github.com/driversline/cursors/blob/main/archives/Kitty.tar.gz?raw=true"
    "0mjvcwlkp265qa0nla26cinzp65gk624cpv9kll4c5hl2l5r212c"
    "Kitty";
};
}
