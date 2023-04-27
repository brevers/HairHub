import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="places"
export default class extends Controller {
  static targets = ["field", "map", "latitude", "longitude"];

  connect() {
    if (typeof(google) !== "undefined") {
      this.initMap();
    }
  }

  keyDown(e) {
    if (e.key === "Enter") {
      e.preventDefault();
    }
  }

  initMap() {
    this.map = new google.maps.Map(this.mapTarget, {
      center: new google.maps.LatLng(-34.5992496, -58.3747789),
      zoom: 15
    });

    this.autocomplete = new google.maps.places.Autocomplete(this.fieldTarget);
    this.autocomplete.bindTo("bounds", this.map);
    this.autocomplete.setFields(["address_components", "geometry", "icon", "name"]);
    this.autocomplete.addListener("place_changed", this.placeChanged.bind(this));

    this.marker = new google.maps.Marker({
      map: this.map,
      anchorPoint: new google.maps.Point(0, -29)
    });

    $.get("/agencies.json").done((agencies) => {

      agencies.forEach((agency) => {
        const infoWindow = new google.maps.InfoWindow();

        const marker = new google.maps.Marker({
          map: this.map,
          position: new google.maps.LatLng(agency.latitude, agency.longitude),
          title: agency.name,
        });

        marker.addListener("click", () => {
          infoWindow.close();
          infoWindow.setContent(
          `
            <h3>${agency.name}</h3>
            <div>${agency.pitch}</div>
            <hr/>
            <b>${agency.phone}</b>
            <hr />
            <a href='/agencies/${agency.id}/messages/new' class='btn btn-success'>Conact us!</a>
          `
          );
          infoWindow.open(marker.getMap(), marker);
        });
      });
    });
  }

  placeChanged() {
    let place = this.autocomplete.getPlace();

    if (!place.geometry) {
      window.alert(`No details available for input: ${place.name}`)
      return;
    }

    if (place.geometry.viewport) {
      this.map.fitBounds(place.geometry.viewport);
    }
    else {
      this.map.setCenter(place.geometry.location);
      this.map.setZoom(17);
    }

    this.marker.setPosition(place.geometry.location);
    this.marker.setVisible(true);

    this.latitudeTarget.value = place.geometry.location.lat();
    this.longitudeTarget.value = place.geometry.location.lng();
  }
}
