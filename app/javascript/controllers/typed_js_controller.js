import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["All your favorite movies", "in lists you can add"],
      typeSpeed: 100,
      loop: false
    })
  }
}
