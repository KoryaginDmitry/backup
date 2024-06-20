function delivery() {
    rclone copy archives/ "$1":"$BACKUP_DIR"/"$(date +"%Y_%m_%d")"/
}