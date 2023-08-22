### GTA:SA and SA:MP additional files

---

##### CLEO
[CLEO4](https://cleo.li/) требует, чтобы для работы был установлен «ASI Loader». Загрузчик ASI требует перезаписи одного исходного файла игры:  
При установке CLEO заменяется файл vorbisFile.dll Никакие дополнительные файлы не заменяются, но добавляются следующие файлы и папки:  

- cleo\ (CLEO script directory)  
- cleo\FileSystemOperations.cleo (file system plugin)  
- cleo\IniFiles.cleo (ini config plugin)  
- cleo\IntOperations.cleo (int operations plugin)  
- cleo\cleo_save\ (CLEO save directory)  
- cleo.asi (core library)  
- bass.dll (audio engine library)  
- vorbisHooked.dll (Silent's ASI Loader)  

[CLEO Redux](https://github.com/cleolibrary/CLEO-Redux):

- cleo_redux.asi (loader file)
- CLEO\.config\sa.json (configfile)

##### Crashes 
[Crashes](https://github.com/Whitetigerswt/gtasa_crashfix) мод который помогает устранить многие ошибки, а так же улучшить производительность GTA.  

- crashes.asi
- crashrpt_lang.ini
- CrashRpt1402.dll
- dbghelp.dll
- CrashSender1402.exe

##### MoonLoader 
[MoonLoader](https://www.blast.hk/threads/13305/) это мод для игры GTA San Andreas, стремящийся стать полной современной заменой CLEO. Он вносит возможность загрузки Lua-скриптов в игру, имеет всю функциональность опкодов игры, библиотеки CLEO, плагина SAMPFUNCS и добавляет свой набор новых функций для разработки.  

- moonloader\config (scripts configs)  
- moonloader\libs (moonloader additonal libs)  
    - [imgui.lua](https://www.blast.hk/threads/19292/)  
    - [MoonImGui.dll](https://www.blast.hk/threads/19292/)  
    - [MoonAdditions.dll](https://github.com/THE-FYP/MoonAdditions)) 
    - [fAwesome5.lua](https://www.blast.hk/threads/19292/page-94#post-335148)  
- MoonLoader.asi (asi plugin)  
- bass.dll (dynamic library designed for processing, playback and recording audio files)  
- lua51.dll (lua dll)  

##### SAMPFUNCS
[SAMPFUNCS](https://www.blast.hk/threads/17/) это дополнение к библиотеке CLEO 4, глобально расширяющее возможности скриптеров. Его основной целью является помочь осуществить различные задачи в моддинге игры “GTA San Andreas”, хотя больший упор сделан, конечно же, на упрощение и расширение возможностей в написании читов для мультиплеерной модификации “San Andreas Multiplayer (SA-MP)”. [Описание sampfuncs-settings.ini](https://wiki.blast.hk/sampfuncs/settings)  
Зависимости: [CLEO4](http://cleo.li/), gta_sa.exe v1.0 US, SA-MP: 0.3.7 R1  
SF-плагины с версии 5.0 до 5.1.1 не совместимы с 5.2 и выше.  

- scripts\global.ini (load plugins config)
- SAMPFUNCS\sampfuncs-settings.ini

##### MODLOADER
[Mod Loader](https://gtamods.com/wiki/Mod_Loader) это плагин, который добавляет удобный и простой способ установки и удаления модификаций в игре без изменения внутренних файлов игры. Пользователю нужно только поместить моды в каталог загрузчика модов, и он будет работать.  

- .data
- .profiles
- modloader.ini

Mod Loader поддерживает все файлы, которые предоставляет игра по умолчанию, с добавлением некоторых файлов, хорошо известных в моддинг-сцене. Поддерживаемые типы файлов:  

- [Плагины ASI](https://gtamods.com/wiki/ASI), [плагины CLEO](https://gtamods.com/wiki/CLEO#Plugins) и хуки D3D9.
- [Файлы данных](https://gtamods.com/wiki/DAT), файлы [IPL](https://gtamods.com/wiki/IPL), файлы [IDE](https://gtamods.com/wiki/IDE), [файлы логики](https://gtamods.com/wiki/Decision_Maker).
- [Потоковые ресурсы](https://gtamods.com/wiki/Resource_Streaming), такие как модели и текстуры.
- Общие файлы, эффекты, спрайты сценариев и [архивы img](https://gtamods.com/wiki/Img_archive).
- Файлы [SFX](https://gtamods.com/wiki/SFX_(SA)), включая волновые файлы, прямо на диске.
- [Потоковые треки](https://gtamods.com/wiki/Audio_streams).
- [SCM](https://gtamods.com/wiki/SCM)-файлы и [CLEO-скрипты](https://gtamods.com/wiki/CLEO#Custom_scripts).
- Текстовые файлы игр [GXT](https://gtamods.com/wiki/GXT) и [FXT](https://gtamods.com/wiki/FXT).
- Вступительные интро.

Профили - это основная система конфигурации для Mod Loader. По умолчанию modloader.ini содержит профиль по умолчанию, но пользователь может создать дополнительные профили, создав новый ini с содержимым профиля в modloader / .profiles или добавив профиль в сам modloader.ini. Профили позволяют создавать группу модов для загрузки, файлы для игнорирования, эксклюзивные моды и так далее.  

---

### SA:MP Client files

- SAMP/
    - CUSTOM.ide - сопоставление кастомных моделей и текстур
    - SAMP.ide - архив с текстурами SA:MP
    - custom.img - архив для кастомных объектов
    - SAMP.img - SA:MP объекты
    - SAMPCOL.img - файл моделей столкновений.
    - SAMP.ipl - часть системы карт и размещения объектов, зон особого поведения и путей в мире. 
    - blanktex.txd -[пустой спрайт.](https://dev.prineside.com/ru/gtasa_samp_game_texture/view/blanktex/)
    - samaps.txd - [текстуры мини-карт](https://dev.prineside.com/ru/gtasa_samp_game_texture/view/samaps/)
- bass.dll - используется для обработки и воспроизведения звука.
- samp.dll - основная библиотека компонентов SA:MP.
- rcon.exe - [удаленная консоль](https://open.mp/docs/server/RemoteConsole).
- samp.exe - лаунчер SA:MP.
- samp_debug.exe - дебаг лаунчер.
- SAMPUninstall.exe - деинсталятор.
- mouse.png - курсор мыши.
- sampgui.png - GUI интерфейс меню.
- samp.saa - главный архив мультиплеера SA-MP.
- gtaweap3.ttf - шрифт HUD.
- sampaux3.ttf - основной файл шрифта GTA:SA.

> d3dx9_25.dll распаковывается отдельно утановщиком в каталог system32

samp.saa это главный архив мультиплеера SA-MP с защитой от изменений, в котором содержатся важные файлы игры.  
Архив можно вскрыть [ModdedSAA.asi](https://www.blast.hk/threads/18701/) и заменить:   
[HANDLING.CFG](https://gtamods.com/wiki/Handling.cfg#GTA_San_Andreas), [VEHICLES.IDE](https://www.gta-modding.com/san_andreas/tutorials/vehicles_ide.html), [CARMODS.DAT](https://www.gta-modding.com/san_andreas/tutorials/carmods_dat.html), [WEAPON.DAT](http://gtamodding.ru/wiki/Weapon.dat), VEHICLE.TXD, [GTA.DAT](http://gtamodding.ru/wiki/Gta.dat), [TIMECYC.DAT](http://gtamodding.ru/wiki/TimeCyc.DAT), [LOADSCS.TXD](https://dev.prineside.com/ru/gtasa_samp_game_texture/view/LOADSCS/), [STREAM.INI](https://gtaforums.com/topic/194134-streamini/)

| НАЗВАНИЕ | РАЗМЕР в байтах |
|--------------|-------------|
| ar_stats.dat | 3530     | 
| carmods.dat  | 9110     | 
| default.dat  | 577      | 
| default.ide  | 4679     | 
| gta.dat      | 3776     | 
| handling.cfg | 64532    | 
| LOADSCS.txd  | 301687   | 
| LOADSCV.txd  | 65536    | 
| melee.dat    | 6306     |
| object.dat   | 126118   |
| ped.dat      | 1276     |
| peds.ide     | 33808    |
| vehicles.ide | 21093    |
| weapon.dat   | 11585    |
| stream.ini   | 197      |
| script.img   | 321536   |
| main.scm     | 99118    |
| shopping.dat | 46875    |
| timecyc.dat  | 40037    |
| melee.dat    | 6306     |

---

### GTA:SA default files
[gta_sa versions description](https://gtamods.com/wiki/San_Andreas_Versions)  

► GTA San Andreas  
├►Anim - папка с анимациями  
│├● Anim.img - анимации людей, машин...  
│├● Cuts.img - анимации для скриптовых сценок  
│└● ped.ifp - анимация игрока (ходьба, прыжки...)  
│  
├► audio - папка со звуками  
│├► CONFIG (7 файлов - 399 кб)  
││├● AudioEventHistory.txt - история воспроизведения звуков в игре  
││├● EventVol.dat – громкость звука в игре  
││└● PakFiles.dat – данные о файлах звуковых эффектов файлов папки SFX (SPC_EA…)  
│├► Streams (16 файлов 1,10 ГБ) файлы радио, звуковые эффекты...  
││├● AA - звук переключения радио (шипение)  
││├● ADVERTS- звуковые вставки DJ  
││├● AMBIENCE - звуковые вставки DJ  
││└● CUTSCENE – звуки в игровых сценах  
│└► SFX (9 файлов - 2,13 ГБ)  
│  
├► models - папка с текстурами и моделями  
│├► coll - папка с файлами коллизий (столкновений)  
│├► generic  
││├● vehicle.txd - основные текстуры для машин  
││├● wheels.txd - текстуры для колёс  
││├● wheels.dff - модель колеса  
││└● air_vlo.dff (arrow, hoop) - модели указателя мыши  
│├► grass  
││├● grassX_X.dff - модели травы  
││└● plant1.txd - текстуры травы  
│├► txd - текстуры загрузочных экранов, меню, игровых автоматов...  
││└● LOADSxx.txd - основной файл текстур (xx - язык игры)  
│├● gta3.img - архив с моделями и текстурами машин, здания, оружия... (16316 файлов)  
│├● gta_int.img - архив с моделями и текстурами интерьеров (2484 файла)  
│├● cutscene.img - модели и текстуры скриптовых роликов (634 файла)  
│├● effects.fxp - игровые эффекты  
│├● player.img - текстуры и модели причёсок, одежды... игрока (542 файла)  
│├● pcbtns.txd - текстуры кнопок навигации (вверх, вправо...)  
│├● Hud.txd - текстуры радара  
│├● fronten_pc.txd - текстуры указателя мыши  
│├● effectsPC.txd - текстуры эффектов (дым, осколки, гильзы...)  
│├● fonts.txd - текстуры шрифтов  
│├● fronten1.txd - текстуры иконок радио  
│├● fronten2.txd - текстуры игрового меню, карта  
│├● fronten3.txd - ещё текстуры меню  
│└● particle.txd - текстуры эффектов (следы шин, цемент, луна...)  
│  
├► data  
│├► Script - скрипты игры  
││├● script.img - архив со скриптами игры (покупка оружия, стрижка, игра в баскет...) (*.scm - 79 файлов)  
││└● main.scm - основной скрипт игры  
│├► Paths - пути движкения поездов, машин, самолётов...  
││├● carrec.img - пути машин  
││├● NodesX.DAT - вейпоинты (где 0≤x<64)  
││└● Roadblox.dat - инфа о дорожных блоках (?)  
│├► Maps - карты игры (и всё что с ними связано)  
││├► veh_mods  
│││└● veh_mods.ide - инфо о частях для тюнинга машин  
││└● Audiozon.ipl - информация о звуковых зонах (в амме, в пицерии... разные звуки)  
│├► Decision  
││├● имена папок схожы с именами разработчиков andyd, chris….  
││└● *.ped - содержат инфо о положении людей в обычной игре, во время миссий 
│├► Icons - иконки игры (*.ico)  
│├● weapon.dat - содержит характеристики оружия  
│├● water.dat - содержит информацию о уровне воды  
│├● vehicles.ide содержит информацию о ID машин  
│├● txdcut.ide - применение спец текстур на тачки  
│├● timecycp.dat - эффекты зависящие от погоды (молния во время дождя...)  
│├● timecyc.dat - настройки освещения в зависимости от погоды, времени  
│├● surfinfo.dat - информация о покрытии и их характеристики (воде, асфальте, траве, песке...)  
│├● surfaud.dat - информация о звуковых эффектах при соприкосновении с поверхностью  
│├● surface.dat – данные о покрытии (асфальт, вода, трава)  
│├● statdisp.dat - данные о статистике игрока (скил)  
│├● shopping.dat - информация об объектах продаваемых в магазинах (еда, тюнинг, тату...)  
│├● procobj.dat - информация о динамических игровых объектах (которые можно перемещать)  
│├● popcycle.dat - отвечает за количество людей и транспорта на улице в разное время в разных местах  
│├● polydensity.dat - как то связан с popcycle.dat   
│├● plants.dat - описывает свойства травы  
│├● pedstats.dat - статистика людей  
│├● peds.ide - описание людей, их характеристик  
│├● pedgrp.dat - группы к которым относятся люди  
│├● ped.dat - данные о том с кем взаимодействуют определённые группы людей  
│├● object.dat - характеристики объектов  
│├● numplate.dat - цветовая раскраска районов  
│├● melee.dat - данные о анимации воспроизводимой при атаке/защите, виде боя, урона...  
│├● map.zon - данные о зонах городов  
│├● info.zon - информация о зонах  
│├● main.sc - пример скрипта  
│├● handling.cfg - физические настройки автомобилей  
│├● gta_quick.dat - файл быстрой загрузки карт игры  
│├● gta.dat - файл полной загрузи карт игры  
│├● gridref.dat - имена разработчиков, артистов  
│├● furnitur.dat - данные о объектах интерьера  
│├● fonts.dat – данные о шрифта  
│├● default.ide - описание и настройки оружия, частей тела, частей машин, объектов игровых сцен...  
│├● clothes.dat - данные о одежде  
│├● carmods.dat - данные о тюнинге машин  
│├● cargrp.dat - группа к которой относится та или иная машина  
│├● carcols.dat - инфо о вариантах цветов для автомобилей в игре  
│├● ar_stats.dat - очки добавляемые за прокачку скила  
│├● animviewer.dat - объекты связанные с анимацией (загрузка объектов, файлов *.ide)  
│└● animgrp.dat - анимация связанная с группами людей  
│  
├► text - *.gxt - файлы языка (текстовые фразы, названия машин, районов...)  
├► movies - *.mpg - заставочные ролики  
└● stream.cfg - отвечает за работу игры (лимиты памяти, машин, освещение...)  
---

[Описание всех основных DAT файлов игры](https://gtamods.com/wiki/DAT)  
[Game directory (SA)](https://gtamods.com/wiki/Game_directory_(SA))  
[SA-MP Mobile установка и файлы](https://vk.com/@samp.mobile-instrukciya-po-ustanovke)  
[GTA:SA Modding files wiki](https://www.pcgamingwiki.com/wiki/Grand_Theft_Auto:_San_Andreas)