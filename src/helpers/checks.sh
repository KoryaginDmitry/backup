function checkArgument() {
    if [ -z "$1" ]; then
        error "Не передан ключ конфигурации"
    fi

    if [ ! -f ../config/"$1"/db.config ]; then
      error "Не найден файл ../config/$1/db.config"
    fi

    if [ ! -f ../config/"$1"/storage.config ]; then
      error "Не найден файл ../config/$1/storage.config"
    fi
}

function checkDBConf() {
  if [[ -z "$CONTAINER_NAME" || -z "$DB_DATABASE" || -z "$DB_USERNAME" || -z "$DB_PASSWORD" ]]; then
    error "Проверь файл конфигурации DB"
  fi
}

function checkStorageConf() {
  if [ -z "$STORAGE_TYPE" ]; then
      error "Проверь файл конфигурации хранилища"
  fi

  if [[ "$STORAGE_TYPE" == 'FILE' && -z "$STORAGE_PATH" ]]; then
    error "Некорректная конфигурация для драйвера FILE"
  fi

  if [ "$STORAGE_TYPE" == 'MINIO' ]; then
    if [[ -z "$STORAGE_AWS_BUCKET" || -z "$STORAGE_CONTAINER_NAME" ]]; then
      error "Некорректная конфигурация для драйвера MINIO"
    fi
  fi
}

function checkDBFile() {
  if [[ ! -f ../temporary_files/DB/dump.sql || $(stat -c %s ../temporary_files/DB/dump.sql) -lt 100 ]] ; then
    error "Не удалось сделать дамп БД"
  fi

  log_info "Дамп БД прошел успешно. Размер файла до архивации - $(stat -c %s ../temporary_files/DB/dump.sql)байт"
}

function checkStorageFiles() {
    if [[ ! -d ../temporary_files/Files/ || $(stat -c %s ../temporary_files/Files/) -lt 100 ]] ; then
      error "Не удалось собрать файлы для архивации"
    fi

    log_info "Сбор файлов прошел успешно. Размер файлой до архивации - $(stat -c %s ../temporary_files/Files/)байт"
}