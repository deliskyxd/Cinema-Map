import { Overlay } from "ol";

export default function createPopup(map) {
  const popupOverlay = new Overlay({
    element: document.getElementById("popup"),
    positioning: "bottom-center",
    stopEvent: false,
    offset: [0, -20],
  });

  map.addOverlay(popupOverlay);

  map.on("click", function (event) {
    const feature = map.forEachFeatureAtPixel(event.pixel, function (feature) {
      return feature;
    });

    if (feature) {
      const featureData = feature.getProperties();

      const featureCoordinate = feature.getGeometry().getCoordinates();
      const mapSize = map.getSize();
      const centerOfViewport = [mapSize[0] / 2, mapSize[1] / 2];
      map.getView().centerOn(featureCoordinate, mapSize, centerOfViewport);
      map.getView().fit(feature.getGeometry(), { minResolution: 60 });
      const content = `<p>${featureData.cinema.name}</p>
         <p>Adres: ${featureData.cinema.address}</p>
         <p>Kontakt: ${featureData.cinema.contact.phone}, ${
        featureData.cinema.contact.email
      }</p>
         <p>Link do repertuaru: <a href="${
           featureData.cinema.schedule_link
         }" target="_blank">${featureData.cinema.schedule_link}</a></p>
         <p>Czy jest technologia IMAX?: ${
           featureData.cinema.imax_technology ? "Tak" : "Nie"
         }</p> 
        `;

      popupOverlay.setPosition(featureCoordinate);
      document.getElementById("popup-content").innerHTML = content;
    } else {
      popupOverlay.setPosition(undefined);
    }
  });
}
