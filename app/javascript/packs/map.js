import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 47.824905, lng: 2.618787 }); // france coordinates
  const markers = JSON.parse(mapElement.dataset.markers);
  const path = JSON.parse(mapElement.dataset.path);
  const gmapMarkers = map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }

  map.drawPolyline({
    path: path,
    strokeColor: '#131540',
    strokeOpacity: 0.6,
    strokeWeight: 6
  });

  const journeyItemZoom = document.querySelectorAll('.journey-item');
  journeyItemZoom.forEach((journeyItem) => {
    journeyItem.addEventListener('click', () => {
      // console.log(gmapMarkers[0].infoWindow.open(map, gmapMarkers[0]));
      const id = journeyItem.dataset.id;
      const lat = journeyItem.dataset.lat;
      const long = journeyItem.dataset.long;

      closeMarkers();
      openMarker(id);

      map.setZoom(12);
      map.setCenter(lat, long);
    });
  });

  function openMarker(id) {
    return gmapMarkers.forEach((marker) => {
      if (marker.id == id) {
        marker.infoWindow.open(map, marker);
      }
    });
  }

  function closeMarkers() {
    gmapMarkers.forEach((marker) => {
      marker.infoWindow.close(map, marker);
    });
  }
}
