function initChart() {
        const data = google.visualization.arrayToDataTable([
          ['Week', 'Plastic'],
          ['2004',  400],
          ['2005',  460],
          ['2006',  1120],
          ['2007',  540]
        ]);

        const options = {
          title: 'Total KG collected',
          legend: { position: 'bottom' }
        };

        const chart = new google.visualization.LineChart(document.getElementById('line_chart'));

        chart.draw(data, options);
      }



export { initChart };
