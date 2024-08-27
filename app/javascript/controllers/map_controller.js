import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }
  connect() {
    console.log(this.markersValue)
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/lucmail/cm0auzqan00oz01phbs9p6vsu"
    })
    this.#addMarkersToMap()
    this.#addLinesBetweenMarkers()
    this.#fitMapToMarkers()
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }
  #addLinesBetweenMarkers() {
    if (this.markersValue.length > 1) {
      const coordinates = this.markersValue.map(marker => [marker.lng, marker.lat])
      // Add a source and layer for the line
      this.map.on('load', () => {
        this.map.addSource('route', {
          'type': 'geojson',
          'data': {
            'type': 'Feature',
            'properties': {},
            'geometry': {
              'type': 'LineString',
              'coordinates': coordinates
            }
          }
        })
        this.map.addLayer({
          'id': 'route',
          'type': 'line',
          'source': 'route',
          'layout': {
            'line-join': 'round',
            'line-cap': 'round'
          },
          'paint': {
            'line-color': '#243264',
            'line-width': 3,
            'line-dasharray': [3, 4],
            'line-opacity': 0.8
          }
        })
      })
    }
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
