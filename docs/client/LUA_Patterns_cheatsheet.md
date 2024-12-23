# LUA PATTERNS CHEATSHEET

[Шаблоны Lua](https://www.lua.org/pil/20.2.html) могут соответствовать последовательностям символов, где каждый символ может быть необязательным или повторяться несколько раз. Если вы привыкли к другим языкам, в которых есть регулярные выражения для сопоставления текста, помните, что сопоставление шаблонов Lua не то же самое: оно более ограничено и имеет другой синтаксис.

## Классы символов:

* `.`	-- Любой символ
* `%a`	-- Буква (только англ.!)
* `%A`	- Любая буква (русская), символ, или цифра, кроме английской буквы 
* `%c`	-- Управляющий символ
* `%d`	-- Цифра
* `%D`	-- Любая буква, или символ, кроме цифры
* `%l`	-- Буква в нижней раскладке (только англ.!)
* `%L`	-- Любая буква, символ, или цифра, кроме английской буквы в нижней раскладке
* `%p`	-- Символ пунктуации
* `%P`	-- Любая буква, символ, или цифра, кроме символа пунктуации
* `%s`	-- Символ пробел
* `%S`	-- Любая буква, символ, или цифра, кроме символа пробела
* `%u`	-- Буква в верхней раскладке (только англ.!)
* `%U`	-- Любая буква, символ, или цифра, кроме английской буквы в верхней раскладке
* `%w`	-- Любая буква, или цифра (только англ.!)
* `%W`	-- Любой символ, или буква (русская), кроме английской буквы, или цифры
* `%x`	-- Шестнадцатеричное число
* `%X`	-- Любая буква, или символ,  кроме цифры, или английской буквы, используемой в записи шестнадцатеричного числа 
* `%z`	-- Строковые параметры, содержащие символы с кодом 0

Если `%`-класс символов записать с большой буквой, то класс инвертируется. Например, `%S` — все символы, кроме пробельных. 

Вы можете создавать свои собственные классы (наборы) шаблонов, используя квадратные скобки, например. Класс символов может быть составной частью элемента шаблона.

* `%x` (где х есть любой не алфавитно-цифровой символ) --- представляет символ х. Таким способом можно указать символы, обычно используемые для магии.

* `[Set]`-- представляет класс, который является объединением всех символов в наборе. Диапазон символов может быть определен путем указания первого и последнего символа диапазона через дефис `-`. Все классы, описанные выше, могут быть также использованы в качестве компонентов набора. Все остальные символы в наборе представляют самих себя. Например, `[%w_]` или `[_%w]` представляет все алфавитно-цифровые символы плюс символ подчеркивания.
* `[^Set]` -- представляет противоположное множество, где набор интерпретируется "кроме указанных".

### Элементы:

*   `.` Просто класс символов. Соответствует одному символу из класса.
*   Класс символов и `*`. Соответствует нулю или более символов из класса. Жадное соответствие: пытается найти как можно больше символов, чтобы всё ещё соответствовать шаблону.
*   Класс символов и `+`. Соответствует одному и более символам из класса. Жадное соответствие.
*   Класс символов и `-`. Соответствует нулю или более символов из класса. В отличие от `*`, находит минимальное кол-во символов, чтобы соответствовало шаблону.
*   Класс символов и `?`. Соответствует нулю или одному символу.
*   `%n`. Соответствует содержимому энного захвата.
*   `%bxy`. Для двух символов (не классов) `x` и `y` находит соответствие так, чтобы `x` и `y` были сбалансированы. Для символа `x` счётчик увеличивается на 1, для символа `y` — уменьшается на 1, в соответствии счётчик равен нулю. Полезно, чтобы искать сбалансированные скобки (`%b()`), например.
*   `%f[набор]`. Соответствует пустой строке такой позиции, что следующий символ соответствует набору, а предыдущий не соответствует. Конец и начало строки принимаются за нулевой байт `\0`.

Шаблон может начинаться с `^` — будет искаться соответствие с начала строки — или `$` — тогда с конца. Если оба символа указать, то шаблон проверяться будет на всю строку.

Шаблон может содержать захваты — подшаблоны, значения которых возвращается. Они обозначаются круглыми скобками и нумеруются в порядке появления левых скобок. Например, в шаблоне `((..)((%d+)%s))%s` первым будет `(..)((%d+)%s)`, вторым — `(..)`, третьим — `(%d+)%s`, четвёртым — `%d+`.

Если захват пустой, то вернётся число — текущая позиция матчера в строке.

## Функции

В Lua есть несколько строковых функций, использующих шаблоны (которые некоторые ошибочно называют регулярными выражениями). Среди них:

*   `string.find(str: string, pattern: string[, init: number[, plain: boolean]])` — ищет в строке `str` первое совпадение шаблона `pattern` и возвращает индексы начала и конца. Если совпадения не найдено, вернёт `nil`. Захваты в шаблоне, если они есть, возвращаются после индексов.
*   `string.match(str: string, pattern: string[, init: number])` — также ищет в строке `str` шаблон `pattern`. Возвращает захваты из первого совпадения или всё совпадение, если захватов нет.
*   `string.gmatch(str: string, pattern: string)` — то же, что и `string.match`, но возвращает итератор, который отдаёт каждое совпадение шаблона `pattern` в строке `str`. Итератор можно использовать в цикле `for in`.
*   `string.gsub(str: string, pattern: string, repl[, n: number])` — заменяет в строке `str` совпадения шаблона `pattern` на значение, определяемое аргументом `repl`: если это строка, то на эту строку будет заменяться; если это таблица — на строку по ключу, соответствующую совпадению; если это функция — на возвращаемое значение функции.

## Примеры

### Примеры простых шаблонов:
`[abc]` -- символы a, b или c  
`[a-z]` -- маленькие буквы (можно указать %l)  
`[^abc]` -- все символы кроме a, b или c  
`[%a%d]` -- все буквы и цифры  
`[%a%d_]` -- все буквы цифры и символ подчеркивания  
`[%[%]]` -- соответствует квадратным скобкам (эскейпит символ [ через %)  

### Примеры составных шаблонов:
`[%+%-%d]%d*%.?%d*[eE]?[%+%-]?%d*` -- шаблон для Float  
`[%a_][%w_]*` -- шаблон для идентификатора (первый символ - не цифра)  
`[+%-%d]%d*` -- шаблон для integer  
`0x[0-9a-fA-F]+` -- шаблон для hex (0xcafebabe)  
 `%u+%l+%a*` -- слова со смешанным регистром, начинающиеся с заглавной буквы  
 `%l+%u+%a*` -- слова со смешанным регистром, начинающиеся с маленькой буквы  

### Примеры сложных конструкций:
`line = line:gsub('//.*$','')` -- удаление из строки комментариев, начинающихся с двух косых черт  
`line = line:match("^%s*(.-)%s*$")` -- удаление начальных и конечных пробелов  
`path = filename:match("^(.*)[/\\][^/\\]*$")` -- получение пути к файлу из полного имени  
`_, _, h, m, s = string.find(t, "%s*(%d+)%p(%d+)%p(%d+)")` -- разбор строковой даты или времени  
`key, value = line:match("%s*([^=]*)%s*%=%s*(.-)%s*$")` -- разбор конструкции key=value  
`[%a%.\\][:%][%w%._%-\\]*` -- шаблон для полного имена файла  
`[a-z0-9_-]+(\.[a-z0-9_-]+)*@[a-z0-9_-]+(\.[a-z0-9_-]+)+` -- email в формате "user@host.com"  

## Ссылки
- http://www.lua.org/manual/5.1/manual.html#5.4.1 - Lua Reference Manual: Patterns
- https://bot4sale.ru/blog-menu/qlua/265-lua-patterns.html - Lua шаблоны
- https://gitspartv.github.io/lua-patterns/ - проверка паттернов онлайн