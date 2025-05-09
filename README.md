# ❄️ Зачем создан этот репозиторий?

## Здесь собраны курсоры в готовом виде для Home Manager, чтобы:

- Не искать ссылки и хеши вручную каждый раз.

- Не тратить время на битые архивы — всё проверено.

- Быстро переключать их темы.

## Основные причины:

### 🚀 Быстрая установка

- Больше не нужно искать ссылки, проверять хеши и вручную прописывать fetchzip.

- Достаточно скопировать готовый блок кода [отсюда](https://github.com/driversline/cursors/tree/main/home-manager).

### 🔒 Надёжность

- Все архивы скачаны с оригинальных репозиториев авторов или [gnome-look.org](https://www.gnome-look.org/browse/).

- Хеши проверены, поэтому сборка не сломается из-за случайных изменений в архивах.

### 🎨 Лёгкий выбор

- В одном месте собраны проверенные курсоры (минималистичные, необычные).

- Позволяет быстро переключать стили курсоров без дополнительных поисков.

## FAQ:
### Как добавить свой курсор?
- Найди .tar.gz архив с курсором.

- Получи хеш:
```sh
nix-prefetch-url --unpack "URL_АРХИВА"
```

- Создай файл по [образцу](template/home.nix)
