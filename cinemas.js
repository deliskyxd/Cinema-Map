import { Feature } from "ol";
import { Icon, Style } from "ol/style";
import { fromLonLat } from "ol/proj";
import Point from "ol/geom/Point";
import VectorSource from "ol/source/Vector";
import VectorLayer from "ol/layer/Vector";

export default async function createCinemaLayers(map, jsonFilePath) {
  const cinemaLayers = {};
  const allCinemas = [];
  try {
    const response = await fetch(jsonFilePath);
    const cinemasData = await response.json();
    const layerNames = Object.keys(cinemasData);

    layerNames.forEach((layerName) => {
      cinemaLayers[layerName] = new VectorLayer();
      map.addLayer(cinemaLayers[layerName]);

      const cinemaFeatures = cinemasData[layerName].map((cinema) => {
        let logoImage = `./images/${layerName}logo.png`;

        const point = new Feature({
          geometry: new Point(
            fromLonLat([cinema.location.longitude, cinema.location.latitude])
          ),
          cinema: cinema,
        });

        point.setStyle(
          new Style({
            image: new Icon({
              anchor: [0.5, 46],
              anchorXUnits: "fraction",
              anchorYUnits: "pixels",
              src: logoImage,
              scale: 0.05,
            }),
          })
        );
        allCinemas.push(point);

        return point;
      });

      console.log(allCinemas);

      const cinemaSource = new VectorSource({
        features: cinemaFeatures,
      });

      cinemaLayers[layerName].setSource(cinemaSource);
    });

    return { cinemaLayers, allCinemas };
  } catch (error) {
    console.error("Error fetching JSON file:", error);

    throw error;
  }
}
