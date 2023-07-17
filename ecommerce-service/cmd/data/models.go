package data

import (
	"context"
	"database/sql"
	"errors"
	"log"
	"time"

	"golang.org/x/crypto/bcrypt"
)

const dbTimeout = time.Second * 3

type Login struct {
	Username string `json:"username"`
	Password string `json:"passowrd"`
}

type Models struct {
	Login Login
}

var db *sql.DB

// New is the function used to create an instance of the data package. It returns the type
// Model, which embeds all the types we want to be available to our application.
func New(dbPool *sql.DB) Models {
	db = dbPool

	return Models{
		Login: Login{},
	}
}

func (l *Login) GetByUsername(username string) (*Login, error) {
	ctx, cancel := context.WithTimeout(context.Background(), dbTimeout)
	defer cancel()

	query := `select username, password from login where username = $1`

	var login Login
	row := db.QueryRowContext(ctx, query, username)

	err := row.Scan(
		&login.Username,
		&login.Password,
	)

	if err != nil {
		log.Println(err)
		return nil, err
	}

	return &login, nil
}

func (l *Login) PasswordMatches(plainText string) (bool, error) {
	err := bcrypt.CompareHashAndPassword([]byte(l.Password), []byte(plainText))
	if err != nil {
		switch {
		case errors.Is(err, bcrypt.ErrMismatchedHashAndPassword):
			// invalid password
			return false, nil
		default:
			return false, err
		}
	}

	return true, nil
}