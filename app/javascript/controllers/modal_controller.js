import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  hideModal() {
    this.element.parentElement.removeAttribute("src")
    this.element.remove()
  }

  clickOutside(event) {
    if(document.getElementById("modal-content").contains(event.target)) {
      return
    }

    this.hideModal()
  }
}
