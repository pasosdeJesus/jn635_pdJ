console.log('Hola Mundo desde Webpacker')

import Rails from "@rails/ujs"
Rails.start()
import Turbolinks from "turbolinks"
Turbolinks.start()

import $ from "expose-loader?exposes=$,jQuery!jquery";
import '@popperjs/core';
import * as bootstrap from 'bootstrap'              // Maquetacion y elementos de diseño

import 'chosen-js/chosen.jquery';       // Cuadros de seleccion potenciados
import 'bootstrap-datepicker'
import 'bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js'
import 'jquery-ui'
import 'jquery-ui/ui/widgets/autocomplete' 
import 'jquery-ui/ui/data' 
import 'jquery-ui/ui/focusable' 
