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

type Contact struct {
	Phone string `json:"phone"`
	Email string `json:"email"`
}

type Location struct {
	Latitude  float64 `json:"latitude"`
	Longitude float64 `json:"longitude"`
}

type Cinema struct {
	Name          string   `json:"name"`
	Address       string   `json:"address"`
	Contact       Contact  `json:"contact"`
	Schedule_Link string   `json:"schedule_link"`
	Imax          bool     `json:"imax_technology"`
	Location      Location `json:"location"`
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
	defer results.Close()

	for results.Next() {
		var phone, email string
		var latitude, longitude float64
		var imax int // tinyint is read into an int in Go

		err := results.Scan(&cinema.Name, &cinema.Address, &phone, &email, &cinema.Schedule_Link, &imax, &latitude, &longitude)
		if err != nil {
			panic(err)
		}

		cinema.Contact = Contact{Phone: phone, Email: email}
		cinema.Imax = imax == 1
		cinema.Location = Location{Latitude: latitude, Longitude: longitude}

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

	server.HandleFunc("/cinemas/helios", func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("GET /cinemas/helios")
		var cinemas []Cinema
		cinemas = getCinemas("helios")
		encoding, err := json.Marshal(cinemas)
		if err != nil {
			fmt.Println(err)
		}
		w.Header().Set("Content-Type", "application/json")
		w.Write(encoding)
	})

	server.HandleFunc("/cinemas/multikino", func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("GET /cinemas/multikino")
		var cinemas []Cinema
		cinemas = getCinemas("multikino")
		encoding, err := json.Marshal(cinemas)
		if err != nil {
			fmt.Println(err)
		}
		w.Header().Set("Content-Type", "application/json")
		w.Write(encoding)
	})

	server.HandleFunc("/cinemas/cinemacity", func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("GET /cinemas/cinemacity")
		var cinemas []Cinema
		cinemas = getCinemas("cinema_city")
		encoding, err := json.Marshal(cinemas)
		if err != nil {
			fmt.Println(err)
		}
		w.Header().Set("Content-Type", "application/json")
		w.Write(encoding)
	})

	server.HandleFunc("/cinemas", func(w http.ResponseWriter, r *http.Request) {
		keys := []string{"helios", "multikino", "cinema_city"}

		allCinemas := make(map[string][]Cinema)
		for i := 0; i < len(keys); i++ {
			cinemas := getCinemas(keys[i])
			allCinemas[keys[i]] = cinemas
		}

		jsonData, err := json.MarshalIndent(allCinemas, "", "    ")
		if err != nil {
			panic(err)
		}
		w.Header().Set("Content-Type", "application/json")
		w.Write(jsonData)
	})

	server.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		var index string = "./index.html"
		http.ServeFile(w, r, index)
	})

	http.ListenAndServe(":8080", server)
}
