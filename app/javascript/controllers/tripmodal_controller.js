import { Controller } from "@hotwired/stimulus"
import * as bootstrap from "bootstrap"

export default class extends Controller {
  connect() {
    raise
    this.modal = new bootstrap.Modal(this.element)
  }

  open() {
    raise
    if (!this.modal.isOpened) {
      this.modal.show()
    }
  }

  close(event) {
    raise
    if (event.detail.success) {
      this.modal.hide()
    }
  }
}
