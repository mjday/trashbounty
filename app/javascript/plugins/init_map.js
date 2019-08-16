      function initMap(){


        const indexMap = document.getElementById('map')
        if (indexMap) {
          navigator.geolocation.getCurrentPosition(function(position) {
          const lat = position.coords.latitude
          const lng = position.coords.longitude;
         const map = new google.maps.Map(indexMap, {
          center: new google.maps.LatLng(lat,lng),
          zoom: 3
        });
    //     const marker = new google.maps.Marker({
    //       position: ,
    //       map: map
    // });
        const markers = JSON.parse(indexMap.dataset.markers);
        markers.forEach((marker) => {
          new google.maps.Marker({
            position: new google.maps.LatLng(marker.lat, marker.lng),
            map: map
          });

      })
    });
  }
}


  export { initMap };

