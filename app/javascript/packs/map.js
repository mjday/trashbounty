import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
if (mapElement) {
  const center = JSON.parse(mapElement.dataset.center);
  console.log(center);
  const map = new GMaps({ el: '#map', lat: center.lat, lng: center.lng });
  const markers = JSON.parse(mapElement.dataset.markers);
  markers.forEach((marker) => {
    const infowindow = new google.maps.InfoWindow({ content: marker.infowindow });
    // console.log(marker);
    // marker.addListener('click', function() {
    //   infowindow.open(map, marker);
    // })
    var mark = new google.maps.Marker({
      position: { lat: marker.lat, lng: marker.lng },
      map: map,
      title: 'hehehe'
    });
    mark.addListener('click', function() {
      infowindow.open(map, mark);
    });
  });
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(4);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(4);
  } else {
    map.fitLatLngBounds(markers);
  }
  // markers.addEventListener('click', function() {
  //   infowindow.open(map, markers);
  // }
}
