import Vue from 'vue';
import App from './App.vue';
import axios from 'axios';

Vue.config.productionTip = false;

// Configure Axios (HTTP client)
Vue.prototype.$http = axios.create({
  baseURL: 'http://localhost:3000' // Backend server URL
});

new Vue({
  render: h => h(App),
}).$mount('#app');
