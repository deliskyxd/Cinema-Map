import "./style.css";
import { Map, View } from "ol";
import TileLayer from "ol/layer/Tile";
import OSM from "ol/source/OSM";
import { fromLonLat, transformExtent } from "ol/proj";
import createCinemaFeatures from "./cinemas";
import createPopup from "./popup";
import { currentLocation, initializeGeolocation } from "./geolocation";
import { toggleCinema, findNearestCinemas } from "./functions";

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

//const jsonFilePath = "./data/cinemas.json";
const jsonFilePath = "localhost:8080/cinemas";

const initializeMap = async () => {
  const result = await createCinemaFeatures(map, jsonFilePath);
  createPopup(map);
  initializeGeolocation(map);

  document
    .getElementById("findNearestCinemas")
    .addEventListener("click", () =>
      findNearestCinemas(map, currentLocation, result.allCinemas, 5)
    );

  document
    .getElementById("toggleCinemaCity")
    .addEventListener("click", () =>
      toggleCinema(result.allCinemasLayer, result.allCinemas, "cinemacity")
    );

  document
    .getElementById("toggleHelios")
    .addEventListener("click", () =>
      toggleCinema(result.allCinemasLayer, result.allCinemas, "helios")
    );

  document
    .getElementById("toggleMultikino")
    .addEventListener("click", () =>
      toggleCinema(result.allCinemasLayer, result.allCinemas, "multikino")
    );

  document.getElementById("close-button").addEventListener("click", () => {
    document.getElementById("cinema-list-container").style.display = "none";
  });
};

initializeMap().catch((error) =>
  console.error("Error initializing map:", error)
);
