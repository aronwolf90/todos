import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  close() {
    this.element.removeAttribute("open")
  }

  clickOutside(event) {
    if(document.getElementById("modal-content").contains(event.target)) {
      return
    }

    this.close()
  }

  open() {
    this.element.setAttribute("open", "true")

    let element_to_focus = this.element.querySelector('[autofocus]')

    if (element_to_focus) {
      element_to_focus.focus()
    }
  }
}
