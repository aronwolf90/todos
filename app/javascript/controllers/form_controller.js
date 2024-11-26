import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  submitCheckbox() {
    this.element.getElementsByClassName("status")[0].classList.remove("hidden")
    this.element.querySelector("input[type='checkbox']").classList.add("hidden")
    this.element.requestSubmit();
  }
}
