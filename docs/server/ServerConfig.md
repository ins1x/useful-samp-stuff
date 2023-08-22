## **SA:MP Server installation**

#### Установка на Windows
1. Создайте каталог под сервер например sa-mp
2. Загрузите необходимое программное обеспечение с [sa-mp.com](https://www.sa-mp.com/download.php)
3. Распакуйте архив в созданный ранее каталог.
4. Редактируем [server.cfg](https://open.mp/docs/server/server.cfg) по своему усмотрению.
5. Запускаем samp-server.exe
6. Чтобы подключиться к серверу на [локалхосте](https://ru.wikipedia.org/wiki/Localhost) добавляем сервер [127.0.0.1:7777](samp://127.0.0.1:7777) в клиенте.  

#### Установка на Linux
1. Создайте директорию sa-mp в домашней директории пользователя командой:
```mkdir sa-mp```
2. Загрузите на сервер программное обеспечение следующей командой:
```wget http://files.sa-mp.com/samp037svr_R2-1.tar.gz```
3. Распакуйте архив:
```tar -xzf samp03dsvr.tar.gz -C sa-mp```
4. После первого запуска у вас появится файл [server.cfg](https://open.mp/docs/server/server.cfg), который выглядит примерно следующим образом:
```
	echo Executing Server Config...
	lanmode 0
	rcon_password changeme
	maxplayers 50
	port 7777
	hostname SA-MP 0.3 Server
	gamemode0 grandlarc 1
	filterscripts gl_actions gl_realtime gl_property gl_mapicon ls_elevator attachments skinchanger vspawner 
	announce 0
	chatlogging 0
	weburl www.sa-mp.com
	onfoot_rate 40
	incar_rate 40
	weapon_rate 40
	stream_distance 300.0
	stream_rate 1000
	maxnpc 0
	logtimeformat [%H:%M:%S]
	language English

```
Отредактируйте его на свое усмотрение. Важно обязательно сменить пароль rcon а также сверить все filterscipts и plugins.

5. Перейдите в директорию sa-mp и установите права доступа на выполнение следующими командами
```
 cd ./sa-mp/
 chmod +x samp03svr
```
6. Запустите сервер в фоновом режиме:
``` ./samp03svr & ```
Остановить сервер можно будет командой *killall samp03svr*

Вход на сервер под [rcon'ом](https://open.mp/docs/server/ControllingServer) доступен через /rcon login <password>.

> [На Pawnokit](https://pawnokit.ru/ru/files) можно найти все предыдущие версии сервера.

#### Содержимое директории сервера

- «scriptfiles»— единственный каталог доступный на чтение-запись напрямую из мода. 
- «plugins» — директория под различные плагины
- «pawno»— [компилятор](https://github.com/pawn-lang/compiler/), компилирует исходник .pwn в формат .amx
- «npcmodes»— содержит файлы ботов и маршруты их передвижения.
- «include»— исходные файлы (библиотеки).
- «gamemodes»— здесь хранятся игровые  моды.
- «server.cfg»— основной файл конфигурации сервера. 
- «samp-server.exe/samp03svr»— основное приложение, которое запускает сервер samp.  

[Процесс установки MTA сервера](https://wiki.multitheftauto.com/wiki/RU/Server_Manual) подробно описан в официальном wiki, есть и [инструкция по сборке из исходников](https://wiki.multitheftauto.com/wiki/RU/Building_MTASA_Server_on_GNU_Linux#%D0%9F%D0%BE%D0%B8%D1%81%D0%BA_%D0%B8_%D1%83%D1%81%D1%82%D1%80%D0%B0%D0%BD%D0%B5%D0%BD%D0%B8%D0%B5_%D0%BD%D0%B5%D0%B8%D1%81%D0%BF%D1%80%D0%B0%D0%B2%D0%BD%D0%BE%D1%81%D1%82%D0%B5%D0%B9).

---

## **Возможные ошибки и их решение**
При возникновении проблем с запуском первым делом смотрим лог *server_log.txt*, большинство ошибок там пишет прямым текстом. Если в логе не найдено полезной информации то проверяем *[server.cfg](https://open.mp/docs/server/server.cfg)*, особое внимание уделяем строкам *plugins, gamemode0, filterscripts*. Имеет смысл попробовать поочередно отключать дополнительные плагины и скрипты. Не забываем проверять очередность загрузки плагинов, например плагин [crashdetect](https://github.com/Zeex/samp-plugin-crashdetect/releases) всегда должен быть первым.

> Установите плагин [crashdetect](https://github.com/Zeex/samp-plugin-crashdetect/releases) он поможет определить источник проблемы. Плагин предоставит дополнительную информацию, такую ​​как номера строк, имена функций, значения параметров и.т.д. Важно: Сценарий должен быть скомпилирован в режиме отладки ([флаг](https://github.com/pawn-lang/compiler/wiki/Options) -d3), чтобы компилятор помещал дополнительную информацию обо всем этом в выходной файл .amx.

-  **I couldn't load any gamemode scripts. Please verify your server.cfg** мод отображается как "Unknown", значит сервер его не видит. Необходимо проверить путь к моду в [server.cfg](https://open.mp/docs/server/server.cfg). В названии мода не должно быть специальных символов и пробелов, а так же кириллических символов.  
-  **No such file or directory** на сервере с linux следует загрузить дополнительные библиотеки:
```sudo apt-get install ia32-libs```
- На linux проверьте чтобы плагины были указаны в [server.cfg](https://open.mp/docs/server/server.cfg) с расширением .so. Например: *plugins streamer.so sscanf.so* 
- **Runtime Error File or function is not found** в скомпилированном amx моде используется функция которой нет на вашем сервере. Проверяем соответствие версии сервера и мода, а также наличия всех необходимых плагинов.
- **Run time error 17: "Invalid/unsupported P-code file format** неверная кодировка в amx файле. 
- Игроки постоянно получают ошибку **"Unacceptable NickName"** но она не верна т.к. никнейм верный.  
Если вы уверены, что используете верный никнейм и сервер работает в Windows, попробуйте изменить параметр совместимости samp-server.exe на Windows 98, и это должно быть исправлено после перезапуска сервера.
Серверы Windows с высоким временем работы также могут вызывать эту проблему. Это было замечено примерно за 50 дней работы сервера. Чтобы решить эту проблему, требуется перезагрузка. [Источник](https://open.mp/docs/server/CommonServerIssues)
- **version GLIBCXX_3.4.15 not found** Обновите вашу систему. Если это все еще не сработало, вам необходимо обновить дистрибутив Linux до версии, которая предоставляет компилятор gcc 4.8 (или выше). Например, если вы используете CentOS 6, в которой есть только gcc 4.4, вам необходимо перейти на CentOS 7.
- **Failed (libmysqlclient_r.so.18: cannot open shared object file: No such file or directory)**  У вас не установлена ​​клиентская библиотека MySQL. Установите его через менеджер пакетов. Убедитесь, что вы установили 32-битную (i386, i686 и т. д.) библиотеку, иначе плагин не запустится.
- **Failed (plugins/mysql.so: symbol __cxa_pure_virtual, version libmysqlclient_18[...]** Вероятно, это означает, что вы используете 64-битную систему и, следовательно, 64-битную библиотеку libmysqlclient. Вам придется либо установить 32-битную версию клиентского пакета MySQL, либо использовать статически связанную версию подключаемого модуля, расширение mysql_static.so.
- **(error #1045) Access denied for user 'root'@'localhost' (using password: YES)** Необходимо сбросить пароль root по [инструкции](https://stackoverflow.com/questions/17975120/access-denied-for-user-rootlocalhost-using-password-yes-no-privileges), помните что не рекомендуется работать под root с бд. [Подробнее](https://dev.mysql.com/doc/refman/5.7/en/problems-connecting.html)
- **Streamer Plugin: Obsolete or invalid native "Streamer_xxx" found (script might need to be recompiled with the latest include file)** Необходимо пересобрать мод с соответствующей версией инклуда от [плагина streamer](https://github.com/samp-incognito/samp-streamer-plugin/releases).
- **[sampgdk:warning] Index mismatch for OnIncomingConnection** ошибка появляется из-за несовместимости плагинов. если при отключенной базе данных продолжают сыпаться обновите [плагин streamer](https://github.com/samp-incognito/samp-streamer-plugin/releases). Если появляются при запросе к БД необходимо разбираться с MySQL, возможно потребуется обновить.
- **MSVCR_xx.dll  MSVCP_xx.dll not found.** Эта проблема регулярно возникает на серверах Windows при попытке загрузить подключаемый модуль, который был разработан с использованием более поздней версии среды Runtime Visual C ++, чем в настоящее время установлена ​​на вашем компьютере. Чтобы исправить это, загрузите соответствующие библиотеки Runtime Microsoft Visual C ++. Обратите внимание, что сервер SA-MP 32-разрядный, поэтому вам также необходимо загрузить 32-разрядную (x86) версию среды выполнения, независимо от архитектуры. Версия среды выполнения, которая вам нужна, обозначается цифрами в имени файла (см. Таблицу ниже), хотя установка всех из них не повредит. Эти библиотеки не складываются, или, другими словами: вы не получите время выполнения для версии 2013 года и более ранних версий, если установите только версию 2015 года.

| Номер версии	| Runtime |
|---------------|------------------|
|10.0	| Microsoft Visual C++ 2010 x86 Redistributable |
|11.0	| Microsoft Visual C++ 2012 x86 Redistributable |
|12.0	| Microsoft Visual C++ 2013 x86 Redistributable |
|14.0	| Microsoft Visual C++ 2015 x86 Redistributable |

Если плагин по-прежнему не загружается после установки всех VC Redist cкачайте универсальный [CRT](https://www.microsoft.com/en-US/download/details.aspx?id%3D48234) для Windows.    
Windows 8.1 и Windows Server 2012 R2: [KB2919355](https://support.microsoft.com/en-us/kb/2919355)  
Windows 7 и Windows Server 2008 R2: [пакет обновления 1](https://support.microsoft.com/en-us/kb/976932)  
Windows Vista и Windows Server 2008: [пакет обновления 2](https://support.microsoft.com/en-us/kb/948465)  

### **Автоматизация**

Из-за ограниченных опций защиты от сбоев, доступных на сервере SA-MP, существует большая вероятность получения ошибок сегментации или любой другой ошибки, генерируемой вашим модом (Pawn). Это выключит сервер, и вам придется запустить его снова самостоятельно. [Подробнее](https://sampwiki.blast.hk/wiki/Linux_Server).  

Этот скрипт проверит, запущен ли процесс _samp03svr_, и если нет, запустит его снова. Сохранение журнала сервера будет в отдельном каталоге при сбое сервера.  

Сначала вам нужно остановить сервер, а затем выполнить его с помощью этой команды:
```
nohup ./restart.sh &
```
**restart.sh:**
```
#!/bin/sh
log=samp.log
dat=`date`
samp="/path/to/samp/server/samp03svr"
cd /path/to/samp/server
 
echo "${dat} watchdog script starting." >>${log}
while true; do
        echo "${dat} Server exited, restarting..." >>${log}
        mv /path/to/samp/server/server_log.txt /path/to/samp/server/logs/server_log.`date '+%m%d%y%H%M%S'`
        ${samp} >> $log
	sleep 2
done
```

#### Для хостинга Windows

BAT скрипт для запуска процесса с отслеживанием его работы.  
Скрипт автоматически перезапустит samp-сервера при падении.  
```shell
@echo off
echo Starting process...
echo.
Set Process="samp-server.exe"
:begin
title Process %Process% control
tasklist | findstr %Process%
if errorlevel 1 goto NoProcess
echo Result: Process run
goto Done
:NoProcess
%Process%
echo Result: Process %Process% stop %time%
:Done
echo.
goto begin
pause
exit
```

BAT скрипт для перезапуска сервера с автоочисткой лога (Удобно для тестовых запусков на локалхосте).  
_Замените путь **c:\www\samp-server** на свой!_
```shell
@echo off
setlocal
taskkill /F /IM samp-server*
timeout /t 3
cd "c:\www\samp-server"
del /s %CD%\server_log.txt
call "samp-server.exe"
exit /b
```

### **Защита сервера**

Настройка iptables на хостинге с linux

```
# create a new chain
iptables -N SAMPQUERY

# check that incomming packet is a samp query packet and divert to the new chain
# this inserts the rule as the first in the chain, but should probably be a bit further down (e.g. after checking lo interface)
iptables -I INPUT -p udp \! -f -m udp --dport 7777 -m conntrack --ctstate NEW,ESTABLISHED -m u32 --u32 "0x0>>0x16&0x3c@0x8=0x53414d50" -j SAMPQUERY

# only allow connection from ephemeral source ports
# connection attempts from ports outside this range are likely rogue clients
iptables -A SAMPQUERY -p udp --sport 49152:65535 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT
iptables -A SAMPQUERY -j REJECT --reject-with icmp-port-unreachable
```
Посмотрите также:
[Готовый набор правил для SA:MP сервера на Git](https://github.com/Edresson/SAMP-Firewall/blob/master/Firewall.sh)  

> Для Windows хостинга рекомендуется установить [нормальный firewall](https://remontka.pro/free-firewall-utilities-windows) т.к. настроить на стандартном будет проблематично

Некоторые хостинги предлагают набор различных решений по предотвращению DDoS-атак, к примеру плагин [Antiattack](http://wiki.myarena.ru/index.php/%D0%98%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D1%8F_%D0%BF%D0%BE_%D1%83%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BA%D0%B5_%D0%BC%D0%BE%D0%B4%D1%83%D0%BB%D1%8F_Antiattack_%D0%BF%D1%80%D0%BE%D1%82%D0%B8%D0%B2_%D1%81%D0%BE%D0%B2%D1%80%D0%B5%D0%BC%D0%B5%D0%BD%D0%BD%D1%8B%D1%85_%D0%B0%D1%82%D0%B0%D0%BA_%D0%BD%D0%B0_%D1%81%D0%B5%D1%80%D0%B2%D0%B5%D1%80_samp)

#### Античит

Для защиты от читеров используются такие системы как [NEXAC](https://github.com/NexiusTailer/Nex-AC), SAMPCAC, [SAMPAC2](https://whitetigerswt.github.io/SAMP_AC_v2/).
_NEXAC_ это комплексная серверная защита, сочетающая в себе мощный античит и защиту от различных типов атак. Античит обнаруживает популярные читы, мгновенно наказывая читеров и содержит множество инструментов защиты от взлома, сбоев и.т.д. Античиты _SAMPCAC, SAMPAC2_ клиент-серверные, и требуют установки клиентской части на чистую GTA:SA с клиентом SAMP 0.3.7 R1. Из преимуществ таких античитов можно выделить сканирование памяти игры, управление glitches (cbug, fastmove, quickstand), проверка модификации ресурсов (DFF, TXD, ANIM), обнаружение некоторых видов читов. Увы все эти решения устарели и на крупных проектах используются свои решения ввиде лаунчеров и подгружаемых дополнений, например [SAMP Addon](https://www.sa-mp.ru/sampaddon).  

Посмотрите так же: [MTA Anti-cheat guide](https://wiki.multitheftauto.com/wiki/Anti-cheat_guide)  

### **Настройка базы данных**

Давайте для начала разберем, что собой являет база данных. База данных — это полноценная система, которая создана для обработки и хранения на ней массивов информации при помощи языка Structured Query Language. Для начало нам нужен [MySQL сервер](https://dev.mysql.com/downloads/mysql/) и удобный веб-интерфейс для работы с базами [PhpMyAdmin](https://php-myadmin.ru/). Существуют готовые наборы такие как [Denwer](http://www.denwer.ru/), [OpenServer](http://open-server.ru/), [Winginx](https://winginx.com/ru/), [Uwamp](http://www.uwamp.com/en/) либо можно установить и настроить компоненты в отдельности. Инструкции по установке и развертыванию данных систем есть на их официальных сайтах. 

На установленный samp-server нам нужно будет установить [MySQL плагин](https://github.com/pBlueG/SA-MP-MySQL/wiki).
Плагин нужно внимательно подбирать учитывая текущую кодовую базу с которой вы работаете.  

Широко распостранены 3 версии данного плагина:  
- R5 (Реализации до r33, версия MySQL - 5.0)  
- R6 (Реализации r33 - r39-6, версия MySQL - 5.1)  
- R7 (Реализации r40 - r41-4, версия MySQL - 5.5)  

Многие сервера SA-MP продолжают использовать устаревшие версии плагина. Это происходит потому, что для перехода на новые требуются правки в мод, так как некоторые функции и их аргументы были изменены, а какие-то и вовсе удалены.
Теперь первое, что мы должны сделать, чтобы иметь возможность использовать MySQL — это подключиться к базе данных MySQL. Если вы еще не создали базу данных, можете [создать через PhpMyAdmin](https://sites.google.com/site/razrabotkaizasitabazdannyh/sozdanie-bazy-dannyh-v-phpmyadmin).  

Пример подключения к базе из мода.
```C
#include <a_samp>
#include <a_mysql>

new connect;

#define db_host			"localhost"
#define db_username		"root"
#define db_password		"root"
#define db_name 		"basename"

public OnGameModeInit()
{
    // mysql_debug(1); //debug on
    connect = mysql_connect(db_host, db_username, db_password, db_name); //conecting to db
}

```

> Важно! Через PhpMyAdmin можно отслеживать этапы обработки запросов. При ошибках в запросах читаем mysql_log.txt в директории с сервером и исправляем ошибки.

[Пример настройки VDS/VPS сервера для работы с MySQL] (https://pawno-info.ru/threads/kak-nastroit-vds-vps-server-dlja-raboty-s-mysql.327432/).

#### Использование SQLite

[SQLite](https://www.sqlite.org/index.html) - легкая (не требующая больших ресурсов) встраиваемая система управления базами данных. Для использования SQLite не требуются дополнительные плагины, система встроенная в сервер SA:MP. Эта функция SA:MP была представлена ​​в версии 0.2.2 . Файлы базы данных файлов SQLite обычно хранятся в файлах .db и доступны в каталоге серверов \scriptfiles\. Открыть базу можно через [DB Browser for SQLite](https://sqlitebrowser.org/). Версия SQLite — 3.7.0.1. SQLite в настоящее время [имеет 18 нативных функций](https://team.sa-mp.com/wiki/Category_SQLite.html). Эти функции представили теги DB и DBResult в SA:MP. 
Обычно используется совместно с библиотекой [sqlitei (SQLite-Improved)](https://github.com/oscar-broman/sqlitei).
Касательно скорости операций есть [тесты скорости](https://sqlite.org/speed.html). 

Пример подключения к БД:
```C
new DB:db_handle;

public OnGameModeInit()
{
	if((db_handle = db_open("example.db")) == DB:0)
	{
		print("Failed to open a connection to \"example.db\".");
		SendRconCommand("exit");
	} else {
		print("Successfully created a connection to \"example.db\".");
	}
	return 1;
}
 
public OnGameModeExit()
{
	db_close(db_handle);
	return 1;
}
```

Включить логирование ошибок можно в [server.cfg](https://open.mp/docs/server/server.cfg):
```CFG
db_logging      1  Логирование ошибок sqlite db_* функций в основной server_log.  
db_log_queries  1  Логирование всех sqlite db_query() вызовов, включая строку запроса.

```
_Эти переменные были добавлены в 0.3.7 R2 и не будут иметь никакого эффекта в предыдущих версиях._  

Полезное:  
- [Convert SQLite to MySQL Online](https://www.rebasedata.com/convert-sqlite-to-mysql-online)  
- [[Tutorial] Работа с базой данных SQLite](https://pawn.ucoz.ru/forum/4-48-1)  

---

Смотри также:

- [Возможные проблемы и их решение](https://bitbucket.org/1nsanemapping/mappingwiki/wiki/Bugs)
- [Open.mp CommonServerIssues](https://open.mp/docs/server/CommonServerIssues)  
- [Open.mp RCON commands](https://open.mp/docs/server/ControllingServer)  
- [Port Forwarding](https://sampwiki.blast.hk/wiki/Port_Forwarding)
- [Работаем с MySQL через командную строку (Windows)](https://drive.google.com/drive/folders/1lcpwx0405Kmtm468Bj-rG-gVybwRLt5Z)  
- [MySQL Plugin for SAMP wiki](https://github.com/pBlueG/SA-MP-MySQL/wiki)
- [Troubleshooting Problems Connecting to MySQL](https://dev.mysql.com/doc/refman/5.7/en/problems-connecting.html)
- [Инсталляция и первый запуск MySQL](http://www.mysql.ru/docs/instadm.html)
- [PhpMyAdmin FAQ](https://docs.phpmyadmin.net/en/latest/faq.html)
- [MTA Руководство по серверу](https://wiki.pawno-info.ru/MTA/Server_Manual)  
- [Проверка, восстановление и оптимизация баз MySQL](https://www.oslogic.ru/knowledge/784/proverka-vosstanovlenie-i-optimizatsiya-baz-mysql/)  
- [Установка MySQL на Ubuntu 20](https://ruvds.com/ru/helpcenter/kak-ustanovit-mysql-na-ubuntu-20-04/)  
- [SAMP ChangeLog](https://wiki.pawno-info.ru/SAMP/ChangeLog)  

---