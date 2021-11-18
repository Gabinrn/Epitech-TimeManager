<template>
    <div class="dashboard">
        <div class="row">
            <div>
                <Header></Header>
            </div>
        </div>

        <div class="row" style="flex-wrap: nowrap; overflow:hidden" >
          <b-sidebar id="sidebar-variant" no-header-close="true" visible="true" bg-variant="dark" text-variant="light">
            <div class="px-3 py-2">
              <h1 class="title">User</h1>
              <div class="button-group">
                <button type="button" class="btn btn-outline-primary button" v-on:click="component = 'clockmanager'">ClockTime</button>
                <button type="button" class="btn btn-outline-primary button" v-on:click="component = 'workingtimes'">Working Times</button>
                <button type="button" class="btn btn-outline-primary button" v-on:click="component = 'dayoff'">Day Off</button>
                <button type="button" class="btn btn-outline-primary button" v-on:click="component = 'user'">User Info</button>
                <button type="button" class="btn btn-outline-primary button" v-on:click="component = 'FAQcomponent'">FAQ</button>
              </div>
            </div>
          </b-sidebar>
            <div style="margin-top: 40px; margin-left:10% ">
                <component v-bind:is="component"></component>
            </div>
        </div>
    </div>   
</template>

<script>
import FAQComponent from '../components/FAQcomponent.vue'
import DayoffComponent from '../components/DayOff.vue'
import Header from '../components/Header.vue'
import UserComponent from '../components/UserComponent.vue'
import WorkingTimes from '../components/WorkingTimes.vue'
import ClockManager from '../components/ClockManager.vue'
import ContactMananger from '../components/ContactManager.vue'

export default {
    name: "UserInterface",
  beforeCreate() {
    document.querySelector('body').setAttribute('style', 'background:#BEB1B1')
  },
    components: {
        Header,
        'user': UserComponent,
        'workingtimes': WorkingTimes,
        'clockmanager': ClockManager,
        'FAQcomponent': FAQComponent,
        'dayoff': DayoffComponent,
        'contactMananger': ContactMananger
        },
    data() {
        return {
            component: 'user'
        }
    }
}
</script>

<style>

.title {
  color: white;
}
.sidebar {
    padding: 0;
    height: 75%;
    width: 180px;
    overflow: auto;
    margin-top: 40px;
    border-top-right-radius: 10px;
    box-shadow: 5px 5px 5px blue;
    border-bottom-right-radius: 10px;
    background-color: rgb(39, 36, 36);
}

.button {
    margin-top: 20px;
    margin-bottom: 50px;
    margin-right: 10px;
    margin-left: 10px;
    height: 60px;
}
</style>