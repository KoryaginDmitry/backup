# Удаление временных файлов
function dropTmpFiles() {
    rm -rf temporary_files/

    log_info "Временные файлы удалены"
}

# Удаление архивов
function dropArchives() {
    rm -rf archives/

    log_info "Архивы удалены"
}

# Удаление старых бэкапов
function rmOldData() {
    COUNT=$(rclone lsf "$1":"$BACKUP_DIR"/"$2"/ | wc -l)
    JSON=$(rclone lsjson "$1":"$BACKUP_DIR"/"$2"/)

    if echo "$JSON" | jq --exit-status '.[] | select(.Path == "'"$2"'")' > /dev/null ; then
      HAS_FILE=1
      FILE_SIZE_JSON=$(rclone size --json "$1":"$BACKUP_DIR"/"$2"/)
      SIZE=$(echo "$FILE_SIZE_JSON" | jq '.bytes')
    else
      HAS_FILE=0
      SIZE=0
    fi

    if [[ "$COUNT" -gt 2 && "$HAS_FILE" == 1 && "$SIZE" -gt 0 ]]; then
      log_info "Удаляю старые бекапы"

      rclone delete "$1":"$BACKUP_DIR"/"$2" --min-age "$BACKUP_LIFE"d
      rclone rmdirs "$1":"$BACKUP_DIR"/"$2"/
    fi
}