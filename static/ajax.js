"use strict";

//When the user clicks "More!", put the next three genres from the db on the user page
var counter = 3;

function showGenres(results) {
    var genres = results;
    var new_genres = "";
    counter += 3;
    $.each(genres, function(key, value) {
        new_genres += "<button class=usergenre>"+value+"</button><br>";
    });
    $('.genre-list').html(new_genres);

}

function getGenres() {

    $.post('/genres', {"counter": counter}, showGenres);
}

$('#get-genre-button').on('click', getGenres);


//when a user clicks the name of a genre, it should add that genre to the db

function addGenre(results){

    alert("You have added " + results["genre"] + " to your list of favs!");
    $('#fav-genres').append("<button class=faved-genres>"+results["genre"]+"</button><br>")

}

$('#genres').on('click', ".usergenre", function() {
    var genre = $(this).html();
    $.post("/add-a-genre", {"genre_name": genre}, addGenre);
});


//When a user clicks the button again, delete that genre from the db!

function removeGenre(results){
    alert("You have removed " + results["genre"] + " to your list of favs!");
    $('#fav-genres').remove("<button class=faved-genres>"+results["genre"]+"</button><br>")

}

$('#fav-genres').on('click', ".faved-genres", function() {
    var genre = $(this).text();
    console.log(genre)
    $.post("/remove-a-genre", {"genre_name": genre}, removeGenre);
});


//When a user clicks the recommendation button, recommend a book to them!

function displayRec(results){
    var books = results;
    var book_recs = "";
    $.each(books, function(key, value) {
        book_recs += "<p class=usergenre>"+value[0]+" by "+value[1]+"</p>";
    });
    $('#rec').html(book_recs);

}

$('#rec-button').on('click', function() {
    $.get("/recommend", displayRec)
});