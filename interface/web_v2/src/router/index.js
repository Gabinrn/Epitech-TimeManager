import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login.vue'
import UserInterface from '../views/User.vue'
import Manager from '../views/Manager.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'login',
    component: Login
  },
  {
    path: '/user',
    name:'user',
    component: UserInterface
  },
  {
    path: '/manager',
    name: 'manager',
    component: Manager
  }
]

const router = new VueRouter({
  routes
})

export default router
