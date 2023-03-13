import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["button", "card"]
  static values = {
    event: String
  }

  connect() {
    console.log(this.eventValue)
  }
  showCard(event) {

    const url = event.currentTarget.dataset.eventUrl
    
    fetch(url)
      .then(response => response.text())
      .then((data) => {
        console.log(data)
        this.cardTarget.innerHTML = data
      })
  }
}
