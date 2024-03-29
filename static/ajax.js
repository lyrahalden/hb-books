"use strict";

//When the user clicks "More!", put the next three genres from the db on the user page
var counter = 3;

function showGenres(results) {
    var genres = results;
    var new_genres = "";
    $.each(genres, function(key, value) {
        new_genres += "<button type='button' class='btn btn-default usergenre'>"+value+"</button>";
    });
    $('.genre-list').html(new_genres);

}

function getGenres() {
    counter += 3;
    $.post('/genres', {"counter": counter}, showGenres);
}

$('#get-genre-button').on('click', getGenres);

//When a user clicks the back button, take them back three genres in the db


$("#back-genre-button").on('click', function() {
    counter -= 3;
    if (counter >= 0) {
        $.post('/genres', {"counter": counter}, showGenres);
    }
    else {
        alert("Hit the More button to go forward.");
    }

});

//when a user clicks the name of a genre, it should add that genre to the db
//won't let a user add a genre twice

function addGenre(results){

    if (results['genre'] !== "nope"){
        $('#faved-genres').append("<button type='button' class='btn btn-default faved-genres'>"+results["genre"]+"</button><br>");
    }
    alert(results["message"]);

}

$('#genres').on('click', ".usergenre", function() {
    var genre = $(this).html();
    $.post("/add-a-genre", {"genre_name": genre}, addGenre);
});


// When a user clicks the button again, delete that user-genre from the db!

function removeGenre(results){
    alert("You have removed " + results["genre"] + " from your list of favs!");
    $('.faved-genres').remove(":contains('"+ results['genre']+"')");

}

$('#faved-genres').on('click', ".faved-genres", function() {
    var genre = $(this).html();
    $.post("/remove-a-genre", {"genre_name": genre}, removeGenre);
});


//When a user clicks the recommendation button, recommend a book to them!

function displayRec(results){
    var books = results;
    // if (books.length === 0){
    //     alert("No recommendations yet. Please favorite more genres!");
    // }
    var book_recs = "";
    $.each(books, function(key, value) {
        book_recs += "<button type='button' class='btn btn-default'><a class='link' href='/books/"+key+"'>"+value[0]+" by "+value[1]+"</a></button>";

    });
    $('#rec').html(book_recs);


}

$('#rec-button').on('click', function() {
    $.get("/recommend", displayRec)
});


//Search box with autofill

$(function() {
    $("#autocomplete").autocomplete({
      source: '/autocomplete',
      minLength: 2,
      select: function( event, ui ) {
        var url = ui.item.id;
        location.href = url;

        // $('#results').html( "Selected: " + ui.item.value );
      },

      html: true,

      open: function(event, ui) {
            $(".ui-autocomplete").css("z-index", 1000);
        }
    });
});

