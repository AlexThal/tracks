import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="custom-field"
export default class extends Controller {
  static targets = ["pair", "wrapper", "inputField"]

  connect() {
    // console.log("Hi from the custom field controller :D")
  }

  save() {
    // const k = this.keyTarget.value
    // const v = this.valueTarget.value
    // const pair = `${k}: '${v}'`
    let str = ""
    let obj;
    this.pairTargets.forEach((pair) => {
      let key = pair.firstElementChild.value
      let value = pair.lastElementChild.value
      str = `{${str.slice(1,-1)}"${key.toLowerCase()}":"${value.toLowerCase()}",}`
    })

    let html = `<div class="custom-field-wrapper" data-custom-field-target="pair">
    <input class="custom-field-form form-control string required" type="text" name="set_key" id="set_key" placeholder="reps, weight, distance...">
    <p class="custom-field-form">:</p>
    <input class="custom-field-form form-control string required" type="text" name="set_value" id="set_value" placeholder="12, 40Kg, 12km...">
    </div>`
    // console.log(this.wrapperTarget)
    this.wrapperTarget.insertAdjacentHTML("beforeend", html)
    // console.log(`${str.slice(0,-2)}}`)

    // The JSON way
    // obj = JSON.parse(`${str.slice(0,-2)}}`)
    // console.log(obj)
    console.log(`${str.slice(0,-2)}}`)
    this.inputFieldTarget.value = `${str.slice(0,-2)}}`
    // console.(this.inputFieldTarget.value)

    // console.log(this.inputFieldTarget.value)
  }
}
