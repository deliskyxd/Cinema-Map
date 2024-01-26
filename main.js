import "./style.css";
import { Map, View } from "ol";
import TileLayer from "ol/layer/Tile";
import OSM from "ol/source/OSM";
import { fromLonLat, transformExtent } from "ol/proj";
import createCinemaLayers from "./cinemas";
import createPopup from "./popup";
import { currentLocation, initializeGeolocation } from "./geolocation";
import { toggleLayer, findNearestCinemas } from "./functions";

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
}

initializeMap().catch((error) =>
  console.error("Error initializing map:", error)
);
