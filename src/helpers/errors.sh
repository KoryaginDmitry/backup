# Логирует ошибку и завершает скрипт с кодом 1
function error() {
    log_error "$1"
    exit 1
}