package main

// to-do
// 3. create a function to marshal the struct into json
// 4. create a handler to return the json data

// 1. get the data from the database - done
// 2. create a struct to hold the database data - done

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/deliskyxd/CinemaMap/connect"
	_ "github.com/go-sql-driver/mysql"
)

type Cinema struct {
	Name            string  `json:"name"`
	Address         string  `json:"address"`
	Phone           string  `json:"phone"`
	Email           string  `json:"email"`
	Schedule_Link   string  `json:"schedule_link"`
	Imax_Technology bool    `json:"imax_technology"`
	Latitude        float64 `json:"latitude"`
	Longitude       float64 `json:"longitude"`
}

//func marshal(cinema Cinema) ([]byte, error) {
//	return json.Marshal(cinema)
//}

func getCinemas(name string) []Cinema {
	cinemas := []Cinema{}
	cinema := Cinema{}
	// query the database
	var query string = "SELECT * FROM kina." + name

	results, err := connect.DB.Query(query)
	if err != nil {
		panic(err.Error())
	}
	for results.Next() {
		// for each row, scan the result into our tag composite object
		err = results.Scan(&cinema.Name, &cinema.Address, &cinema.Phone, &cinema.Email, &cinema.Schedule_Link, &cinema.Imax_Technology, &cinema.Latitude, &cinema.Longitude)
		if err != nil {
			panic(err.Error()) // proper error handling instead of panic in your app
		}
		cinemas = append(cinemas, cinema)

	}
	// return the cinema
	return cinemas
}

func main() {
	// connect to the database
	fmt.Println("Hello, World!")
	connect.Connect()
	defer connect.DB.Close()

	// start the web server
	server := http.NewServeMux()

	// get all cinemas
	server.HandleFunc("/cinemas/helios", func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("GET /cinemas/helios")
		var cinemas []Cinema
		cinemas = getCinemas("helios")
		encoding, err := json.Marshal(cinemas)
		if err != nil {
			fmt.Println(err)
		}
		fmt.Fprintf(w, string(encoding))
	})

	// get a cinema by name
	server.HandleFunc("/cinemas/multikino", func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("GET /cinemas/multikino")
		var cinemas []Cinema
		cinemas = getCinemas("multikino")
		encoding, err := json.Marshal(cinemas)
		if err != nil {
			fmt.Println(err)
		}
		fmt.Fprintf(w, string(encoding))
	})

	server.HandleFunc("/cinemas/cinemacity", func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("GET /cinemas/cinemacity")
		var cinemas []Cinema
		cinemas = getCinemas("cinema_city")
		encoding, err := json.Marshal(cinemas)
		if err != nil {
			fmt.Println(err)
		}
		fmt.Fprintf(w, string(encoding))
	})

	server.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		var index string = "./index.html"
		http.ServeFile(w, r, index)
	})

	http.ListenAndServe(":8080", server)
}
