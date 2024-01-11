import {Feature} from 'ol';
import {Icon, Style} from 'ol/style';
import {fromLonLat} from 'ol/proj';
import Point from 'ol/geom/Point';
import VectorSource from 'ol/source/Vector';

export default function createCinemaPoints(map, cinemaLayer, jsonFilePath) {
    fetch(jsonFilePath)
    .then(response => response.json())
    .then(cinemasData => {
      const cinemaFeatures = cinemasData.cinemas.map((cinema) => {

        let logoImage = './images/';

        if (cinema.name.toLowerCase().includes('cinemacity')) {
          logoImage += 'cinemacitylogo.jpg';
        } else if (cinema.name.toLowerCase().includes('helios')) {
          logoImage += 'helioslogo.jpg';
        } else if (cinema.name.toLowerCase().includes('multikino')) {
          logoImage += 'multikinologo.jpg';
        }

        const point = new Feature({
          geometry: new Point(fromLonLat([cinema.location.longitude, cinema.location.latitude])),
          cinema: cinema,
        });

        point.setStyle(
          new Style({
            image: new Icon({
              anchor: [0.5, 46],
              anchorXUnits: 'fraction',
              anchorYUnits: 'pixels',
              src: logoImage,
              scale: 0.12,
            }),
          })
        );

        return point;
      });

      const cinemaSource = new VectorSource({
        features: cinemaFeatures,
      });

      cinemaLayer.setSource(cinemaSource);
    })
    .catch((error) => console.error('Error fetching JSON file:', error));
}
