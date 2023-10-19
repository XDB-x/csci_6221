import { createApp } from 'vue';
import App from './App.vue';
import router from './router/router.js'; // Ensure this path is correct

createApp(App).use(router).mount('#app');
