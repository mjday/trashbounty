// Load the Visualization API and the corechart package.
google.charts.load('current', {'packages':['corechart']});

// Set a callback to run when the Google Visualization API is loaded.
google.charts.setOnLoadCallback(drawChart);

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart() {
  const info = document.querySelector('#info')
  const date = info.querySelector('#data-date').innerText
  const amount = info.querySelector('#data-amount').innerText
  const kg = info.querySelector('#data-kg').innerText

  // Create the data table.
  var data = new google.visualization.DataTable();
  data.addColumn('string', 'Date');
  data.addColumn('number', 'Amount');
  data.addColumn('number', 'KG');

  data.addRows([
    [date, parseInt(amount), parseInt(kg)],
    ['hello', 5, 9],
    [date, 5, 6],
    [date, 6, 5]
  ]);

  // Set chart options
  var options = {'title':'Collections in Month',
                 'width':400,
                 'height':300};

  // Instantiate and draw our chart, passing in some options.
  var chart = new google.visualization.LineChart(document.getElementById('line_chart'));
  chart.draw(data, options);
}

export { drawChart };
