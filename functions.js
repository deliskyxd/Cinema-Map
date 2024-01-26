import { toLonLat } from "ol/proj";
import { getDistance } from "ol/sphere";
import { fromLonLat } from "ol/proj";

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

const findNearestCinemas = (map, location, allCinemas, amount) => {
  if (!location) return;

  const cinemasWithDistance = allCinemas.map((cinema) => {
    const cinemaLocation = toLonLat(cinema.getGeometry().getCoordinates());
    const distance = getDistance(location, cinemaLocation);
    return { ...cinema, distance };
  });

  cinemasWithDistance.sort((a, b) => a.distance - b.distance);

  const nearestCinemas = cinemasWithDistance.slice(0, amount);

  const cinemaListContainer = document.getElementById("cinema-list-container");
  if (cinemaListContainer) {
    cinemaListContainer.style.display = "block";
  }

  const cinemaList = document.getElementById("cinema-list");
  if (cinemaList) {
    cinemaList.innerHTML = "";

    nearestCinemas.forEach((cinema) => {
      const listItem = document.createElement("li");
      const cinemaData = cinema.values_.cinema;
      listItem.innerHTML = `<h3>${cinemaData.name}</h3>
         <p>Adres: ${cinemaData.address}</p>
         <p>Telefon: ${cinemaData.contact.phone}</p>
         <p>Email: ${cinemaData.contact.email}</p>
         <button onclick="event.stopPropagation(); window.open('${
           cinemaData.schedule_link
         }', '_blank')">      
          Link do repertuaru
         </button>
         <p>Czy jest technologia IMAX?: ${
           cinemaData.imax_technology ? "Tak" : "Nie"
         }</p> 
        `;
      listItem.onclick = () => {
        const coordinates = [
          cinemaData.location.longitude,
          cinemaData.location.latitude,
        ];
        map.getView().setCenter(fromLonLat(coordinates));
        map.getView().setZoom(12);
      };
      cinemaList.appendChild(listItem);
    });
  }
};

export { toggleLayer, findNearestCinemas };
