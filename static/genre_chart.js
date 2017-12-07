// Genre doughnut chart
"use strict";

var ctx_genre = $("#genreChart").get(0).getContext("2d");

$.get("/genre_info.json", function (data) {
var myDonutChart = new Chart(ctx_genre, {
                                        type: 'doughnut',
                                        data: data,
                                        options: { 

                                        responsive: true,

                                        legend: {
                                                    display: false
                                                }
                                            
                                            }
                                      });});
// $('#genreLegend').html(myDonutChart.generateLegend());
// });