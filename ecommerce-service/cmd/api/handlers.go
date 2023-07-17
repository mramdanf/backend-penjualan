package main

import (
	"errors"
	"fmt"
	"net/http"
)

func (app *Config) Login(w http.ResponseWriter, r *http.Request) {
	var requestPayload struct {
		Username string `json:"username"`
		Password string `json:"password"`
	}

	err := app.readJSON(w, r, &requestPayload)
	if err != nil {
		app.errorJSON(w, err, http.StatusBadRequest)
		return
	}

	login, err := app.Models.Login.GetByUsername(requestPayload.Username)
	if err != nil {
		app.errorJSON(w, errors.New("invalid credential"), http.StatusBadRequest)
	}

	valid, err := login.PasswordMatches(requestPayload.Password)
	if err != nil || !valid {
		app.errorJSON(w, errors.New("invalid credentials"), http.StatusBadRequest)
		return
	}

	payload := jsonResponse{
		Error: false,
		Message: fmt.Sprintf("Logged in user %s", login.User),
		Data: login,
	}

	app.writeJSON(w, http.StatusAccepted, payload)

}