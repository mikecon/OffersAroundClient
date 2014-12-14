var map;

function initialize() {    
    var table = document.getElementById('records');
    var offers  = parseTable(table);

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
        var values = Object.getOwnPropertyNames(offer).map(function(key) {
            return offer[key];
        });
        var LatLng = new google.maps.LatLng(values[2], values[3]);
        var marker = new google.maps.Marker({
            position: LatLng,
            map: map,
            title: values[1],
            zIndex: parseInt(values[0])
        });
        
        var infowindow = new google.maps.InfoWindow({            
            content: values[4],
            zIndex: parseInt(values[0])
        });
        
        infowindow.open(map,marker);
    }
}

google.maps.event.addDomListener(window, 'load', initialize);
