import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="custom-field"
export default class extends Controller {
  static targets = ["pair", "inputField"]

  connect() {
    // console.log("Hi from the custom field controller :D")
  }

  save() {
    // const k = this.keyTarget.value
    // const v = this.valueTarget.value
    // const pair = `${k}: '${v}'`
    this.pairTargets.forEach((pair) => {
      console.log(pair.firstElementChild.value)
      console.log(pair.lastElementChild.value)
    })

    // this.element.insertAdjacentElement(
    //   beforeend,
    //   ""
    //   )
    // this.inputFieldTarget

    // console.log(this.inputFieldTarget.value)
  }
}
