import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-map"
export default class extends Controller {
  static targets = ["map", "eventPage"]
  connect() {
  }

  toggle(event) {
    this.mapTarget.classList.toggle("d-none")
    this.eventPageTarget.classList.toggle("")
  }
}
