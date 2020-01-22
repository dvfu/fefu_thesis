Класс документа LaTeX для студенческих работ ДВФУ

## Установка
### Linux
```
make install
```
### Windows
```
install.ps1
```
### Ручная установка
```
latex source/fefu.ins
mkdir scr
cp source/fefu.png cls
cp fefu.cls cls
```
## Использование
### В качестве git submodule
Добавить репозиторий как submodule в папку отчёта
```
git submodule add https://github.com/dvfu/fefu_thesis.git
```
или
```
git submodule add git@github.com:dvfu/fefu_thesis.git
```
Установить класс документа в основном файле `.tex`
```
\documentclass{fefu_thesis/cls/fefu}
...
```
### В качестве локального класса
Скопировать файлы `cls/fefu.tex` и `cls/fefu.png` в локальную директорию классов LaTeX. Установить класс документа в основном `.tex` файле отчёта
```
\documentclass{fefu}
...
```
