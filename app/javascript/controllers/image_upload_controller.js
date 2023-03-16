import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="image-upload"
export default class extends Controller {
  connect() {
    console.log("I work");
  }
  select() {
    console.log("I was clicked");
  }
}
