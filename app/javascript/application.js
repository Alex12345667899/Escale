// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"
import HideNavbarScroll from "./controllers/hide_navbar_scroll"
Stimulus.register("hide-navbar", HideNavbarScroll)
