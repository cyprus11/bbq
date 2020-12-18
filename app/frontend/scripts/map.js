ymaps.ready(init);
var myMap;

function init(){
    address = document.getElementById('map').getAttribute('data-address');

    myMap = new ymaps.Map("map", {
        center: [55.76, 37.64],
        zoom: 10
    });

    myGeocoder = ymaps.geocode(address);

    myGeocoder.then(
        function (res) {
            coordinates = res.geoObjects.get(0).geometry.getCoordinates();

            myMap.geoObjects.add(
                new ymaps.Placemark(
                    coordinates,
                    {
                        iconContent: address,
                        hintContent: address,

                    },
                    {
                        iconLayout: 'default#image',
                        iconImageHref: '../map_icon.png',
                        iconImageSize: [20, 20]
                    }
                )
            );

            myMap.setCenter(coordinates);
            myMap.setZoom(15);
        }, function (err) {
            alert('Ошибка при определении местоположения');
        }
    );
}
