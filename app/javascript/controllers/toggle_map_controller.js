import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-map"
export default class extends Controller {
  static targets = ["map", "eventPage", "mapIcon", "eventIcon"]
  connect() {
  }

  mapToggle(event) {
    this.mapTarget.classList.remove("d-none")
    this.eventPageTarget.classList.add("d-none")
    this.mapIconTarget.classList.add("d-none")
    this.eventIconTarget.classList.remove("d-none")
  }

  eventToggle(event){
    this.mapTarget.classList.add("d-none")
    this.eventPageTarget.classList.remove("d-none")
    this.mapIconTarget.classList.remove("d-none")
    this.eventIconTarget.classList.add("d-none")
  }
}
