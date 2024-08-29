import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {

  }

  updateValue(event) {
    const input = event.target;
    input.setAttribute('value', input.value);
    if (input.id === 'trip_total_duration' ) {
      input.dataset.valueFormatted = input.value + ' ' + 'days maximum'
    } else if (input.id === 'trip_total_distance' ) {
      input.dataset.valueFormatted = input.value + ' ' + 'km maximum'
    }
  }
}

// document.querySelectorAll('input[type=range]').forEach((input) => {
//   input.addEventListener('input', function rangeChange() {
//     this.setAttribute('value', this.value);
//   });
// })
