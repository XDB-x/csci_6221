import { createRouter, createWebHistory } from 'vue-router';
import Login from '@/components/LoginForm.vue';
import Signup from '@/components/SignupForm.vue';

const routes = [
  { path: '/login', component: Login },
  { path: '/signup', component: Signup },
  { path: '/', redirect: '/login' }, 
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
