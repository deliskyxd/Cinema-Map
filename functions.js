import { toLonLat } from "ol/proj";
import { getDistance } from "ol/sphere";
import { currentLocation } from "./geolocation.js";

const toggleLayer = (map, cinemaLayers, layerName) => {
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
};

const findNearestCinemas = (allCinemas, amount) => {
  const cinemasWithDistance = allCinemas.map((cinema) => {
    const cinemaLocation = toLonLat(cinema.getGeometry().getCoordinates());
    const distance = getDistance(currentLocation, cinemaLocation);
    return { ...cinema, distance };
  });

  cinemasWithDistance.sort((a, b) => a.distance - b.distance);

  const nearestCinemas = cinemasWithDistance.slice(0, amount);

  nearestCinemas.forEach((cinema) => {
    console.log(cinema.values_.cinema);
  });
};

export { toggleLayer, findNearestCinemas };