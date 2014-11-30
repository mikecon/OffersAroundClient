var map;

var offers = [
    [ 1, 'Masoutis', 41.07743, 23.55846, 'Milk 2Euros'],
    [ 2, 'Mikel',  41.07821, 23.55486, 'Coffee 1Euro'],
    [ 3, 'Admiral', 41.07776, 23.55022, 'Shoes 20Euros'],
    [ 4, 'Goodys', 41.07345, 23.55044, 'Burger 1.5Euros'],
    [ 5, 'Multirama', 41.07349, 23.55829, 'USB Stick 16gb 8Euros']
];

function initialize() {    
    var mapOptions = {
        zoom: 16
    };
    
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    if(navigator.geolocation) {
        
        navigator.geolocation.getCurrentPosition(function(position) {
            var myLatlng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

            var marker = new google.maps.Marker({
                position: myLatlng,
                map: map,
                title: 'Your location.'
            });
        
            var infowindow = new google.maps.InfoWindow({
                content: 'You are here.'
            });
        
            infowindow.open(map,marker);
            map.setCenter(myLatlng);
        }, 
        function() {
            handleNoGeolocation(true);
        });
    } 
    else { 
        handleNoGeolocation(false); 
    }
   
    setMarkers(map, offers);
}

function handleNoGeolocation(errorFlag) {
    if (errorFlag) {
        var content = 'Error: The Geolocation service failed.';
    } else {
        var content = 'Error: Your browser doesn\'t support geolocation.';
    }

    var options = {
        map: map,
        position: new google.maps.LatLng(41.07480, 23.55370),
        content: content
    };

    var infowindow = new google.maps.InfoWindow(options);
    map.setCenter(options.position);
}

function setMarkers(map, locations) {
    for (var i = 0; i < locations.length; i++) {
        var offer = locations[i];
        var LatLng = new google.maps.LatLng(offer[2], offer[3]);
        var marker = new google.maps.Marker({
            position: LatLng,
            map: map,
            title: offer[1],
            zIndex: offer[0],
        });
        
        var infowindow = new google.maps.InfoWindow({            
            content: offer[4],
            zIndex: offer[0]
        });
        
        infowindow.open(map,marker);
    }
}

google.maps.event.addDomListener(window, 'load', initialize);