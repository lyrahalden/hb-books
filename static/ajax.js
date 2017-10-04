"use strict";

//Put 3 genres from the db on the user page
var counter = 3;

function showGenres(results) {
    var genres = results;
    var new_genres = "";
    counter += 3;
    $.each(genres, function(key, value) {
        new_genres += "<li>"+value+"</li>";
    });
    $('.genre-list').html(new_genres);

}

function getGenres() {
    $.post('/genres', {"counter": counter}, showGenres);
}

$('#get-genre-button').on('click', getGenres);