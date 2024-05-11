import { Feature } from "ol";
import {
  Icon,
  Style,
  Circle as CircleStyle,
  Stroke,
  Text,
  Fill,
} from "ol/style";
import { fromLonLat } from "ol/proj";
import Point from "ol/geom/Point";
import { Vector as VectorSource, Cluster } from "ol/source";
import VectorLayer from "ol/layer/Vector";

const createCinemaLayers = async (map, jsonFilePath) => {
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
        const point = new Feature({
          geometry: new Point(
            fromLonLat([cinema.location.longitude, cinema.location.latitude])
          ),
          cinema: cinema,
        });
        allCinemas.push(point);

        return point;
      });

      const cinemaSource = new VectorSource({
        features: cinemaFeatures,
      });

      const clusterSource = new Cluster({
        distance: 50,
        source: cinemaSource,
      });

      cinemaLayers[layerName] = new VectorLayer({
        source: clusterSource,
        style: function (feature) {
          const size = feature.get("features").length;
          let style = feature.get("features")[0].getStyle();

          if (size > 1) {
            style = new Style({
              image: new CircleStyle({
                radius: 20,
                stroke: new Stroke({ color: "#fff" }),
                fill: new Fill({ color: "#3399CC" }),
              }),
              text: new Text({
                text: size.toString(),
                fill: new Fill({ color: "#fff" }),
              }),
            });
          } else {
            style = new Style({
              image: new Icon({
                anchor: [0.5, 46],
                anchorXUnits: "fraction",
                anchorYUnits: "pixels",
                src: `./images/${layerName}logo.png`,
                scale: 0.05,
              }),
            });
          }
          return style;
        },
      });

      map.addLayer(cinemaLayers[layerName]);
    });

    return { cinemaLayers, allCinemas };
  } catch (error) {
    console.error("Error fetching JSON file:", error);

    throw error;
  }
};

export default createCinemaLayers;
