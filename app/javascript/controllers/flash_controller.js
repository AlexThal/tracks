import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  connect() {
    console.log("Hello")
    const element = this.element
    // element.removeAttribute('hidden');
    element.classList.add('animate__animated', 'animate__fadeIn');

    setTimeout(() => {
      this.dismiss();
    }, 2000);
  }

  dismiss() {
    this.element.classList.add('animate__animated', 'animate__fadeOut');

    // wait for the animation fadeOut to end then remove the element
    this.element.addEventListener('animationend', () => {
      this.element.remove();
    });
  }
}
