# Описание SAMP Addon

В этой теме собрана информация по _[SAMP Addon](https://sa-mp.ru/sampaddon)_. Если у вас возникли опросы и проблемы с _[SAMP Addon](https://sa-mp.ru/sampaddon)_ начните с этой темы.   
Информация будет дополняться по мере поступления, если вам есть что добавить напишите мне в личку на форуме, или в мой [дискорд (**1NS**](https://discordapp.com/users/625192705772748821)).   

  
_[![uHBv8qG.png](https://i.imgur.com/uHBv8qG.png)](https://sa-mp.ru/sampaddon)_  
 

_[SA-MP Addon](https://sa-mp.ru/sampaddon) - дополнительная надстройка над SA-MP исправляющая множество сбоев и ошибок _игры, в том числе и приводящих к вылетам._  
GTA без лагов и вылетов с большим FPS и новыми текстурами, исправление ошибок игры, улучшения эффектов и графики._  
_SAMP Addon_ также включает в себя другие моды, такие как _Audioplugin_, _[StreamMemoryFix](https://gtaforums.com/topic/877268-stream-memory-fix/)_, _[Graphic Restore](https://gtaforums.com/topic/752667-relsasamp-sampgraphicrestore/), Mousefix, [Normal Map Fix](https://www.mixmods.com.br/2012/01/normal-mapping-peds-normal-map-correcao/), [OutFitFix и прочие](https://gtaforums.com/topic/759412-relsa-fixes-for-normalmapweapons-outfit-and-shell/)_. 

**Некоторые особенности SAMP Addon**

*   Оптимизация работы эффектов свечения, отражений, теней мира, загрузки объектов и текстур, а так же графического движка в целом
*   Оптимизировано множество алгоритма игры и SA-MP для увеличения FPS и производительности игры
*   Новый интерфейс диалоговых окон SA-MP и курсор (при установке можно отключить)
*   Детализированный радар, колёса (все колёса меняют цвет в зависимости от 2-го цвета транспорта) и тюнинг транспорта (при установке можно отключить)
*   Отключение паузы в Esc и при сворачивании в SA-MP (анти-афк можно отключить disableantiesc.txt)
*   Меню игры прозрачное в SA-MP, удалены ненужные разделы в меню
*   Не отключает эффект прозрачности [Windows Aero](https://ru.wikipedia.org/wiki/Windows_Aero) на Windows 7 и Vista
*   При установке читов предлагается выбор играть с читами или удалить читы. Античит можно отключить [в настройках лаунчера](https://i.imgur.com/xO9N5Fu.png)
*   Игра может запускаться с одного SA-MP многократно без [песочницы](https://sandboxie.ru/) (как реализовано в [SAMPFUNCS](https://www.blast.hk/threads/138813/))
*   Дает возможность клиенту [SA-MP 0.3DL](https://sa-mp.ru/download.php?file=SA-MP_0.3DL.exe) возможно подключаться к серверам версии [0.3.7](https://sa-mp.ru/download.php?file=SA-MP_0.3.7.exe)
*   Увеличивает стандартный лимит FPS до 200. [Частота кадров в игре снижается](https://gtaforums.com/topic/760017-samp-addon/?do=findComment&comment=1070947198), если разряжена батарея ноутбука. Меньший заряд батареи - меньший FPS
*   Используется новая версия [bass.dll](https://ru.wikipedia.org/wiki/BASS) библиотеки, это исправляет вылеты которые могут возникать из-за радио, Addon оповещает если установлена старая версия
*   Игра больше не находится поверх других окон в оконном режиме на Alt+Enter и не блокирует управление другими приложениями
*   [GameExplorer](http://forum.oszone.net/nextoldesttothread-196017.html) (проводник игр Windows) отключается, т.к. вызывал задержки при запуске GTA и некоторых других игр
*   Работает на виртуальных машинах [VMware](https://www.vmware.com/products/workstation-player) и [VirtualBox](https://www.virtualbox.org/). Что является наилучшим вариантом для запуска на Linux без [Wine](https://www.winehq.org/)

**Исправления "читбагов" игры**

*   Исправляет быстрый поворот [скинов](https://team.sa-mp.com/wiki/Skins_All.html) 1, 2, 265, 266, 267, 268, 269, 270, 271, 272. Отключить данную опцию на Absolute Play нет возможности
*   Исправляет физику при десантировании с парашютом, теперь не получится пролететь всю карту на парашюте
*   Исправлены некоторые баги стрельбы, сбив анимации переката, Distance bug, fast через TAB, анти+с  (исправление анти+с не включено на [DM](https://vk.com/absdm))
*   Исправлен баг игры из-за которого можно было попадать в игрока в транспорте в голову сквозь транспорт
*   Дополнительно исправлен баг игры когда можно было прыгать высоко на великах
*   При падении под землю игрок умирает вместо телепортации (можно отключить в настройках)

Все возможности и изменения подробно описаны на [https://sa-mp.ru/sampaddon](https://sa-mp.ru/sampaddon). посмотреть [изменения и обновления (changelog)](https://sa-mp.ru/news/addon).

**Установка SAMP ADDON**

  
**Обязательно запускайте установку SAMP ADDON [от имени администратора](https://remontka.pro/run-program-administrator-windows-10/)!**  
 

![pvcRiGr.png](https://i.imgur.com/pvcRiGr.png)

При установке предлагает на выбор 3 варианта - полная, компактная и выборочная установка. В полной будут установлены все компоненты, в компактной только необходимые, без изменения текстур, радара, эффектов и интерфейса. В выборочной можно отключить все не нужное вам, на случай если у вас уже есть замененные  эффекты, текстуры и прочие моды.  
Без выбора пункта русификации будет английский текст в текстдравах на Absolute Play, если вы используете C-HUD то отключите русификацию. (Аддон включает поддержку русского языка в настройках системы, или даёт инструкции по включению если нет админских прав). В установщик так же входит [asi loader](https://gtaforums.com/topic/523982-relopensrc-silents-asi-loader/), [bass.dll](https://ru.wikipedia.org/wiki/BASS) и [дополнительные библиотеки](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170) необходимые для работы GTA и SAMP. Если что-то из этого у вас уже есть, то установщик заменит старые файлы (при условии запуска с правами администратора, без прав файлы могут быть не заменены более свежей версией).

Примечание: Windows Defender или другой антивирус может попытаться прекратить установку, но вы можете продолжать её не опасаясь последствий.  
(Можно попробовать [добавить папку в исключение если у вас включен защитник windows](https://remontka.pro/exclusions-defender-windows-10/), либо временно отключить антивирус)

[![sampclient.png](https://gta-samp.ru/img/samp/sampclient.png)](https://gta-samp.ru/samp)

Скрытый текст

![xO9N5Fu.png](https://i.imgur.com/xO9N5Fu.png)![GxdJccQwEyY.jpg?size=693x351&quality=96&](https://sun9-13.userapi.com/impf/c850228/v850228586/1ee691/GxdJccQwEyY.jpg?size=693x351&quality=96&sign=7b37450a312b8b8fd463cc3029fdfb9b&c_uniq_tag=ILuLUefQUlpAGrvEO-V4CqjRe8mMEJsKZ3-3kLUxfWA&type=album)

Вместе с SAMP Addon ставится [новый samp клиент для игры в GTA San Andreas по сети](https://gta-samp.ru/samp), возможности клиента подробно описаны на [https://gta-samp.ru/samp](https://gta-samp.ru/samp).  
При подключении игрока [DL клиент](https://gta-samp.ru/download.php?file=SA-MP_0.3DL.exe) и аудиоклиент скачивают необходимые файлы. (_GTA San Andreas User Files\\SAMP\\cache_ и _AppData\\Roaming\\SA-MP Audio Plugin\\audiopacks_)  
Установщик автоматически добавит сервера Absolute Play в список избранных. Новый самп клиент устанавливается в _AppData\\Roaming\\SAMPLauncher\\_ и содержит следующие файлы:

Скрытый текст

AbsLauncherDownloadFilesInfo.ini - информация о последних загрузках  
AbsLauncherList.txt - детальная информация о установленной gta, аддоне и лаунчере  
AbsLauncherServerNicks.ini - последний сохраненный ник для сервера  
AbsLauncherServerSites.ini - сохраненные ip - и сайты серверов  
AbsLauncherSettings.ini - настройки графического интерфейса лаунчера  
samp.exe - новый клиент  
SavedAbsoluteServersPos.txt - сохраненные позиции  
SavedNames.txt- сохраненные никнеймы

**ВАЖНО!**

*   Некоторые моды могут вызывать краши если игра установлена не на диск C:\\\\ или содержит русские символы в пути (Это не проблема аддона).
*   Требование админских прав отключено при запуске установщика, чтобы установить в игру находящуюся в Program files необходимо вручную запустить установщик от админа
*   SA-MP Addon на [Steam версию игры](https://steamcommunity.com/app/12120/discussions/0/34096318964479523?l=czech&ctp=25) без SA-MP не может быть установлен.

**Как удалить Samp Addon?**

Для удаления SA-MP Addon необходимо:

*   Открыть Пуск > Панель управления > Установка и удаление программ 
*   [Для Windows 10/11](https://support.microsoft.com/ru-ru/windows/%D1%83%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%B8-%D1%83%D0%B4%D0%B0%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5-%D0%BF%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D0%B9-%D0%B8-%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC-%D0%B2-windows-4b55f974-2cc6-2d2b-d092-5905080eaf98) - Пуск > Панель управления > Программы > Программы и компоненты
*   Найти в списке GTA San Andreas SA-MP Addon и выбрать удалить.
*   Вам предложит вместо удаления SA-MP Addon отключить античит > Нет
*   Вы действительно хотите удалить SA-MP Addon и все компоненты программы > Да   
     

Скрытый текст

![c8xl6nL.png](https://i.imgur.com/c8xl6nL.png)

![ZLDCDNy.png](https://i.imgur.com/ZLDCDNy.png)

Если у вас отсутствует такой пункт:  
Заходим в папку c игрой - открываем папку libraries - в ней ищем папку backup, открываем - запускаем unins001.exe.   
\* Если файлов unins000.exe - это удаление [клиента SA-MP](https://sa-mp.ru/download.php?file=SA-MP_0.3DL.exe)

При использовании сторонних программ для удаления, с поиском файлов реестра и остаточных файлов, с большой доле вероятности после глубокой очистки вам придется переустанавливать [sa-mp клиент](https://gta-samp.ru/samp). Поэтому внимательно сверяйте что вам предлагает удалить. Рекомендуется использовать стандартный деинсталлятор.

**Список файлов установщика SAMP ADDON**  
В качестве примера папка с игрой подписана как _Gta San Andreas_, но по факту будет та которую вы указали в установщике

Скрытый текст

*   Gta San Andreas\\libraries\\audio.dll
*   Gta San Andreas\\libraries\\audiowpm.dll
*   Gta San Andreas\\libraries\\audiowpm2.dll
*   Gta San Andreas\\libraries\\bass.dll
*   Gta San Andreas\\libraries\\bassmix.dll
*   Gta San Andreas\\libraries\\plugins
*   Gta San Andreas\\libraries\\plugins\\bass\_aac.dll
*   Gta San Andreas\\libraries\\plugins\\bass\_ac3.dll
*   Gta San Andreas\\libraries\\plugins\\bass\_alac.dll
*   Gta San Andreas\\libraries\\plugins\\bass\_ape.dll
*   Gta San Andreas\\libraries\\plugins\\bass\_mpc.dll
*   Gta San Andreas\\libraries\\plugins\\bass\_spx.dll
*   Gta San Andreas\\libraries\\plugins\\bass\_tta.dll
*   Gta San Andreas\\libraries\\plugins\\bassflac.dll
*   Gta San Andreas\\libraries\\plugins\\bassmidi.dll
*   Gta San Andreas\\libraries\\plugins\\basswma.dll
*   Gta San Andreas\\libraries\\plugins\\basswv.dll
*   Gta San Andreas\\libraries\\fonts
*   Gta San Andreas\\libraries\\fonts\\Argor Got Scaqh.ttf
*   Gta San Andreas\\libraries\\fonts\\Biff.ttf
*   Gta San Andreas\\libraries\\fonts\\Boring Lesson.ttf
*   Gta San Andreas\\libraries\\fonts\\Bring tha noize.ttf
*   Gta San Andreas\\libraries\\fonts\\BSSYM7.TTF
*   Gta San Andreas\\libraries\\fonts\\Degrassi.ttf
*   Gta San Andreas\\libraries\\fonts\\Earthquake.ttf
*   Gta San Andreas\\libraries\\fonts\\Ghang.ttf
*   Gta San Andreas\\libraries\\fonts\\Ghostmeat.ttf
*   Gta San Andreas\\libraries\\fonts\\Got No Heart.ttf
*   Gta San Andreas\\libraries\\fonts\\Graffiti Treat.ttf
*   Gta San Andreas\\libraries\\fonts\\Grafftti123.ttf
*   Gta San Andreas\\libraries\\fonts\\Grand Stylus.ttf
*   Gta San Andreas\\libraries\\fonts\\Ground Zero.ttf
*   Gta San Andreas\\libraries\\fonts\\Hawkeye.ttf
*   Gta San Andreas\\libraries\\fonts\\Kookaburra.ttf
*   Gta San Andreas\\libraries\\fonts\\Lazerbeam surprise.ttf
*   Gta San Andreas\\libraries\\fonts\\Ludvig van Bethoveen.ttf
*   Gta San Andreas\\libraries\\fonts\\Magnolia.ttf
*   Gta San Andreas\\libraries\\fonts\\Noodle soup.ttf
*   Gta San Andreas\\libraries\\fonts\\Old-Town-Normal.ttf
*   Gta San Andreas\\libraries\\fonts\\PizzaDudeFatOnline.ttf
*   Gta San Andreas\\libraries\\fonts\\Planet Benson 2.ttf
*   Gta San Andreas\\libraries\\fonts\\Pollock3CTT.ttf
*   Gta San Andreas\\libraries\\fonts\\RAZMAHONT.ttf
*   Gta San Andreas\\libraries\\fonts\\Regurgitation.ttf
*   Gta San Andreas\\libraries\\fonts\\Rurintania.ttf
*   Gta San Andreas\\libraries\\fonts\\SomewhereInSpace.ttf
*   Gta San Andreas\\libraries\\fonts\\TagsXtreme.ttf
*   Gta San Andreas\\libraries\\fonts\\TagsXtreme2.ttf
*   Gta San Andreas\\libraries\\fonts\\Tourist Trap.ttf
*   Gta San Andreas\\libraries\\fonts\\Wesmo.ttf
*   Gta San Andreas\\libraries\\fonts\\WishfulWaves.ttf
*   Gta San Andreas\\libraries\\fonts\\WOOD.ttf
*   Gta San Andreas\\libraries\\fonts\\Xiomara.ttf
*   Gta San Andreas\\libraries\\fonts\\Yytrium.ttf
*   Gta San Andreas\\data\\procobj2.dat
*   Gta San Andreas\\libraries\\backup\\gta\_sa.set
*   Gta San Andreas\\Update.exe
*   Gta San Andreas\\libraries\\backup\\1.bat
*   C:\\Windows\\system32\\d3dx9\_25.dll
*   C:\\Windows\\system32\\d3dx9\_40.dll
*   C:\\Windows\\system32\\d3dx9\_43.dll
*   Gta San Andreas\\libraries\\samp.asi
*   Gta San Andreas\\libraries\\audio.sig
*   Gta San Andreas\\libraries\\audiostart.sig
*   Gta San Andreas\\models\\particle2.txd
*   Gta San Andreas\\models\\particle3.txd
*   Gta San Andreas\\models\\hud2.txd
*   Gta San Andreas\\models\\txd\\Battery.txd
*   Gta San Andreas\\libraries\\backup\\disablemonitors.txt
*   Gta San Andreas\\libraries\\backup\\fpsnotebook.txt
*   Gta San Andreas\\libraries\\backup\\GameExplorerDisable
*   Gta San Andreas\\libraries\\backup\\GameExplorerDisable\\Rename\_Sys32\_64\_GameUXLegacyGDFs.bat
*   Gta San Andreas\\libraries\\backup\\GameExplorerDisable\\Start\_Rename\_Sys32\_Game.bat
*   Gta San Andreas\\libraries\\backup\\GameExplorerDisable\\Start\_Rename\_Sys64\_Game.bat
*   Gta San Andreas\\libraries\\backup\\GameExplorerDisable\\32
*   Gta San Andreas\\libraries\\backup\\GameExplorerDisable\\32\\GameExplorerDisable.exe
*   Gta San Andreas\\libraries\\backup\\GameExplorerDisable\\64
*   Gta San Andreas\\libraries\\backup\\GameExplorerDisable\\64\\GameExplorerDisable.exe
*   Gta San Andreas\\libraries\\backup\\1.bat
*   %appdata%\\SA-MP Audio Plugin
*   %appdata%\\audiopacks
*   %appdata%\\audio.ini
*   %appdata%\\audio.txt
*   %appdata%\\audiopacks
*   %appdata%\\dialog.ini
*   %appdata%\\emoji.ini

**Файлы в которые SAMP ADDON может заменить при уставновке**

Скрытый текст

*    \\data\\timecyc.tmp
*    \\models\\hud.txd
*    \\models\\fonts.txd
*    \\models\\generic\\vehicle.txd
*    \\models\\fronten1.txd
*    \\models\\fronten\_pc.txd
*    \\models\\effects.fxp
*    \\models\\particle.txd
*    \\models\\effectsPC.txd
*    \\sampgui.png
*    \\mouse.png
*    \\SAMP\\custom.img
*    \\SAMP\\custom.ide
*    \\text\\american.gxt
*    \\text\\spanish.gxt

**Изменения которые SAMP ADDON вносит в samp.img**

Скрытый текст

Исправлена ошибка, из-за которой вы не могли установить моды на скин 163-166  
Исправлена ошибка скина 300-302, из-за которой некоторые объекты становились прослушиваемыми при установке модов  
Исправлены текстуры лезвий, приводившие к сбою на графической карте Intel HD Graphicsx

**Изменения в файле эффектов effectsPC.txd**

Скрытый текст

Все текстуры эффектов аддона перепакованы с использованием mipmap (Увеличивает качество эффектов уменьшая рябь)  
В эффектах увеличено расстояние эффекта огня, фонтана, дыма огнетушителя, газа баллончика и выстрела танка  
В эффектах заменена текстура следа от взрыва

  
**Настройки SAMP ADDON**

  
Разработчик предоставил вместо устаревшего файла addon.ini, включение и отключение некоторых возможностей аддона через текстовые файлы.    
Создайте текстовый файл с указанным именем ниже и текстом 1. Список настроек: 

Скрытый текст

*   anticheatexit.txt - появляется при закрытии игры из-за сработки античита
*   **disable**ac.txt - отключает античит
*   **disable**addon.txt - отключить все функции аддона (не работает на абс)
*   **disable**anticrash.txt - отключает антикраш для отладки
*   **disable**antiesc.txt - отключает антиафк
*   **disable**antivsync.txt - отключить [V-Sync](https://www.mixmods.com.br/2022/10/iii-vc-sa-windowed-mode/)
*   **disable**autodialog.txt - отключить автозаполнение в диалогах
*   **disable**autooptions.txt - неизвестно
*   **disable**autoconnect.txt - отключить автореконнект
*   **disable**cleonotice.txt- отключает уведомления античита
*   **disable**chatfonthd.txt - отключить HD шрифт (на мониторах Ultra HD)
*   **disable**drawdistance.txt - отключить изменение прорисовки
*   **disable**fastload.txt - отключает пропуск загрузочных экранов (некоторые моды и cleo-скрипты выходят из строя при быстрой загрузке)
*   **disable**fpslimit.txt отключает SAMP FPS ограничитель и при включенном античите
*   **disable**grass.txt - отключить траву и кусты как в сингле
*   **disable**icontransparency.txt - отключить альфа-иконки на радаре
*   **disable**ins.txt - включать/выключать загрузку аудиофайлов
*   **disable**modloadernotice.txt - отключить предупреждение при 2м запуске с modloader
*   **disable**reflection.txt - отключить отражения
*   **disable**window.txt - отключить отображение оружия в окне автомобиля
*   **enable**mousebuttons.txt - включает боковые клавиши как Enter и ESC
*   **enable**fallteleport.txt - включить телепортацию вместо смерти при падении под карту
*   fpsnotebook.txt - убирает лимит в 100 FPS на ноутбуках

**Встроенный биндер**  
Встроенный в Аддон биндер работает только на проекте [Absolute Play Roleplay](https://vk.com/gtasamp) (на [DM](https://vk.com/absdm) отключили) _Клавиша Y - Настройки - Другое или  /бинд_   
Аддон создает файл _Мои документы/GTA San Andreas User Files/SAMP/binder.ini_ который отправляет в аккаунт, настройки биндера.  
\*Если в аккаунте на клавишу бинд уже прописан - он заменён не будет, чтобы по ошибке не стереть существующий бинд

**Некоторые нюансы и специфика авто-настроек аддона:**

*   При выставлении стандартных настроек включается сглаживание 2x/4x, на старых видеокартах сглаживание не включается
*   Стандартные настройки игры выставлены корректными и на максимум. 
*   Автонастройка включается при первом запуске SAMP Addon даже если игра до установки Addon'а уже была запущена
*   Увеличенная дальность объектов не включается на среднем, а только на высоком уровне эффектов, а облака отключаются на низком уровне эффектов
*   В файле настроек [sa-mp.cfg](https://team.sa-mp.com/wiki/Sa-mp.cfg.html) автоматически включается параметр audiomsgoff
*   При неверном размере файла настроек gta\_sa.set файл отчищается для исправления проблем с ним (создаст gta\_sa.set с нулевым разрешением экрана)
*   Плагин samp.asi работает [только с samp 0.3.7 R1 и DL версией](https://gtaforums.com/topic/760017-samp-addon/?do=findComment&comment=1070579080)
*   При игре на нескольких мониторах появляется окно выбора монитора. Поддержка всех разрешений монитора в одиночной игре.  
    (Настройка при установке - всегда запускать игру на 1-м мониторе - для отключения окна выбора мониторов Выбор разрешения) 
    
    Скрытый текст
    
    ![dxUWKTh.png](https://i.imgur.com/dxUWKTh.png)
    

**Поддерживаемые моды**

Поддерживается установка модов через [ModLoader](https://gtaforums.com/topic/669520-mod-loader/). Вы можете использовать [CLEO](https://cleo.li/ru) скрипты и [ASI](https://cookieplmonster.github.io/mods/gta-sa/#asiloader) плагины совместно с  SAMP Addon. Есть частичная поддержка [MoonLoader](https://www.blast.hk/threads/13305/) и [SAMPFUNCS DL](https://www.blast.hk/threads/138813/), но пока нет информации о lua скриптах либо SF плагинах работающих с включенным античитом. [Консоль SAMPFUNCS](https://wiki.blast.hk/sampfuncs/console) не включается на Absolute Play даже с отключенным античитом, и включением альтернативных клавиш в [sampfuncs-settings.ini](https://wiki.blast.hk/sampfuncs/settings). Ввиду того что SAMPFUNCS DL в таком виде использовать не имеет смысла, а время загрузки - выгрузки игры увеличивается, к установке он не рекомендуется. Все скрипты и плагины фильтруются по белому списку, и при наличии неизвестных файлов вам предложит удалить их, либо отключить античит. 

Обратите внимание, что в аддоне есть различные исправления, которые также есть в других модах, таких как _[Mix Sets](https://www.mixmods.com.br/2022/03/sa-mixsets/)_ и [SilentPatch](https://gtaforums.com/topic/669045-silentpatch/). Это не должно привести к сбоям в случае, если моды делают одни и те же вещи (но может привести к несовместимости с другими модами). В аддоне нет предустановленно [ENB](http://enbdev.com/download_mod_gtasa.htm), но есть множество улучшений графики и он совместим с другими графическими модами. С включенным античитом аддон не позволяет запускать [AutoHotKey](https://www.autohotkey.com/) (AHK), [AutoIT](https://www.autoitscript.com/site/) (AU3) и другие макросы.

Скрытый текст

![pBhgJXF.png](https://i.imgur.com/pBhgJXF.png)

![SB1SHe7.png](https://i.imgur.com/SB1SHe7.png)

  
Ниже список совместимых с аддоном скриптов, плагинов и модификаций:

Скрытый текст

**ASI** 

*   [Advanced Vehicle Sirens.asi](https://github.com/nora-soderlund/AdvancedVehicleSirens)
*   [always\_front\_radar.asi](https://libertycity.ru/files/gta-san-andreas/170661-always-front-radar.html)
*   [blackroadsfix.asi](https://gtaforums.com/topic/763402-sarelfinally-black-roads-fix/)
*   [BulletHole.asi](https://gta-samp.ru/mods)
*   [ChangeRenderAmmo.asi](https://www.blast.hk/threads/53067/)
*   [Crashes.asi 2.51](https://github.com/Whitetigerswt/gtasa_crashfix/releases)
*   [dof.asi](https://libertycity.net/files/gta-san-andreas/40537-depth-of-field.html) (Ryosuke DOF)
*   [EffectLoader.asi](https://gtaforums.com/topic/895084-using-effects-loader-by-dk22pac/) (1.1 only)
*   [exdisp.asi](http://hotmist.ddo.jp/plugin/exdisp/index.html) (Display Settings Extender)
*   [fastman92limitAdjuster.asi](https://gtaforums.com/topic/733982-fastman92-limit-adjuster/)
*   [fixes.asi](https://www.blast.hk/threads/19560/)
*   [FirstPersonModFix.asi](https://gtaforums.com/topic/710626-first-person-mod/) (First-person v3.0 fixed)
*   fcfi (Author MISTER\_GONWIK).asi - normal font change without any textdrives
*   Flickr.asi
*   [FogDistance.asi](https://www.mixmods.com.br/2021/11/gta-trilogy-fog-distance-fix/)
*   FPSBOOST BY DAPO.asi  (это переименованный SilentPatch)
*   [GInput.asi](https://gtaforums.com/topic/562765-ginput/)
*   [GPS Mod](https://gtaforums.com/topic/897543-sa-gps-for-samp-asi-plugin/) (SA\_GPS.asi и SAMP-GPS.asi)
*   [GraphicsTweaker.SA.asi](https://www.mixmods.com.br/2022/09/graphicstweaker/)
*   [InterfaceEditor.asi](https://github.com/Montrii/SAMP-InterfaceEditor) (Visual Interface Editor)
*   [imCamAim.asi](https://github.com/DK22Pac/advanced-aiming-mod) (Advanced Aiming Mod от DK22Pac)
*   [Imfx.asi](https://gtaforums.com/topic/508919-imfx/) (Improved FX effects)
*   [ImVehFt.asi](https://gtaforums.com/topic/528175-improved-vehicle-features/#comments) (Improved Vehicle Features)
*   [killlog.asi](https://gamemodding.com/ru/gta-san-andreas/cleo-scripts/17190-kill-log.html) (Ryosuke839)
*   [lensflare.asi](https://libertycity.net/files/gta-san-andreas/153938-smooth-lensflare-imfx-addon.html) - солнечные блики
*   [MenuMusic.asi](https://libertycity.ru/files/gta-san-andreas/98395-menus-music.html)
*   [MenuUI.asi](https://www.mixmods.com.br/2021/09/menuui-v1-5-menus-modernos/)
*   [Mobile Hud.asi](https://github.com/DK22Pac/mobile-hud/releases)
*   [MotionBlur.asi](https://gtaforums.com/topic/305432-relsa-motion-blur-advanced/page/1/) (Motion\_Blur\_Advanced)
*   [NormalMap.asi (by DK) + NormalMapFix.asi](https://gtaforums.com/topic/760083-normal-map-plugin-tools/)
*   [NoShadows.asi](https://www.blast.hk/threads/55545/)
*   [PedFuncs.asi](https://www.mixmods.com.br/2022/07/pedfuncs/)
*   [ped\_spec.asi](https://www.mixmods.com.br/2015/02/ped-spec-iluminacao-specular-nas-pessoas-como-no-mobile/) (Ped Spec Illumination)
*   [ps2refl.asi](https://www.gtainside.com/en/sanandreas/mods/102036-ps2-reflection) (PS2 Reflections)
*   [RadarRect.asi](https://www.gtainside.com/en/sanandreas/mods/58399-new-hud/)
*   [RealSkybox.SA.asi](https://www.mixmods.com.br/2021/06/sa-real-skybox/)
*   RRRainbowW.asi
*   [sa\_draw\_distance\_changer.asi](https://www.gtainside.com/en/sanandreas/mods/129006-sa-draw-distance-changer-asi-plugin/)
*   [sagfx\_ps2.asi](https://www.gtainside.com/en/sanandreas/other/35049-sagfx-reflections-mod/) (GFX PS2 to PC)
*   [SALodLights.asi](https://github.com/goodidea82/SAxVCxLC/tree/master/SAxVCxLC_source/otherMods_root/Project2Dfx) (Project2DFX)
*   [sampfxtfix.asi](https://www.mixmods.com.br/2016/08/samp-fxt-fix-corrigir-mods-fxt-no-samp/) (fixing mods .fxt in SAMP) 
*   [sa\_widescreenfix\_lite.asi](https://www.gtagarage.com/mods/show.php?id=23407) (Widescreen Fix Remake)
*   [SAWindow.asi](https://gtaforums.com/topic/367393-rel-sa-window/)
*   [ScreenChat.asi](https://www.blast.hk/threads/97761/)
*   [Searchlights.asi](https://www.gtagarage.com/mods/show.php?id=23046) (this mods crashes on DL version!)
*   [shell.asi](https://www.blast.hk/threads/19172/) (Ryosuke | Absolute Team)
*   [SilentPatchSA.asi](https://gtaforums.com/topic/669045-silentpatch/)
*   [SkyGfx\_SA\_4.0.asi](https://gtaforums.com/topic/750681-skygfx-ps2-xbox-and-mobile-graphics-for-pc/)
*   [SkyGrad.asi](https://www.mixmods.com.br/2020/01/skygrad-sky-gradient-fix-corrigir-linhas-no-ceu/)
*   [speedometer.asi](https://www.mixmods.com.br/2020/01/sa-speedometer-asi/) (DK22Pac Forza Horizon 3 Speedometer)
*   [StaticRadar](https://www.blast.hk/threads/104141/)
*   [StreamMemFix.asi](https://www.gtagarage.com/mods/show.php?id=16398)
*   [TheBirdsUpdate.asi](https://gtaforums.com/topic/526999-relsaasi-the-birds-update/)
*   [timecycle24.asi](https://gtaforums.com/topic/892517-24h-timecycle/)
*   [VehFuncs.asi](https://github.com/JuniorDjjr/VehFuncs) (некоторые функции VehFuncs отключены)
*   [vehlightsfix.asi](https://www.gtainside.com/en/sanandreas/cars/141447-mugetsuga-s-fixed-vehicle-lights/) (Vehicle Lights Fix)
*   [ViceBit.asi](https://www.gtavicecity.ru/gta-san-andreas/mods/213177-star-search-is-always-on-screen-vicebit.html)
*   [WeaponIconsTXD.SA.asi](https://www.mixmods.com.br/2022/02/sa-weapon-icons-txd/)
*   [wshps.asi](https://gtaforums.com/topic/669618-plugos-widescreen-hor-support/) (Widescreen HOR)

**CLEO**

*   [AceHud.cs](https://gtaforums.com/topic/875346-ace-hud-customizable-hud/)
*   [Auto Remove Marker (Junior\_Djjr).cs](https://www.mixmods.com.br/2019/07/auto-remove-marker-apagar-marcador-ao-chegar-no-destino/)
*   [Back-fire.cs](https://www.mixmods.com.br/2016/06/backfire-als-v2-5-mod-estalar-escapamento/) (This script makes a flash at the muffler, like a turbocharger)
*   [Beam Effect.cs](https://www.gtainside.com/en/sanandreas/mods/166155-headlight-beam-effect/)
*   binthesky\_by\_DK.cs
*   Breath of Power
*   [cam\_dynamic\_FOV.cs](https://www.mixmods.com.br/2020/09/dynamic-fov/) (Dynamic FOV)
*   [CamHeli.cs](https://gtaforums.com/topic/760815-relvcsa-police-helicopter/) (Police Maverick Cam Mod)
*   [crspeed.cs](https://libertycity.net/files/gta-san-andreas/179474-unikalnyjj-spidometr.html)
*   [compas.cs](https://www.gtainside.com/en/sanandreas/mods/113146-street-map-and-square-map-and-compass)
*   [Enhance ParticleTXD (Junior\_Djjr).cs](https://www.mixmods.com.br/2016/03/enhance-particletxd/)
*   [emergency.cs](https://gtaforums.com/topic/439172-cleoemergency-light-mod-elm-v8/) (sampcs\_helper)
*   [FixDIST.cs](https://www.blast.hk/threads/11197/) (by SR team)
*   FPS\_shw.cs (Show FPS)
*   [gtaiv\_lights.cs](https://gtaforums.com/topic/929259-gta-iv-dynamic-lights-for-gta-sa/) и Head.cs (Улучшенный свет от фар)
*   HealthAndArmor.cs 
*   [HUDFix.cs](https://www.blast.hk/threads/42987/)
*   [Load Whole Map (Junior\_Djjr).cs](https://www.mixmods.com.br/2019/11/novo-load-whole-map/)
*   [memory2048.cs](https://www.gtavicecity.ru/gta-san-andreas/cleo/70866-memory2048-fix.html)
*   [mousensxy.cs](https://www.mixmods.com.br/2017/07/mouse-y-sensitivity-fix-corrigir-sensibilidade-vertical-do-mouse/)
*   nature.cs
*   [noisefix.cs](https://libertycity.ru/files/gta-san-andreas/151667-noise-fix-uluchshennyjj-dozhd.html)
*   par.cs (пар со рта)
*   [PerPixelLighting.cs](https://libertycity.net/files/gta-san-andreas/155411-dinamicheskoe-osveshhenie-obektov.html)
*   pF\_Weaponeffects1.cs
*   [Plane CAM V1.1.cs](https://www.gtainside.com/en/sanandreas/mods/55011-gta-v-plane-cam/) (GTA V Plane Cam)
*   pricel.cs
*   [radar\_color\_fix.cs](https://www.gtainside.com/en/sanandreas/mods/117906-radar-disc-color-fix/)
*   radio\_off.cs
*   RAIN.cs, RainModEffect.cs (SA Rain Atmosphere)
*   [Rapid\_opening\_map.cs](https://www.gtaall.net/gta-san-andreas/cleo/38714-rapid-opening-map.html)
*   [REAR\_LIGHT.cs](https://gta.com.ua/file_sa_details.phtml?id=2256) (Rear Light Mod)
*   [Remove 3D Gunflash.cs](https://www.mixmods.com.br/2018/12/remove-3d-gunflash-forcar-efeito-de-tiro/)
*   [San Andreas Ambient Sounds SAAS](https://gtaforums.com/topic/825069-san-andreas-ambient-sounds-saas/) 
*   [sampcs\_helper.cs](https://www.gtagarage.com/mods/show.php?id=27231)
*   [SensitivityFix.cs](https://www.gtagarage.com/mods/show.php?id=24929)
*   [SightDistance\_by\_0x688.cleo](https://www.blast.hk/threads/206/) (Timecyc fix)
*   siren on without driver.cs
*   [SkyBoX.cs](https://www.mixmods.com.br/2021/06/sa-real-skybox/) (в 2.7 не работает)
*   [SniperScope.cs](https://www.mixmods.com.br/2015/12/sniper-scope-v1-1/)
*   [SnowFX.cs (SnowFX-Start.cs)](https://libertycity.ru/files/gta-san-andreas/121210-snowfx-v4.0-snegopad.html)
*   [Status\_Indicators.cs](https://www.gtainside.com/en/sanandreas/mods/160469-custom-status-indicators/)
*   [steering.cs](https://www.mixmods.com.br/2015/08/steering-active-dashboard/)
*   strobs.cs
*   Sun.cs (sunfix)
*   [suninobject.cs](https://vk.com/wall-172805990_5379) 
*   [Timecyc.cs](https://www.blast.hk/threads/206/)
*   [trlcountdown.cs](https://libertycity.net/files/gta-san-andreas/32808-obratnyjj-otschet-vremeni-vozle.html)
*   [turn\_indicators2.cs](https://libertycity.net/files/gta-san-andreas/33015-universalnye-povorotniki-2-0.html) (Turn signals 2.1)
*   [wase.cs](https://www.mixmods.com.br/2019/09/dynamic-weapon-draw-sound-v2-5-som-ao-manusear-arma/) (Dynamic Weapon Draw Sound)
*   [Water effects.cs](https://libertycity.net/files/gta-san-andreas/115254-chasticy-na-vode-bljoski-ot-solnca-kak.html)
*   [Waves on water.cs](https://www.gtagarage.com/mods/show.php?id=27450)
*   [zonetext.cs](https://www.gtagarage.com/mods/show.php?id=6767)

**Modloader plugins**

*   std.bank.dll
*   std.fx.dll
*   std.sprites.dll
*   std.tracks.dll

 (другие плагины добавить в поддержку не удалось в силу их читерских возможностей)  
Избегайте слишком большого количества файлов .dff и .txd в ModLoader!! Моды, которые заменяют сотни файлов .dff или .txd, рекомендуется устанавливать в файл .img, а не оставлять все .файлы dff и .txd внутри папок в modloader, в противном случае могут возникать перебои / заикания / задержки / сбои, особенно на HDD дисках.

**SAMPFUNCS DL и MoonLoader**  
\* пока нет информации о lua скриптах либо SF плагинах работающих с включенным античитом

**Разработки/доработки Absolute Play (+ [https://gta-samp.ru/mods)](https://gta-samp.ru/mods))**

\* [NormalMap.asi](https://gtaforums.com/topic/759412-relsa-fixes-for-normalmapweapons-outfit-and-shell/) - Улучшенное освещение персонажей  
\* [OutFitFix.asi](https://gtaforums.com/topic/759412-relsa-fixes-for-normalmapweapons-outfit-and-shell/) - Исправляет сбои при предварительном просмотре textdraws  
\* [SAMP Graphic Restore.asi](https://gtaforums.com/topic/759412-relsa-fixes-for-normalmapweapons-outfit-and-shell/) - Плагин отображает корректно абсолютно все прелести ENB Series в многопользовательской игре.  
\* [Bullet Hole.asi](https://gta-samp.ru/mods) - дыры от пуль  
\* [Color Mod](https://gta-samp.ru/mods) \- Улучшенная яркость освещения  
\* [Snow Fx](https://gta-samp.ru/mods)\- Снежный мод и снежинки  
\* Mousefix - Исправляет баг когда после захода в меню или после сворачивания игры перестает работать мышка  
\* [Shell Fix](https://gta-samp.ru/mods) - гильзы   
\* [NvidiaGeforceTransparentAntialias.asi](https://vk.com/gtasamp?w=wall-50232903_355243) - улучшенное сглаживание для видеокарт Nvidia

Разное:  
\* Поддержка всех графические модов (ENB) + они отображают графику корректно в SAMP  
\* Есть возможность [замены timecyc](https://gtaforums.com/topic/953028-timecyc-gta-sa-instalation/)  
\* Поддержка [HUD - конструктор худов](https://libertycity.ru/files/gta-san-andreas/153937-hud-konstruktor-khudov.html)  
\* Поддержка CLEO худов (speed.cs, speedometr.cs, speedometr.cs, NFSHUD.cs, Spdmeter.cs, speed\_BG.cs, Highspeed.cs)  
\* [SA Overdose Effects 1.5](https://www.gtagarage.com/mods/show.php?id=9226) 

Некоторые моды которые приводят к утечкам памяти, и ненужным повторяющимся операциям во время игрового процесса, либо вызывают конфликты при использовании других модов. Часто нелегко определить, является ли мод проблемным или нет, ведь это зависит от многих факторов. Ниже перечислены уже известные несовместимые и проблемные моды.

Несовместимые либо вызывающие проблемы моды:

Скрытый текст

*   [crc32ffi.lua](https://www.blast.hk/threads/126454/) - приводит к мгновенному закрытию игры без каких-либо ошибок или журнала. Поставляется с  "MoonLoader Examples"
*   Быстрый запуск из [crashes.asi](https://github.com/Whitetigerswt/gtasa_crashfix/releases) отключён из-за несовместимости с античитом вызывающим вылеты на старте
*   [GFXHack.asi](https://www.blast.hk/threads/25129/) \-  устарел,  может вызывать краши на новых клиентах (SILENTPATCH уже содержит этот фикс)
*   [III.VC.SA.LimitAdjuster.asi](https://github.com/goodidea82/SAxVCxLC/tree/master/SAxVCxLC_source/otherMods_root/Project2Dfx) (Project2DFX) данный плагин вызывает проблемы со стабильность и производительностью
*   map.asi переименовывается аддоном для выключения, если установлен не samp 0.3.7 R1, т.к. крашит на других версиях
*   Вместо краша моды ModLoader, V\_HUD\_by\_DK22Pac и ImVehFt не запускаются при 2м одновременном запуске игры
*   [newCoronaLimit.asi](https://forum.mixmods.com.br/f19-ideias-de-mods-procura/t772-a-list-of-outdated-mods) приводит к сбою в отображении шейдера ENB на автомобилях. (Устарел)
*   [maplimit260.lua](https://www.mixmods.com.br/2020/10/moonloader/) - вызывает сбой после загрузки.
*   [Proper\_Fixes](https://www.mixmods.com.br/2023/07/sa-proper-fixes/) - мод не адаптирован под SAMP
*   SA\_Lightning.asi - устарел, не работает на WIn7/10
*   [SCMDirectDrawing.asi](https://gtaforums.com/topic/568253-scm-direct-drawing/) - конфликтует с другими плагинами, и приводит к тому, что шрифты и информационное поле не отображаются.
*   [Searchlights.asi](https://libertycity.ru/files/gta-san-andreas/112784-searchlights.html) переименовывается аддоном для выключения, т.к. крашит на 0.3DL
*   [Shadow Height Fix (Junior\_Djjr).cs](https://www.mixmods.com.br/2018/10/shadow-height-fix-corrigir-altura-das-sombras/) - не работает при запуске  второго окна (краш)
*   [SuperVars.asi](https://gtaforums.com/topic/902636-supervarsasi-causing-crash/) - устарел, может вызывать краши на новых клиентах
*   WideScreenFix (GTA.SA.WideScreen.Fix.asi) - сбрасывает разрешение до разрешения рабочего стола,  при нулевых параметрах ResX и ResY

**Совместимые, но не работают с включенным античитом** 

*   CustomSAA2 (и dsound.dll) запрещен т.к. снимает блокировку с защищенных файлов сампа
*   [Improved\_and\_Fixed\_Original Vegetation](https://www.mixmods.com.br/2021/04/improved-and-fixed-original-vegetation-arvores-mais-redondas/) не работает через ModLoader без всех плагинов (можно установить через патч img файла вручную)
*   [LOD Vegetation v1.2 (distant trees)](https://www.mixmods.com.br/2021/12/lod-vegetation-distant-trees/) - блокировка из-за изменения файла SAMP/custom.ide
*   [Pre-lighting Fixes Pack](https://www.mixmods.com.br/2021/10/pre-lighting-fixes-pack-correcoes-de-iluminacao/) - блокировка из-за изменения файла SAMP.ide
*   [PS2 Map + Fixes (PS2 map and fixes)](https://www.mixmods.com.br/2017/01/ps2-map-fixes-mapa-do-ps2-e-correcoes/) - блокировка из-за изменения файлов SAMP.ide и SAMP.ipl 
*   [sa\_fixed\_textures](https://www.mixmods.com.br/2021/08/map-textures-fix-v4-1-correcao-das-texturas-do-mapa/) - блокировка из-за изменения файлов SAMP.ide и SAMP.ipl 
*   [SA Optimized Map](https://www.mixmods.com.br/2021/09/sa-optimized-map/) - блокировка из-за изменения файла SAMP/custom.ide

**Анти-читом запрещено заменять**

*   файл анимаций [anim/ped.ifp](https://gtamods.com/wiki/IFP)
*   [data/maps/leveldes/seabed.ipl](https://gtaforums.com/topic/922944-ps2-features-back-to-pc-seabedipl-issues/)
*   модифицированный файл воды data/water.dat и data/water1.dat
*   компоненты клиента и samp.dll, samp.saa + каталог /SAMP

Моды дублирующие функционал SAMP Addon:

Скрытый текст

*   [blackroadsfix.asi](https://gtaforums.com/topic/763402-sarelfinally-black-roads-fix/) - исправляет чёрные дороги
*   [Fastloader](https://www.mixmods.com.br/2014/02/improved-fastloader-by-link-2012/)  - Фикс для быстрого открытия игры
*   Flickr.asi - SILENTPATCH и SAMP Addon уже содержит этот фикс
*   [DwmComposition.asi](https://www.blast.hk/threads/13368/) - Отключение перехода в упрощенный стиль Aero
*   [iii\_vc\_sa\_transparentmenu.asi](https://libertycity.ru/files/gta-san-andreas/96340-transparent-menu.html) - функция прозрачного меню в ESC
*   High Quality Lights Mod уже включен в аддон (включите использование новых текстур при установке аддона)
*   [Multi-Sampling fix.asi](https://gtaforums.com/topic/556386-relsa-multi-sampling-fix/) (By DK22Pac) исправляет отображение зеркал в шкафах и других помещениях. (SILENTPATCH и SAMP Addon уже содержит этот фикс)
*   [reffix.asi (Road Reflections Fix)](https://www.gtagarage.com/mods/show.php?id=22398) - Исправляет отражение на дорогах в дождливую погоду. (SILENTPATCH и SAMP Addon уже содержит этот фикс)
*   [Widescreen Fix by ThirteenAG](https://thirteenag.github.io/wfp) - Исправление широкоэкранного режима
*   [Widescreen Fix HOR+ Support](https://www.mixmods.com.br/2021/05/widescreen-fix-para-gta-sa-corrigir-widescreen/) - Поддержка широкоэкранного исправления HOR+

_Disclaimer: Вся информация была получена опытным путем либо из открытых источников. Механизмы работы античита и компонентов аддона принципиально не рассматриваем.  
Автор не агитирует вас использовать данный мод. Тема создана чтобы помочь игрокам получить подробную информацию о работе samp addon, и помочь оперативно найти решение возможных проблем._ 

Источники:  
\- [https://sa-mp.ru/sampaddon](https://sa-mp.ru/sampaddon) - официальная страница SAMP Addon, и [https://vk.com/absdm](https://vk.com/absdm) - официальная группа в VK  
\- [https://gtaforums.com/topic/760017-samp-addon/page/1](https://gtaforums.com/topic/760017-samp-addon/page/1) - официальная страница SAMP Addon для англоязычных игроков  
\- [https://www.mixmods.com.br/2021/09/primeiros-passos-para-montar-um-gta-modificado/](https://www.mixmods.com.br/2021/09/primeiros-passos-para-montar-um-gta-modificado/) - First steps to assemble a modified GTA
