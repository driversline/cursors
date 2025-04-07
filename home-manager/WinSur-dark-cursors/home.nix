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
    "https://github.com/driversline/cursors/blob/main/archives/WinSur-dark-cursors.tar.gz?raw=true"
    "0fgml7lk1n3br9iaqmriibg3snn66lh10gxgalcyv9q4yfmy47qa"
    "WinSur-dark-cursors";
};
}
