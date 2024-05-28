package main

import (
	"database/sql"
	"fmt"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
)

var db *sql.DB

func main() {
	// connect to the database
	fmt.Println("Hello, World!")

	db, err := sql.Open("mysql", "username:password@tcp(127.0.0.1:3306)/test")
	defer db.Close()
	if err != nil {
		panic(err.Error())
	}

	// start the web server
	server := http.NewServeMux()
	server.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		var index string = "./index.html"
		http.ServeFile(w, r, index)
	})

	http.ListenAndServe(":8080", server)
}
