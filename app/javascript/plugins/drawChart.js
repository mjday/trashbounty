// Load the Visualization API and the corechart package.
google.charts.load('current', {'packages':['corechart', 'line']});


// Set a callback to run when the Google Visualization API is loaded.
google.charts.setOnLoadCallback(drawChart);

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart() {
  let infos = document.querySelectorAll('#info tr')
  if (infos) {
      let datas = []
  infos = infos.forEach((row) => {
    let date = row.cells[1].innerText;
    let total = parseFloat(row.cells[2].innerText);
    let amount = parseFloat(row.cells[3].innerText);
    datas.push({date, total, amount  })
  })
  // console.log(datas)
  // console.log(infos)
  // const date = info.querySelector('.data-date').innerText
  // const amount = info.querySelector('.data-amount').innerText
  // const kg = info.querySelector('.data-kg').innerText
  // console.log(date);
  // console.log(amount);
  // console.log(kg);
  // Create the data table.
  var data = new google.visualization.DataTable();
  console.log("hello " + data)
  data.addColumn('string', 'Date');
  data.addColumn('number', 'Amount');
  data.addColumn('number', 'KG');
  datas.forEach((row) => {
   data.addRows([ [row.date, row.amount, row.total] ]);
  })

  let width = document.querySelector("#nav-summary").offsetWidth
  // Set chart options
  var options = {'title':'Recent Collections'};
                 // 'width':width,
                 // 'height':300};

  // Instantiate and draw our chart, passing in some options.
  var chart = new google.visualization.LineChart(document.getElementById('line_chart'));
  chart.draw(data, options);

  }
}

export { drawChart };
