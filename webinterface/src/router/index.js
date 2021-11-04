import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login.vue'
import Dashboard from '../views/Dashboard.vue'
import WorkingTimes from '../views/WorkingTimes.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'login',
    component: Login
  },
  {
    path: '/dashboard',
    name: 'dashboard',
    component: Dashboard
  },
  {
    path: '/workingTimes',
    name: 'WorkingTimes',
    component: WorkingTimes
  },
]

const router = new VueRouter({
  routes
})

export default router
