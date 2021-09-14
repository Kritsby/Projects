package main

import (
	"encoding/json"
	"fmt"
	"net/http"
	"strconv"

	"github.com/gorilla/mux"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var DB *gorm.DB
var err error
var books []Book
var publishing []Publishing
var amount []Amount
var wherebook []WhereBook
var issued []Issued

const DNS = "root:admin@tcp(127.0.0.1:3306)/godb?charset=utf8mb4&parseTime=True&loc=Local"

type Book struct {
	gorm.Model

	Titlename   string     `json:"titlename"`
	Description string     `json:"description"`
	Author      string     `json:"author"`
	Year        string     `json:"year"`
	Edition     string     `json:"edition"`
	Publishing  Publishing `json:"publishing" gorm:"foreignKey:id"`
	Amount      Amount     `json:"amount" gorm:"foreignKey:id"`
	WhereBook   WhereBook  `json:"wherebook" gorm:"foreignKey:id"`
	Issued      Issued     `json:"issued" gorm:"foreignKey:id"`
}

type Publishing struct {
	gorm.Model

	Name           string `json:"name"`
	YearPublishing string `json:"yarpublishing"`
}

type Amount struct {
	gorm.Model

	Sum string `json:"sum"`
}

type WhereBook struct {
	gorm.Model

	Number string `json:"number"`
}

type Issued struct {
	gorm.Model

	Hands         string `json:"hands"`
	AmountOfHands string `json:"amountofhands"`
}

func InitialMigration() {
	DB, err = gorm.Open(mysql.Open(DNS), &gorm.Config{})
	if err != nil {
		fmt.Println(err.Error())
		panic("Cannot connect to DB")
	}
	DB.AutoMigrate(&Book{}, &Publishing{}, &Amount{}, &WhereBook{}, &Issued{})
}

func GetBooks(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	params := mux.Vars(r)
	size, _ := strconv.Atoi(params["size"])
	page, _ := strconv.Atoi(params["page"])
	offset := (page - 1) * size
	DB.Limit(size).Offset(offset).Find(&books)
	json.NewEncoder(w).Encode(books)
}

func GetBook(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	params := mux.Vars(r)
	var book Book
	DB.First(&book, params["id"])
	json.NewEncoder(w).Encode(book)
}

func GetItem(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	params := mux.Vars(r)
	switch {
	case params["item"] == "book":
		DB.First(&books, params["id"])
		json.NewEncoder(w).Encode(books)
	case params["item"] == "publishing":
		DB.First(&publishing, params["id"])
		json.NewEncoder(w).Encode(publishing)
	case params["item"] == "amount":
		DB.First(&amount, params["id"])
		json.NewEncoder(w).Encode(amount)
	case params["item"] == "wherebook":
		DB.First(&wherebook, params["id"])
		json.NewEncoder(w).Encode(wherebook)
	case params["item"] == "issued":
		DB.First(&issued, params["id"])
		json.NewEncoder(w).Encode(issued)
	}
}

func CreateBook(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	var book Book
	json.NewDecoder(r.Body).Decode(&book)
	DB.Create(&book)
	json.NewEncoder(w).Encode(book)
}
