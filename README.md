1. Установка зависимостей
    ```shell
      sudo apt install rclone p7zip-rar p7zip-full
    ```
2. Настройка rclone 
   ```shell
      rclone config
   ```
   Подробная настройка https://rclone.org/yandex/

3. Конфигурация config.cnf
   (Если используется minio, то небоходимо заранее подготовить консольного пользователя)
   docker exec -i bee-bt-minio-1 mc alias set bee_bt http://127.0.0.1:9000 sail password
4. Конфигурация .config