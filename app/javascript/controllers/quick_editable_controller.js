import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "form", "replaceableContainer" ]

  connect() {
  }

  showForm() {
    var formHTML = this.formTarget.innerHTML
    var container = this.replaceableContainerTarget

    container.innerHTML = formHTML
  }
}
