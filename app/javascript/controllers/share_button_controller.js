import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="share-button"
export default class extends Controller {
  static targets = ["sharebutton"]

  connect() {
    console.log("Controller connected")
  }

  sharing() {
    window.open("hello")
    this.sharebuttonTarget.innerHTML = "Hello World!"
  }
}
