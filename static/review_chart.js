// Review feature words bar chart

var review_options = {
      legend: { display: false },
      title: {
        display: true,
        text: 'Most common words found in positive and negative reviews',
        fontColor: "black",
        fontSize: 30
      },
      scales: {
        yAxes: [{
          scaleLabel: {
            display: true,
            labelString: "Log Probability",
            fontColor: "black",
            fontSize: 30
          },
          ticks: {
            fontColor: "black",
            fontSize: 20,
          }
        }],
        xAxes: [{
          ticks: {
            fontColor: "black",
            fontSize: 20,
          }
        }]
      }
    };

var ctx_reviews = $("#review-bar-chart" ).get(0).getContext("2d");

$.get("/reviews.json", function (data) {
var myBarChart = new Chart(ctx_reviews, {
                                        type: 'bar',
                                        data: data,
                                        options: review_options
                                      });
});
