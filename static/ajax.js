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

}

$('#genres').on('click', ".usergenre", function() {
    var genre = $(this).html();
    $.post("/add-a-genre", {"genre_name": genre}, addGenre);
});