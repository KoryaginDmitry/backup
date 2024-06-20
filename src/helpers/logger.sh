# Устанавливает каталог для записи лока
function setLogDir() {
  LOG_DIR=$1
}

# Формирует текст лога
function makeMessage() {
  echo "[$(date)] $1"
}

# Создает каталог для хранения логов
function makeDir() {
  if [ ! -d logs/"$LOG_DIR"/ ]; then
    mkdir -p logs/"$LOG_DIR"/
  fi
}

# Запись информационного лога
function log_info() {
  makeDir

  if [[ "$#" == 2 && "$2" == 1 ]]; then
    echo '' >> logs/"$LOG_DIR"/logs.log
  fi

  makeMessage "$1" >> logs/"$LOG_DIR"/logs.log
}

# Запись логов с ошибками
function log_error() {
  if [ -n "$LOG_DIR" ]; then
    makeDir
    makeMessage "$1" >> logs/"$LOG_DIR"/logs.log
    makeMessage "Завершил выполнение скрипта с ошибкой" >> logs/"$LOG_DIR"/logs.log
  else
    makeMessage "$1" >> logs/logs.log;
  fi
}
