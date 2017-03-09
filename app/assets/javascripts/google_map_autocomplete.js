function initAutocomplete() {
  // var map = new google.maps.Map(document.getElementById('map'), {
  //   center: {lat: 25.802768, lng: -80.204458},
  //   zoom: 11
  // });
  // var card = document.getElementById('pac-card');
  var input = document.getElementById('term');
  // var types = document.getElementById('type-selector');
  // var strictBounds = document.getElementById('strict-bounds-selector');

  // map.controls[google.maps.ControlPosition.TOP_RIGHT].push(card);

  var autocomplete = new google.maps.places.Autocomplete(input);

  // Bind the map's bounds (viewport) property to the autocomplete object,
  // so that the autocomplete requests use the current map bounds for the
  // bounds option in the request.
  // autocomplete.bindTo('bounds', map);

  // var infowindow = new google.maps.InfoWindow();
  // var infowindowContent = document.getElementById('infowindow-content');
  // infowindow.setContent(infowindowContent);
  // var marker = new google.maps.Marker({
  //   map: map,
  //   anchorPoint: new google.maps.Point(0, -29)
  // });

  autocomplete.addListener('place_changed', function() {
    $('.search-form').submit();
  });

  // autocomplete.addListener('place_changed', function() {
  //   infowindow.close();
  //   marker.setVisible(false);
  //   var place = autocomplete.getPlace();
  //   if (!place.geometry) {
  //     // User entered the name of a Place that was not suggested and
  //     // pressed the Enter key, or the Place Details request failed.
  //     // window.alert("No details available for input: '" + place.name + "'");
  //     return;
  //   }
  //
  //   // If the place has a geometry, then present it on a map.
  //   if (place.geometry.viewport) {
  //     map.fitBounds(place.geometry.viewport);
  //   } else {
  //     map.setCenter(place.geometry.location);
  //     map.setZoom(17);  // Why 17? Because it looks good.
  //   }
  //   marker.setPosition(place.geometry.location);
  //   // marker.setVisible(true);
  //
  //   var address = '';
  //   if (place.address_components) {
  //     address = [
  //       (place.address_components[0] && place.address_components[0].short_name || ''),
  //       (place.address_components[1] && place.address_components[1].short_name || ''),
  //       (place.address_components[2] && place.address_components[2].short_name || '')
  //     ].join(' ');
  //   }
  //
  //   infowindowContent.children['place-icon'].src = place.icon;
  //   infowindowContent.children['place-name'].textContent = place.name;
  //   infowindowContent.children['place-address'].textContent = address;
  //   // infowindow.open(map, marker);
  // });

  // Sets a listener on a radio button to change the filter type on Places
  // Autocomplete.
  // function setupClickListener(id, types) {
  //   var radioButton = document.getElementById(id);
  //   radioButton.addEventListener('click', function() {
  //     autocomplete.setTypes(types);
  //   });
  // }

  // setupClickListener('changetype-all', []);
  // setupClickListener('changetype-user', ['user']);
  // setupClickListener('changetype-establishment', ['establishment']);
  // setupClickListener('changetype-cities', ['cities']);


  function geolocate() {
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        var geolocation = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };
        var circle = new google.maps.Circle({
          center: geolocation,
          radius: position.coords.accuracy
        });
        autocomplete.setBounds(circle.getBounds());
      });
    }
  }
  geolocate();
  // document.getElementById('use-strict-bounds')
  //     .addEventListener('click', function() {
  //       console.log('Checkbox clicked! New state=' + this.checked);
  //       autocomplete.setOptions({strictBounds: this.checked});
  //     });
}