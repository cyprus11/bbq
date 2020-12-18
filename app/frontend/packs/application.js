require("@rails/ujs").start()
require('data-confirm-modal')
import "bootstrap/dist/js/bootstrap"
import "air-datepicker/dist/js/datepicker.min"
import "ekko-lightbox/dist/ekko-lightbox.min"
import "../scripts/map"
import "../scripts/ekko-lightbox-init"
import "../scripts/custom"
import "../styles/application"

const images = require.context('../images', true)
