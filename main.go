package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "歡迎來到我的網站！ 請打開 /ping 來測試連線")
	})
	http.HandleFunc("/ping", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello World")
	})
	fmt.Println("Server is running on port 8080...")

	log.Fatal(http.ListenAndServe(":8080", nil))
}
