import { Overlay } from "ol";

const createPopup = (map) => {
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
      const features = feature.get("features");
      if (features.length === 1) {
        const featureData = features[0].getProperties();

        const featureCoordinate = feature.getGeometry().getCoordinates();
        const mapSize = map.getSize();
        const centerOfViewport = [mapSize[0] / 2, mapSize[1] / 2];
        map.getView().centerOn(featureCoordinate, mapSize, centerOfViewport);
        map.getView().fit(feature.getGeometry(), { minResolution: 60 });
        map.getView().setZoom(15);
        const content = `<h3>${featureData.cinema.name}</h3>
         <p>Adres: ${featureData.cinema.address}</p>
         <p>Telefon: ${featureData.cinema.contact.phone}</p>
         <p>Email: ${featureData.cinema.contact.email}</p>     
         <p>Czy jest technologia IMAX?: ${
           featureData.cinema.imax_technology ? "Tak" : "Nie"
         }</p>
         <button onclick="event.stopPropagation(); window.open('${
           featureData.cinema.schedule_link
         }', '_blank')">      
          Link do repertuaru
         </button> 
        `;

        popupOverlay.setPosition(featureCoordinate);
        document.getElementById("popup-content").innerHTML = content;
      }
    } else {
      popupOverlay.setPosition(undefined);
    }
  });
};

export default createPopup;
