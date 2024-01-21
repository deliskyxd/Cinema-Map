import { Geolocation } from "ol";

let currentLocation;

const initializeGeolocation = (map) => {
  const geolocation = new Geolocation({
    trackingOptions: {
      enableHighAccuracy: true,
    },
    projection: map.getView().getProjection(),
  });

  geolocation.setTracking(true);

  geolocation.on("change", () => {
    currentLocation = geolocation.getPosition();
  });
};

export { currentLocation, initializeGeolocation };
