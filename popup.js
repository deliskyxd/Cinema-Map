import {Overlay} from 'ol';

export default function createPopup(map) {
    const popupOverlay = new Overlay({
      element: document.getElementById('popup'),
      positioning: 'bottom-center',
      stopEvent: false,
      offset: [0, -50],
    });
  
    map.addOverlay(popupOverlay);
  
    map.on('click', function (event) {
      const feature = map.forEachFeatureAtPixel(event.pixel, function (feature) {
        return feature;
      });
  
      if (feature) {
        const featureData = feature.getProperties();
        console.log(featureData);
        const content =  
        `<p>${featureData.cinema.name}</p>
         <p>Adres: ${featureData.cinema.address}</p>
         <p>Kontakt: ${featureData.cinema.contact.phone}, ${featureData.cinema.contact.email}</p>
         <p>Link do repertuaru: <a href="${featureData.cinema.schedule_link}" target="_blank">${featureData.cinema.schedule_link}</a></p>
         <p>Czy jest technologia IMAX?: ${featureData.cinema.imax_technology ? 'Tak' : 'Nie'}</p> 
        `;

        popupOverlay.setPosition(feature.getGeometry().getCoordinates());
        document.getElementById('popup-content').innerHTML = content;
      } else {
        popupOverlay.setPosition(undefined);
      }
    });
}
