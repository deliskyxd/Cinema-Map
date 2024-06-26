import { Geolocation } from "ol";

let currentLocation;

const success = (position) => {
  currentLocation = [position.coords.longitude, position.coords.latitude];
  //view.setCenter(currentLocation);
};

const error = () => {
  console.log("Can't load position");
  latitude = 54.37083;
  longitude = 18.613465;
  //view.setCenter([longitude, latitude]);
};

const initializeGeolocation = (map) => {
  const geolocation = new Geolocation({
    trackingOptions: {
      enableHighAccuracy: true,
    },
    projection: map.getView().getProjection(),
  });

  geolocation.setTracking(true);

  geolocation.on("change", () => {
    navigator.geolocation.getCurrentPosition(success, error, {
      enableHighAccuracy: true,
    });
  });
  console.log("lokalizacja:", geolocation);
};

export { currentLocation, initializeGeolocation };
