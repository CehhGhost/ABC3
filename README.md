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
В программе используются локальные переменные (например int flag), присутствуют три функции с передачей данных через параметры:
* get_chx(int x, double epsilon);
* fact(int n);
* pow(double x, double n);
### 2) В программу добавленны комментарии, описывающие передачу фактических параметров, перенос возвращаемого результата и связь между параметрами языка Си и регистрами (стеком)
* [main_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/main_updated.s)
* [get_chx_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/get_chx_updated.s)
* [fact_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/fact_updated.s)
* [pow_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/pow_updated.s)
## <br> На 6 баллов:
### 1) Рефакторинг программы на ассемблере за счет максимального использования регистров процессора:
#### В get_chx:
> * r14d
#### В fact:
> * r12d
#### В pow:
> * r12d
### 2) В программу добавленны комментарии, поясняющие эквивалентное использование регистров вместо переменных исходной программы на C
* [main_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/main_updated.s)
* [get_chx_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/get_chx_updated.s)
* [fact_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/fact_updated.s)
* [pow_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/pow_updated.s)
### 3) Сопоставление размеров файлов result и result_updated(итоговые сборки до модификаций и после соответственно):
* result = 16,9 КБ (17 304 б)
* result_updated = 16,8 КБ (17 248 б)
> <br> По итогу можно заметить, что после модификаций размер итогового файла уменьшился, на что мы и рассчитывали
## <br> На 7 баллов:
### 1) Реализация программы на ассемблере, полученной после рефакторинга, в виде двух или более единиц компиляции (main_updated.s, get_chx_updated.s, fact_updated.s, pow_updated.s):
* [main_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/main_updated.s)
* [get_chx_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/get_chx_updated.s)
* [fact_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/fact_updated.s)
* [pow_updated.s](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/pow_updated.s)
### 2) Файл с входными данными(программа содержит проверку на корректность введенных фалов в консоль(см тесты)) - [input.txt](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/input.txt), файл с выходными данными - [output.txt](https://github.com/CehhGhost/ABC3/blob/main/Assembled_updated/output.txt)
## Тестирование
> [ссылка на тесты](https://github.com/CehhGhost/ABC3/blob/main/tests.md)
> <br> При просмотре тестов можно заметить, что программа до модификаций и после работает одинаково и без ошибок => модификации установленны верно, а также что программа корректно считывает из входного файла и записывает в выходной файл
