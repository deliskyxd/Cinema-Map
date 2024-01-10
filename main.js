import './style.css';
import {Map, View, Feature, Overlay} from 'ol';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import {fromLonLat} from 'ol/proj';
import Point from 'ol/geom/Point';
import VectorLayer from 'ol/layer/Vector';
import VectorSource from 'ol/source/Vector';
import {Icon, Style} from 'ol/style';

const polandCoordinates = fromLonLat([19,52]);

const point = new Feature({
  geometry: new Point(fromLonLat([21, 52.23])),
  name: 'Warsaw'
});

const iconStyle = new Style({
  image: new Icon({
    anchor: [0.5, 46],
    anchorXUnits: 'fraction',
    anchorYUnits: 'pixels',
    src: './images/cinemacitylogo.png',
    scale: 0.12
  }),
});

point.setStyle(iconStyle);

const vectorSource = new VectorSource({
  features: [point]
});

const vectorLayer = new VectorLayer({
  source: vectorSource
});


const mapContainer = document.getElementById('map');

const map = new Map({
  target: mapContainer,
  layers: [
    new TileLayer({
      source: new OSM()
    }),
    vectorLayer
  ],
  view: new View({
    center: polandCoordinates,
    zoom: 7,
  })
});

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
    const coordinates = feature.getGeometry().getCoordinates();
    console.log(coordinates);
    const content = '<p>Open hours: 11:00-23:00</p>';
    popupOverlay.setPosition(coordinates);
    document.getElementById('popup-content').innerHTML = content;
  } else {
    popupOverlay.setPosition(undefined);
  }
});

map.on('pointermove', function (e) {
  const pixel = map.getEventPixel(e.originalEvent);
  const hit = map.hasFeatureAtPixel(pixel);
  
  if (hit) {
    map.getTarget().style.cursor = 'pointer';
  } else {
    map.getTarget().style.cursor = '';
  }
});
