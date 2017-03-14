function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    // center: {lat: 25.802768, lng: -80.204458},
    zoom: 11
  });
  var geocoder = new google.maps.Geocoder();

  function codeAddress(address) {
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == 'OK') {
        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
            map: map,
            position: results[0].geometry.location
        });
      } else {
        alert('Geocode was not successful for the following reason: ' + status);
      }
    });
  }
  for (var i = 0; i < window.addresses.length; i++) {
    codeAddress(window.addresses[i]);
  }

}
