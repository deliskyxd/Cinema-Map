package connect

import "database/sql"

var DB *sql.DB

func Connect() {
	db, err := sql.Open("mysql", "root:root@tcp(127.0.0.1:3306)/kina")
	if err != nil {
		panic("failed to connect database")
	}
	DB = db
}
