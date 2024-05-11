import { toLonLat } from "ol/proj";
import { getDistance } from "ol/sphere";
import { fromLonLat } from "ol/proj";

const getCinemaName = (feature) => {
  let cinemaName;
  if (!feature.get("features")) {
    cinemaName = feature.get("cinema").name.toLowerCase();
  } else {
    cinemaName = feature.get("features")[0].get("cinema").name.toLowerCase();
  }
  let words = cinemaName.split(" ");

  if (words[0] === "cinema") {
    cinemaName = words[0] + words[1];
  } else {
    cinemaName = words[0];
  }

  return cinemaName;
};

const toggleCinema = (allCinemasLayer, allCinemas, cinemaBrand) => {
  const button = document.querySelector(`button[brand="${cinemaBrand}"]`);
  if (!button) return;

  const allCinemasFromBrand = allCinemas.filter(
    (feature) => getCinemaName(feature) === cinemaBrand
  );

  const source = allCinemasLayer.getSource().getSource();

  if (button.classList.contains("grayed-out")) {
    source.addFeatures(allCinemasFromBrand);
  } else {
    allCinemasFromBrand.forEach((feature) => {
      source.removeFeature(feature);
    });
  }
  allCinemasLayer.getSource().refresh();

  button.classList.toggle("grayed-out");
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
         <p>Czy jest technologia IMAX?: ${
           cinemaData.imax_technology ? "Tak" : "Nie"
         }</p>
         <button onclick="event.stopPropagation(); window.open('${
           cinemaData.schedule_link
         }', '_blank')">      
          Link do repertuaru
         </button>
        `;
      listItem.onclick = () => {
        const coordinates = [
          cinemaData.location.longitude,
          cinemaData.location.latitude,
        ];
        map.getView().setCenter(fromLonLat(coordinates));
        map.getView().setZoom(15);
      };
      cinemaList.appendChild(listItem);
    });
  }
};

export { toggleCinema, findNearestCinemas, getCinemaName };
