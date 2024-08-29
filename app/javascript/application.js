// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

import { Application } from "@hotwired/stimulus"
// import HideNavbarScrollController from "./controllers/hide_navbar_scroll"

const application = Application.start()
// application.register("hide-navbar-scroll", HideNavbarScrollController)
