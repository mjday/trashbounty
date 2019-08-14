      var map;
      function initMap() {
        const indexMap = document.getElementById('map')
        if (indexMap) {
          map = new google.maps.Map(indexMap, {
            center: {lat: -34.397, lng: 150.644},
            zoom: 8
          });

        }
      }


export { initMap };
