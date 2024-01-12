import "./style.css";
import { Map, View } from "ol";
import TileLayer from "ol/layer/Tile";
import OSM from "ol/source/OSM";
import { fromLonLat, transformExtent } from "ol/proj";
import createCinemaLayers from "./cinemas";
import createPopup from "./popup";

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

async function initializeMap() {
  cinemaLayers = await createCinemaLayers(map, jsonFilePath);
  createPopup(map);
}

function toggleLayer(layerName) {
  const cinemaLayer = cinemaLayers[layerName];
  const layers = map.getLayers().getArray();

  layers.includes(cinemaLayer)
    ? map.removeLayer(cinemaLayer)
    : map.addLayer(cinemaLayer);

  const button = document.querySelector(`button[data-layer="${layerName}"]`);
  if (button) {
    const isLayerVisible = layers.includes(cinemaLayer);
    button.classList.toggle("grayed-out", !isLayerVisible);
  }
}

initializeMap().catch((error) =>
  console.error("Error initializing map:", error)
);

document
  .getElementById("toggleCinemaCity")
  .addEventListener("click", () => toggleLayer("cinemacity"));
document
  .getElementById("toggleHelios")
  .addEventListener("click", () => toggleLayer("helios"));
document
  .getElementById("toggleMultikino")
  .addEventListener("click", () => toggleLayer("multikino"));
