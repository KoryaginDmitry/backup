function setLogDir() {
  LOG_DIR=$1
}

function makeMessage() {
  echo "[$(date)] $1"
}

function makeDir() {
  if [ ! -d logs/"$LOG_DIR"/ ]; then
    mkdir -p logs/"$LOG_DIR"/
  fi
}

function log_info() {
  makeDir

  if [[ "$#" == 2 && "$2" == 1 ]]; then
    echo '' >> logs/"$LOG_DIR"/logs.log
  fi

  makeMessage "$1" >> logs/"$LOG_DIR"/logs.log
}

function log_error() {
  if [ -n "$LOG_DIR" ]; then
    makeDir
    makeMessage "$1" >> logs/"$LOG_DIR"/logs.log
    makeMessage "Завершил выполнение скрипта с ошибкой" >> logs/"$LOG_DIR"/logs.log
  else
    makeMessage "$1" >> logs/logs.log;
  fi
}
