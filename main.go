package main

import (
	"fmt"
	"log"
	"net/http"
)

func main () {
	http.HandleFunc("/", homeHandler)

	fmt.Println("Starting web server on http://localhost:8080...")
	log.Println("Web server started on http://localhost:8080")

	err := http.ListenAndServe(":8080", logRequest(http.DefaultServeMux))
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
	}
}

func homeHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Welcome to PlutoPilot Web Server!")
}

func logRequest(handler http.Handler) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		log.Printf("Received request: %s %s", r.Method, r.URL.Path)
		handler.ServeHTTP(w, r)
	}
}
