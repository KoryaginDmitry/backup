# Доставка архивов на удаленное хранилище
function delivery() {
    rclone copy archives/ "$1":"$BACKUP_DIR"/"$2"/
}