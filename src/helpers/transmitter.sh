function delivery() {
    find . -type f -name "arch*" | while read -r file
    do
      rclone copy "$file" yandex:bee_online/"$(date +"%Y_%m_%d")"
    done
}