import "./style.css";
import { Map, View } from "ol";
import TileLayer from "ol/layer/Tile";
import OSM from "ol/source/OSM";
import { fromLonLat, transformExtent } from "ol/proj";
import createCinemaLayers from "./cinemas";
import createPopup from "./popup";
import { currentLocation, initializeGeolocation } from "./geolocation";
import { toggleLayer, findNearestCinemas } from "./functions";
import { Cluster, Vector as VectorSource } from "ol/source";
import VectorLayer from "ol/layer/Vector";
import { Circle as CircleStyle, Fill, Stroke, Style, Text } from "ol/style";

const borders = transformExtent(
  [9.173, 46.21, 29.631, 58.279],
  "EPSG:4326",
  "EPSG:3857"
);
const polandCoordinates = fromLonLat([20, 52]);
const mapContainer = document.getElementById("map");

const map = new Map({
  target: mapContainer,
  layers: [
    new TileLayer({
      source: new OSM(),
    }),
  ],
  view: new View({
    center: polandCoordinates,
    extent: borders,
    resolution: 3000,
    zoom: 1,
  }),
});
// If over an icon, change the cursor to a pointer
map.on("pointermove", function (e) {
  const pixel = map.getEventPixel(e.originalEvent);
  const hit = map.hasFeatureAtPixel(pixel);

  map.getTarget().style.cursor = hit ? "pointer" : "";
});

const jsonFilePath = "./data/cinemas.json";

let cinemaLayers;
let allCinemas = [];
async function initializeMap() {
  const result = await createCinemaLayers(map, jsonFilePath);
  cinemaLayers = result.cinemaLayers;
  allCinemas = result.allCinemas;
  createPopup(map);
  initializeGeolocation(map);

  document
    .getElementById("findNearestCinemas")
    .addEventListener("click", () =>
      findNearestCinemas(map, currentLocation, allCinemas, 5)
    );

  document
    .getElementById("toggleCinemaCity")
    .addEventListener("click", () =>
      toggleLayer(map, cinemaLayers, "cinemacity")
    );

  document
    .getElementById("toggleHelios")
    .addEventListener("click", () => toggleLayer(map, cinemaLayers, "helios"));

  document
    .getElementById("toggleMultikino")
    .addEventListener("click", () =>
      toggleLayer(map, cinemaLayers, "multikino")
    );

  document.getElementById("close-button").addEventListener("click", () => {
    document.getElementById("cinema-list-container").style.display = "none";
  });

  // Cluster cinemas
  const clusterSource = new Cluster({
    distance: 40,
    source: new VectorSource({ features: allCinemas }),
  });

  const styleCache = {};
  const clusters = new VectorLayer({
    source: clusterSource,
    style: function (feature) {
      const size = feature.get("features").length;
      let style = styleCache[size];
      if (!style) {
        style = new Style({
          image: new CircleStyle({
            radius: 20,
            stroke: new Stroke({ color: "#fff" }),
            fill: new Fill({
              color: "#3399CC",
            }),
          }),
          text: new Text({
            text: size.toString(),
            fill: new Fill({ color: "#fff" }),
          }),
        });
        styleCache[size] = style;
      }
      return style;
    },
  });

  map.addLayer(clusters);
}

initializeMap().catch((error) =>
  console.error("Error initializing map:", error)
);
