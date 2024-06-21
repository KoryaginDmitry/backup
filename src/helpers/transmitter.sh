# Доставка архивов на удаленное хранилище
function delivery() {
    rclone copy --no-check-dest archives/ "$1":"$BACKUP_DIR"/"$2"/
}