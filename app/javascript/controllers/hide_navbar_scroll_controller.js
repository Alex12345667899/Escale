// let prevScrollpos = window.scrollY;
// window.onscroll = function() {
//   const currentScrollPos = window.scrollY;
//   if (prevScrollpos > currentScrollPos) {
//     document.getElementById("navbar").style.top = "0";
//   } else {
//     document.getElementById("navbar").style.top = "-100px";
//   }
//   prevScrollpos = currentScrollPos;
// }

// hide_navbar_scroll.js

import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["navbar"]

  connect() {
    this.prevScrollpos = window.scrollY
    window.addEventListener("scroll", this.handleScroll.bind(this))
  }

  disconnect() {
    window.removeEventListener("scroll", this.handleScroll.bind(this))
  }

  handleScroll() {
    const currentScrollPos = window.scrollY

    if (this.prevScrollpos >= currentScrollPos) {
      this.navbarTarget.style.top = "0"
    } else {
      this.navbarTarget.style.top = "-100px"
    }
    this.prevScrollpos = currentScrollPos
  }
}
