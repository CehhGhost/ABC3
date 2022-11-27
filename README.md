# ИДЗ по АВС №3
### Цейтин Андрей Владимирович БПИ217
# <br> Отчет
## <br> На 4 балла:
### 1) Приведено решение задачи на C (с использованием четырех единиц компиляции):
* [main.c](https://github.com/CehhGhost/ABC3/blob/main/C%20code/main.c)
* [get_chx.c](https://github.com/CehhGhost/ABC3/blob/main/C%20code/get_chx.c)
* [fact.c](https://github.com/CehhGhost/ABC3/blob/main/C%20code/fact.c)
* [pow.c](https://github.com/CehhGhost/ABC3/blob/main/C%20code/pow.c)
### 2)  В полученную ассемблерную программу, откомпилированную без оптимизирующих и отладочных опций, добавлены комментарии, поясняющие
эквивалентное представление переменных в программе на C:
* [main.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled/main.s)
* [get_chx.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled/get_chx.s)
* [fact.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled/fact.s)
* [pow.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled/pow.s)
### 3) Из ассемблерной программы убраны лишние макросы за счет использования соответствующих аргументов командной строки и/или за счет
ручного редактирования исходного текста ассемблерной программы:
* [main_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/main_updated.s)
* [get_chx_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/get_chx_updated.s)
* [fact_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/fact_updated.s)
* [pow_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/pow_updated.s)
#### [Список изменений](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/Changes.md)
## <br> На 5 баллов:
### 1) В реализованной программе использовать функции с передачей данных через параметры и использованны локальные переменные:
В программе используются локальные переменные (например int size), присутствует одна функция с передачей данных через параметры:
* get_maxsymb_and_minsymb(const char *line, int size, char* min, char* max)
### 2) В программу добавленны комментарии, описывающие передачу фактических параметров, перенос возвращаемого результата и связь между параметрами языка Си и регистрами (стеком)
* [main_updated.s](https://github.com/CehhGhost/ABC2/blob/main/Assembeld%20updated/main_updated.s)
* [get_maxsymb_and_minsymb_updated.s](https://github.com/CehhGhost/ABC2/blob/main/Assembeld%20updated/get_maxsymb_and_minsymb_updated.s)
