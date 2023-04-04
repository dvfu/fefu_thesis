# FEFU thesis
Класс документа LaTeX для студенческих работ ДВФУ

## Требования
* XeLaTeX или LuaLaTeX
* Шрифт Times New Roman
* При сборке должна быть передана опция `--shell-escape`
* Рекомендуется использовать [TeXstudio](https://www.texstudio.org/)
* Для оформления списка литературы необходим пакет [gost](https://www.ctan.org/pkg/gost)

## Сборка
### Linux
```
make install
```
### Windows
```
install.ps1
```

Для выполнения скрипта необходимо установить Unrestricted [политику выполнения](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.2).
### Ручная сборка
```
cd source
latex fefu.ins
cd ..
mkdir src
cp source/fefu_base.sty cls
cp source/fefu.cls cls
cp source/fefu_presentation.cls cls
cp source/fefu_style_default.sty cls
cp source/fefu_style_imct.sty cls
```
## Использование
Скопировать файлы из папки `cls` в локальную директорию классов LaTeX (предпочтительно, происходит автоматически на Linux) или в папку проекта. Установить класс документа в основном `.tex` файле отчёта
```
\documentclass{fefu}
...
```

или 

```
\documentclass{fefu_presentation}
...
```
