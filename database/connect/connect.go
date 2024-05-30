package connect

import (
	"database/sql"
)

var DB *sql.DB

func Connect() {
	// root:@tcp(localhost:3307)/gofilemanager?charset=utf8&parseTime=True&loc=Local
	// 172.17.0.1 - docker host
	db, err := sql.Open("mysql", "root:root@tcp(db:3306)/kina")
	if err != nil {
		panic("failed to connect database")
	}
	DB = db
}
