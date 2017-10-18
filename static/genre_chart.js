// Genre doughnut chart

var genre_options = { responsive: true };

var ctx_genre = $("#genreChart").get(0).getContext("2d");

$.get("/genre_info.json", function (data) {
var myDonutChart = new Chart(ctx_genre, {
                                        type: 'doughnut',
                                        data: data,
                                        options: genre_options
                                      });
$('#genreLegend').html(myDonutChart.generateLegend());
});