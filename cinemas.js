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
import { getCinemaName } from "./functions";

async function fetchCinemas() {
    const url = 'http://localhost:8080/cinemas';
    try {
        const response = await fetch(url);
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        const data = await response.json();
        return data;
    } catch (error) {
        console.error('Error fetching data:', error);
    }
}

const createCinemaFeatures = async (map, jsonFilePath) => {
  const allCinemas = [];
  let allCinemasLayer;
  try {
    //const response = await fetch(jsonFilePath);
    //const data = await response.json();

    const data = await fetchCinemas(); 

    const cinemaNames = Object.keys(data);
    const allCinemaFeatures = [];

    cinemaNames.forEach((cinemaName) => {
      const cinemaFeatures = data[cinemaName].map((cinema) => {
        const point = new Feature({
          geometry: new Point(
            fromLonLat([cinema.location.longitude, cinema.location.latitude])
          ),
          cinema: cinema,
        });
        allCinemas.push(point);

        return point;
      });

      allCinemaFeatures.push(...cinemaFeatures);

      const allCinemaSource = new VectorSource({
        features: allCinemaFeatures,
      });

      const clusterSource = new Cluster({
        distance: 60,
        source: allCinemaSource,
      });

      allCinemasLayer = new VectorLayer({
        source: clusterSource,
        style: (feature) => {
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
                src: `./images/${getCinemaName(feature)}logo.png`,
                scale: 0.05,
              }),
            });
          }
          return style;
        },
      });
    });
    map.addLayer(allCinemasLayer);
    return { allCinemasLayer, allCinemas };
  } catch (error) {
    console.error("Error fetching JSON file:", error);

    throw error;
  }
};

export default createCinemaFeatures;
