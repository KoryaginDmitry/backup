# Инструкция к скрипту

1. Установка зависимостей.
    ```shell
      sudo apt install rclone p7zip-rar p7zip-full
    ```
2. Настройка rclone.
   ```shell
      rclone config
   ```
   Подробная настройка https://rclone.org/yandex/

3. Конфигурация.
   Проект содержит 3 файла конфигурации:
    - backup.config (Указывается путь для хранения бекапов и время жизни бекапа),
    - db.config (Данные для подключения к контейнеру с Mysql)
    - storage.config (Данные для получения файлов).

   Можно создать множество конфигураций для разных проектов. Главное, чтобы все конфигурации находились в каталоге
   config, в этом каталоге должны быть созданы дочерние каталоги, которые имеют названия ваших конфигураций rclone.
   
   Пример конфигурации можно посмотреть в config/example

4. После установки зависимостей, настройки rcone и конфигурации можно запускать скрипт. 
   
   Скрпит должен быть запущен из корня программы. Во время вызова скрипта нужно передать название вашей конфигурации rclone
   ```shell
      ./src/script.sh your_rclone_config_name
   ```