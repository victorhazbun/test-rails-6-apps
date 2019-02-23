require('@rails/ujs').start()
require('turbolinks').start()
require('@rails/activestorage').start()
require('channels')

import Vue from 'vue/dist/vue.esm'
import App from '../components/App'
import VueTurbolinks from 'vue-turbolinks'

Vue.config.productionTip = false

Vue.use(VueTurbolinks)

document.addEventListener('turbolinks:load', function() {
  var element = document.querySelector('#app')
  if (element != undefined) {

    const app = new Vue({
      el: element,
      template: '<App />',
      components: { App }
    })
  }
});