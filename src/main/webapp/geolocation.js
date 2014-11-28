function initialize() {
    var myLatlng = new google.maps.LatLng(41.07480,23.55370);
    var mapOptions = {
        zoom: 16,
        center: myLatlng
    }
    var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    
    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title: 'Your location.'
    });
    
    var infowindow = new google.maps.InfoWindow({
        content: 'You are here.'
    });
    
    infowindow.open(map,marker);
    
    //google.maps.event.addListener(marker, 'click', function() {
    //    infowindow.open(map,marker);
    //});
    
    setMarkers(map, offers);
}

var offers = [
    [ 1, 'Masoutis', 41.07743, 23.55846, 'Milk 2Euros'],
    [ 2, 'Mikel',  41.07821, 23.55486, 'Coffee 1Euro'],
    [ 3, 'Admiral', 41.07776, 23.55022, 'Shoes 20Euros'],
    [ 4, 'Goodys', 41.07345, 23.55044, 'Burger 1.5Euros'],
    [ 5, 'Multirama', 41.07349, 23.55829, 'USB Stick 16gb 8Euros']
];

function setMarkers(map, locations) {
  // Add markers to the map

    for (var i = 0; i < locations.length; i++) {
        var offer = locations[i];
        var myLatLng = new google.maps.LatLng(offer[2], offer[3]);
        var marker = new google.maps.Marker({
            position: myLatLng,
            map: map,
            title: offer[1],
            zIndex: offer[0],
        });
        
        var infowindow = new google.maps.InfoWindow({            
            content: offer[4],
            zIndex: offer[0]
        });
        
        infowindow.open(map,marker);
        
        //google.maps.event.addListener(this, 'click', function() {
        //    infowindow.open(map,this);
        //});
    }
}

google.maps.event.addDomListener(window, 'load', initialize);