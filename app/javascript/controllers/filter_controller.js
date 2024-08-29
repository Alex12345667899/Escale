import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {

  }

  updateValue(event) {
    const input = event.target;
    input.setAttribute('value', input.value);
  }
}

// document.querySelectorAll('input[type=range]').forEach((input) => {
//   input.addEventListener('input', function rangeChange() {
//     this.setAttribute('value', this.value);
//   });
// })
