import './style.css';
import {Map, View, Feature} from 'ol';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import {fromLonLat} from 'ol/proj';
import Point from 'ol/geom/Point';
import VectorLayer from 'ol/layer/Vector';
import VectorSource from 'ol/source/Vector';

const polandCoordinates = fromLonLat([19,52]);

const point = new Feature({
  geometry: new Point(fromLonLat([21, 52.23])),
  name: 'Warsaw'
});

const vectorSource = new VectorSource({
  features: [point]
});

const vectorLayer = new VectorLayer({
  source: vectorSource
});

const map = new Map({
  target: 'map',
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
