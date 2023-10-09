# AbsoluteFix

![logo](https://github.com/ins1x/useful-samp-stuff/blob/main/luascripts/absolutefix/demo.png?raw=true)

Набор исправлений и дополнений для серверов [Absolute Play](https://sa-mp.ru/).  
Идеально подойдет игрокам которые по каким-либо причинам не могут играть с Samp Addon, но привыкли к его некоторым возможностям.  
Скрипт не содержит запрещенных функций, и вы можете его использовать не опасаясь попадания в читмир.  
Распространяется безвозмездно и только с открытым исходным кодом.  

## Возможности
* Удобный интерфейс настроек на [imgui](https://www.blast.hk/threads/19292/)
* Активация горячих клавиш на серверах Absolute Play без аддона
* Отключение паузы в Esc и при сворачивании в SA-MP (анти-афк)
* Восстанавливает последний выбранный пункт и текст в меню
* Чат фильтр подключений/отключений игроков
* Отключение различных эффектов дыма, пыли и теней
* Отключение PostFx (опционально)
* Возможность включить улучшения как в samp addon (бег по всем поверхностям, улучшенное вождение)
* Отключения возвращения в выбор класса на F4
* Отключение загрузочных экранов
* Различные фиксы для увеличения FPS без кардинальных изменений самой игры
* Исправление различных багов игры 
* Исправление темного таймцикла
* Исправление включения чата на T
* Удаление ненужных разделов в меню в SA-MP
* Фикс артефактов при сворачивании игры в интерьерах с зеркальным полом
* Скрывает аттачи игрока при прицеливании
* Возможность скрыть иконки пустых домов с радара
* Возможность удалить пикапы выпадающего оружия с игрока
* Возможность восстановить удаленные столбы, деревья и прочие объекты
* Исправление застревания игрока в другом игроке при спавне на DM
* Бессмертному игроку визуально отключается урон на его транспорте

### Горячие клавиши восстановленные скриптом и доступные без samp addon:
* J - полет в мире
* Z - починить транспорт
* U - анимации
* M - домашний транспорт
* K - заказать транспорт
* L - закрыть транспорт
* H - перевернуть транспорт

## Как использовать
- Установить [Moonloader](https://www.blast.hk/threads/13305/)  
- Установить [SAMPFUNCS](https://www.blast.hk/threads/17/)  
- Скопировать содержимое архива в папку moonloader  

> В игре введите команду /absfix

## Зависимости
* lua imgui - https://www.blast.hk/threads/19292/
* lib.samp.events - https://github.com/THE-FYP/SAMP.Lua

Протестировано на *SA-MP 0.3.7-R1, Moonloader 0.26, sampfuncs 5.4.1-final*  
Основные функции будут работать и на других версиях, но некоторые мемхаки не адаптированы.

> Скрипт **не работает с включенным античитом** samp addon, так как разработчик аддона фильтрует все скрипты по белому списку. Скрипт не заменяет [Samp Addon](https://sa-mp.ru/sampaddon), и не использует его возможности. 

## Дополнительно
Вы можете установить другие дополнения и плагины используемые аддоном  

* [Transparent Menu.asi - Прозрачное меню](https://libertycity.ru/files/gta-san-andreas/96340-transparent-menu.html)
* [NormalMap.asi - Улучшенное освещение персонажей](https://www.blast.hk/threads/19173/)
* [OutFitFix.asi - Исправляет сбои при предварительном просмотре textdraws](https://gtaforums.com/topic/759412-relsa-fixes-for-normalmapweapons-outfit-and-shell/)
* [SAMP Graphic Restore.asi - Плагин отображает корректно абсолютно все прелести ENB Series в многопользовательской игре.](https://www.blast.hk/threads/25150/)
* [Grass.asi - Возвращает траву и кусты](https://libertycity.net/files/gta-san-andreas/96677-samp-grass.html)
* [StreamMemFix.asi - Повышает размер Stream Memory используемой игрой, что дает колоссальное приимущество в прорисовке текстур, поэтому они перестают пропадать.](https://libertycity.ru/files/gta-san-andreas/31883-sa-streammemfix-2.2.html)
* [DwmComposition.asi - Плагин отключает переход windows на упрощенный стиль](https://www.blast.hk/threads/13368/)
* [Widescreen-fix.asi - Исправляет проблемы с широкоформатными мониторами](https://gamemodding.com/ru/gta-san-andreas/others/45270-widescreen-fix.html)
* [RoadReflectionsFix.asi - Фикс отражений на мокрой дороге](https://www.gtagarage.com/mods/show.php?id=22398)

## Config
Все настройки хранятся в файле moonloader\config\AbsoluteFix.ini  
Скрытые настройки могут быть активированы только через конфиг файл
```INI
	restoreremovedobjects=true
	fixtimecycvalue=0.2
	vehvisualdmg=true
	gamefixes=true
	invalidmodelsfix=true
	noradio=true
	antiafk=true
	fixdarktimecyc=true
	addonupgrades=true
	hideattachesonaim=true
	noweaponpickups=true
	recontime=10000
	chatfilter=true
	fastload=true
	nopostfx=false
	hidehousesmapicons=true
	menupatch=true
	keybinds=true
	autoreconnect=true
	noeffects=false
	nologo=false
	nogametext=false
```

> Попробуйте более функциональный скрипт с множеством фиксов [GameFixer by Gorskin](https://vk.com/@gorskinscripts-gamefixer-obnovlenie-30)

## Credits 
* [EvgeN 1137](https://www.blast.hk/members/1), [hnnssy](https://www.blast.hk/members/66797), [FYP](https://github.com/THE-FYP) - Moonloader  
* [FYP](https://github.com/THE-FYP) - imgui, SAMP lua библиотеки
* [Gorskin](https://vk.com/gorskinscripts) - полезные сниппеты и мемхаки

## KnownBugs
* При восстановлении серверных объектов удаленных через RemoveBuildings, теряется исходное положение некоторых объектов. Например автобусные остановки повернуты не в ту сторону

## Disclaimer
Функционал был подобран из открытых источников, и не является результатом реверса Samp Addon.