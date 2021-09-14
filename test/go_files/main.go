package main

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func initializeRouter() {
	r := mux.NewRouter()

	r.HandleFunc("/api/book/page={page}&size={size}", GetBooks).Methods("GET")
	r.HandleFunc("/api/book/{id}", GetBook).Methods("GET")
	r.HandleFunc("/api/book/{id}/{item}", GetItem).Methods("GET")
	r.HandleFunc("/api/book", CreateBook).Methods("POST")
	log.Fatal(http.ListenAndServe(":8080", r))
}

func main() {
	InitialMigration()
	initializeRouter()
}
