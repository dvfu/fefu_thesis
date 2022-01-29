# FEFU thesis
Класс документа LaTeX для студенческих работ ДВФУ

## Требования
* XeLaTeX или LuaLaTeX
* Шрифт Times New Roman
* При сборке должна быть передана опция `-shell-escape`
* Рекомендуется использовать [TeXstudio](https://www.texstudio.org/)
* Для оформления списка литературы необходим пакет [gost](https://www.ctan.org/pkg/gost)

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
cd source
latex fefu.ins
cd ..
mkdir scr
cp source/fefu_base.sty cls
cp source/fefu.cls cls
cp source/fefu_presentation.cls cls
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
Скопировать файл `cls/fefu.cls`, `cls/fefu_base.sty` и `cls/fefu_presentation.cls` в локальную директорию классов LaTeX. Установить класс документа в основном `.tex` файле отчёта
```
\documentclass{fefu}
...
```

или 

```
\documentclass{fefu_presentation}
...
```
