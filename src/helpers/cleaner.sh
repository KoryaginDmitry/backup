function dropTmpFiles() {
    rm -rf temporary_files/

    log_info "Временные файлы удалены"
}

function dropArchives() {
    rm arch*
}

function rmOldData() {
    COUNT=$(rclone lsf yandex:bee_online | wc -l)
    JSON=$(rclone lsjson yandex:bee_online)

    if echo "$JSON" | jq --exit-status '.[] | select(.Path == "'"$DATE"'")' > /dev/null ; then
      FILE_SIZE_JSON=$(rclone size --json yandex:bee_online/"$DATE")
      SIZE=$(echo "$FILE_SIZE_JSON" | jq '.bytes')
    else
      SIZE=0
    fi

    if [[ "$COUNT" -gt 2 && "$HAS_FILE" == 1 && "$SIZE" -gt 0 ]]; then
      rclone delete yandex:bee_online --min-age 15d
      rclone rmdirs yandex:bee_online/
    fi
}