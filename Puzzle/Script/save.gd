extends Node

const file_name = 'user://pupungeggang6_puzzle.txt'
const empty_save = {}
var save
    
func load_data():
    var file = FileAccess.open(file_name, FileAccess.READ)
    
    if !file:
        file = FileAccess.open(file_name, FileAccess.WRITE)
        file.store_string(str(empty_save))
        file.close()
        
    file = FileAccess.open(file_name, FileAccess.READ)
    save = JSON.parse_string(file.get_as_text())
    file.close()

func save_data():
    var file = FileAccess.open(file_name, FileAccess.WRITE)
    file.store_string(str(save))
    file.close()

func erase_data():
    var file = FileAccess.open(file_name, FileAccess.WRITE)
    file.store_string(str(empty_save))
    file.close()

    file = FileAccess.open(file_name, FileAccess.READ)
    save = JSON.parse_string(file.get_as_text())
    file.close()
