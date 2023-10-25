import { createRouter, createWebHistory } from 'vue-router';
import Login from '@/components/LoginForm.vue';
import Signup from '@/components/SignupForm.vue';
import ChatWindow from '@/components/ChatWindow.vue'; 
import ProfileWindow from '@/components/ProfileWindow.vue';



const routes = [
  { path: '/login', component: Login },
  { path: '/signup', component: Signup },
  { path: '/chat', component: ChatWindow },
  { path: '/profile', component: ProfileWindow },
  { path: '/', redirect: '/login' } 
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
});

export default router;
