#!/bin/bash

# Подключение функций хелперов
source src/helpers/checks.sh
source src/helpers/data_collector.sh
source src/helpers/archiver.sh
source src/helpers/cleaner.sh
source src/helpers/transmitter.sh
source src/helpers/logger.sh
source src/helpers/errors.sh

# Проверка корректности ключа переданного в функцию
checkArgument "$1"

setLogDir "$1"

log_info 'Начинаю формировать бекап' 1

# Подключение файлов конфигурации
source config/"$1"/db.config
source config/"$1"/storage.config
source config/"$1"/backup.config

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
makeFilesArchives
makeDBArchives

# Проверка архивов
checkArchives

# Очистка временных файлов
dropTmpFiles

# Записываем текщую дату в переменную
DATE=$(date +"%Y_%m_%d")

# Доставка архивов на яндекс диск
delivery "$1" "$DATE"

# Проверка доставки
checkDelivery "$1" "$DATE"

# Удаление архивов
dropArchives

# Удаление старых архивов с яндекс диска
rmOldData "$1" "$DATE"

log_info 'Завершил создание бекапа'

exit 0