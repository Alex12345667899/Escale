import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["input"]

  setcoordinates() {
    const userInput = this.inputTarget.value
    const url = `https://api.mapbox.com/search/geocode/v6/forward?q=${userInput}&access_token=pk.eyJ1IjoidmluY2VudGZ4IiwiYSI6ImNseXp2dnRlZDJrNWsyaXFsbDg4eXQwNjMifQ.qwH6q64_-7Bb5L9gd5bZVA`;

    fetch(url)
    .then(response => response.json())
    .then((data) => {
      const longitude = data.features[0].properties.coordinates.longitude;
      const latitude = data.features[0].properties.coordinates.latitude;
      const fulladress = data.features[0].properties.full_address;
      });
  };
}
