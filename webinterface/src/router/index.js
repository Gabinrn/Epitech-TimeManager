import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Login.vue'
import WorkingTimes from '../views/WorkingTimes.vue'
import UserInterface from '../views/User.vue'
import Manager from '../views/Manager.vue'
import WorkingTime from '../views/WorkingTime.vue'
import Clock from '../views/Clock'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'login',
    component: Login
  },
  {
    path: '/workingTimes',
    name: 'WorkingTimes',
    component: WorkingTimes
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
  },
  {
    path: '/workingTime',
    name: 'WorkingTime',
    component: WorkingTime
  },
  {
    path: '/clock',
    name: 'Clock',
    component: Clock
  },
]

const router = new VueRouter({
  routes
})

export default router
