function makeFilesArchives() {
    7z a -v100m archives/arch.7z temporary_files/app > /dev/null 2>&1
}

function makeDBArchives() {
    7z a -v100m archives/arch_db.7z temporary_files/DB > /dev/null 2>&1
}