package main

import (
	"fmt"
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

		client := parser.Parse(r.UserAgent())

		fmt.Fprintf(w, fmt.Sprintf("%+v", client.Device))
		fmt.Fprintf(w, fmt.Sprintf("%+v", client.Os))
		fmt.Fprintf(w, fmt.Sprintf("%+v", client.UserAgent))
	})

	log.Fatal(http.ListenAndServe(":8080", nil))
}
