# Создает архив дампа БД
function makeFilesArchives() {
    7z a -v100m archives/arch.7z temporary_files/Files > /dev/null 2>&1
}

# Создает архивы файлов
function makeDBArchives() {
    7z a -v100m archives/arch_db.7z temporary_files/DB > /dev/null 2>&1
}