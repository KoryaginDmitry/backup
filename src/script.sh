#!/bin/bash

# Подключение функций хелперов
source helpers/checks.sh
source helpers/data_collector.sh
source helpers/archiver.sh
source helpers/cleaner.sh
source helpers/transmitter.sh
source helpers/logger.sh
source helpers/errors.sh

# Проверка корректности ключа переданного в функцию
checkArgument "$1"

setLogDir "$1"

log_info 'Начинаю формировать бекап' 1

# Подключение файлов конфигурации
source ../config/"$1"/db.config
source ../config/"$1"/storage.config

# Проверка переменных конфигурации
checkDBConf
checkStorageConf

# Формируем данные для архивации
db_collect
storage_collect

# Проверка собранных данных
checkDBFile
checkStorageFiles

# Создание архивов
#makeFilesArchives
#makeDBArchives

# Очистка временных файлов
#dropTmpFiles

# Записываем текщую дату в переменную
#DATE=$(date +"%Y_%m_%d")

# Доставка архивов на яндекс диск
#delivery $DATE

# Удаление старых архивов с яндекс диска
#rmOldData $DATE

log_info 'Завершил создание бекапа'

exit 0