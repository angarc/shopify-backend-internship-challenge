import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "container" ]

  connect() {
  }

  getSuggestions() {
    let container = this.containerTarget
    const queryLength = this.inputTarget.value.length
    console.log(queryLength);

    if (queryLength == 0) {
      console.log("should hide");
      if (!container.classList.contains("hidden")) {

        console.log("hide!");
        console.log(queryLength);
        container.classList.add("hidden") 
      }
    } else {
      fetch(`/get_suggestions/?q=${this.inputTarget.value}`)
        .then(response => {
          return response.text()
        })
        .then(data => {
          container.innerHTML = data
          container.classList.remove("hidden")
        })
    }
  }
}
