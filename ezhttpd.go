// Copyright 2019 Seg <seg@haxxed.com>
// Copyright 2025 Tenox <tenox@tenox.net>

package main

import (
	"flag"
	"log"

	"github.com/SegHaxx/ezhttpd/http"
)

var (
	port = flag.String("port", "8080", "port to bind to")
	path = flag.String("path", "/videos", "path to serve")
)

func main() {
	flag.Parse()
	log.Printf("Starting ezhttpd on port: %v path: %v", *port, *path)
	http.Handle("/", http.FileServer(http.Dir(*path)))
	err := http.ListenAndServe(
		":"+*port,
		http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			http.DefaultServeMux.ServeHTTP(w, r)
			log.Println(r.RemoteAddr, r.Method, r.URL.Path)
		}),
	)
	if err != nil {
		log.Fatal(err)
	}
}
