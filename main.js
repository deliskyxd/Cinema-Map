import './style.css';
import {Map, View, Feature, Overlay} from 'ol';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import {fromLonLat, transformExtent} from 'ol/proj';
import Point from 'ol/geom/Point';
import VectorLayer from 'ol/layer/Vector';
import VectorSource from 'ol/source/Vector';
import {Icon, Style} from 'ol/style';

import createCinemaPoints from './cinemas';
import createPopup from './popup';

//import cinemas from "./json/cinemas.json" assert { type: 'json' };
//console.log(cinemas);

const borders = transformExtent([9.1730000, 46.2100000, 29.6310000,58.2790000],'EPSG:4326', 'EPSG:3857');
const polandCoordinates = fromLonLat([20,52]);
const mapContainer = document.getElementById('map');

const jsonFilePath = './data/cinemas.json';
const cinemaLayer = new VectorLayer();

const map = new Map({
    target: mapContainer,
    layers: [
        new TileLayer({
            source: new OSM()
        }),
    ],
    view: new View({
        center: polandCoordinates, // center
        extent: borders,
        resolution: 3000,
        zoom: 1,
    })
});
// If over an icon, change the cursor to a pointer
map.on('pointermove', function (e) {
    const pixel = map.getEventPixel(e.originalEvent);
    const hit = map.hasFeatureAtPixel(pixel);

    map.getTarget().style.cursor = hit ? 'pointer' : '';
});

map.addLayer(cinemaLayer);
createCinemaPoints(map, cinemaLayer, jsonFilePath);
createPopup(map);


