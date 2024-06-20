function db_collect() {
  mkdir -p ../temporary_files/DB
  docker exec -it "$CONTAINER_NAME" mysqldump -u "$DB_USERNAME" --password="$DB_PASSWORD" "$DB_DATABASE" > ../temporary_files/DB/dump.sql
}

function storage_collect() {
  if [ "$STORAGE_TYPE" == 'FILE' ]; then
        files``
      else
        minio
  fi
}

function files() {
  cp -r "$STORAGE_PATH" ../temporary_files/Files/
}

function minio() {
    docker cp "$STORAGE_CONTAINER_NAME":/data/minio/"$STORAGE_AWS_BUCKET"/. ../temporary_files/Files
}