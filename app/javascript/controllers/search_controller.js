import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "input", "container", "searchIcon" ]

  connect() {
  }

  getSuggestions() {
    let container   = this.containerTarget
    let queryLength = this.inputTarget.value.length
    let input       = this.inputTarget
    let searchIcon  = this.searchIconTarget

    if (queryLength == 0) {
      console.log("should hide");
      if (!container.classList.contains("hidden")) {
        container.classList.add("hidden") 
      }

      if (input.classList.contains("suggestions-active")) {
        input.classList.remove("suggestions-active");
      }

      if (searchIcon.classList.contains("suggestions-active")) {
        searchIcon.classList.remove("suggestions-active");
      }

    } else {
      fetch(`/get_suggestions/?q=${this.inputTarget.value}`)
        .then(response => {
          return response.text()
        })
        .then(data => {
          container.innerHTML = data
          container.classList.remove("hidden")

          if (!input.classList.contains("suggestions-active")) {
            input.classList.add("suggestions-active");
          }

          if (!searchIcon.classList.contains("suggestions-active")) {
            searchIcon.classList.add("suggestions-active");
          }
        })
    }
  }
}
