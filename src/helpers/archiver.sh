function makeFilesArchives() {
    7z a -v100m arch.7z temporary_files/app
}

function makeDBArchives() {
    7z a -v100m arch_db.7z temporary_files/DB
}