package main

import (
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
	"github.com/go-chi/cors"
)

func (app *Config) routes() http.Handler {
	mux := chi.NewRouter()

	// specify who allowed to connect
	mux.Use(cors.Handler(cors.Options{
		AllowedOrigins:   []string{"https://*", "http://*"},
		AllowedMethods:   []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowedHeaders:   []string{"Accept", "Authorization", "Content-Type", "X-CSRF-Token"},
		ExposedHeaders:   []string{"Link"},
		AllowCredentials: true,
		MaxAge:           300,
	}))

	mux.Use(middleware.Heartbeat("/ping"))

	mux.Post("/login", app.Login)

	// mux.Route("/products", func(r chi.Router) {
	// 	r.Use(app.LoggedInUserOnly)
	// 	r.Post("/",)
	// })

	return mux
}

// func (app *Config) LoggedInUserOnly(next http.Handler) http.Handler {
// 	return http.HandleFunc(func(w http.ResponseWriter, r *http.Request) {
		
// 		next.ServeHTTP(w, r)
// 	})
// }