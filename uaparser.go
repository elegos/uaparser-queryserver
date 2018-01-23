package main

import (
	"encoding/json"
	"log"
	"net/http"

	"github.com/ua-parser/uap-go/uaparser"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		parser, err := uaparser.New("./regexes.yaml")
		if err != nil {
			log.Fatal(err)
		}

		query := r.URL.Query()

		ua, ok := query["q"]
		if !ok {
			json.NewEncoder(w).Encode(struct {
				Error string
			}{"To parse a UserAgent, use the 'q' query parameter"})

			return
		}

		client := parser.Parse(ua[0])

		json.NewEncoder(w).Encode(client)
	})

	log.Fatal(http.ListenAndServe(":8080", nil))
}
