import Vue from 'vue'
import App from './App.vue'
import elem from './components/element.vue'

Vue.config.productionTip = false
Vue.component("Elem", elem)

new Vue({
  render: h => h(App)
}).$mount('#app')
