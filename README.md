# Способ установки курсора, описанный ниже, - костыль

# Шаг 1 - Копируем и подставляем свою ссылку и случайный хеш к курсору в конфиг

<details>

<summary>Пример случайного хеша и ссылки на курсор в гитхаб</summary>

```bash
https://github.com/driversline/cursors/blob/main/list/Nordzy-cursors-white.tar.gz?raw=true
```

```bash
43a9f317f45e4b5c6d5e4b3a2c1d6e7f8a9b0c1d2e3f4
```
    
</details>

```bash
home-manager switch
```

# Шаг 2 - Ищем строки specified: и got: в ошибке билда

### Например

```bash
specified: sha256-YtkZWfVetmSNjV7fRI1KXxmGQRZY1DFbga60qNy8XsQ=
got:    sha256-7yY1yDUzNg+SJynv7WFdAYApOFGFc7T3DT1C/auGORQ=
```

### Подстановка

```bash
Ссылка полученная в Шаге 1 уже подставлена в конфиг
```

```bash
Хеш, полученный в строке got: подставляем в Полученный-Хеш из `# Структура` (ниже)
```

```bash
Название-Курсора из `# Структура` (ниже) не имеет значения, можно подставить название архива с курсором без расширения
```

# Структура

```bash
{ config, pkgs, ... }:

{
  home.stateVersion = "24.11";
  home.username = "Ваш-Юзер";
  home.homeDirectory = "/home/Ваш-Юзер";

  home.pointerCursor =
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
        "Ссылка-К-Курсору"
        "Полученный-Хеш"
        "Название-Курсора";

  home.sessionVariables = {
   XCURSOR_THEME = "Название-Курсора";
  };

}
```

# Помощь

[Wiki](https://nixos.wiki/wiki/Cursor_Themes)

