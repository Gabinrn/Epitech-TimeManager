<template>
    <div class="dashboard">
        <div class="row">
            <div>
                <Header></Header>
            </div>
        </div>
        <div class="row" style="flex-wrap: nowrap; overflow:hidden" >
            <div class="sidebar">
                <div class="nav nav-pills flex-column mb-auto sidebar">
                    <h1>Menu</h1>
                    <button type="button" class="btn btn-outline-primary button" v-on:click="component = 'clockmanager'">Clock Mananger</button>
                    <button type="button" class="btn btn-outline-primary button" v-on:click="component = 'workingtimes'">Working Times</button>
                    <button type="button" class="btn btn-outline-primary button" v-on:click="component = 'dayoff'">Day Off</button>
                    <button type="button" class="btn btn-outline-primary button" v-on:click="component = 'contactMananger'">Contact Manager</button>
                    <button type="button" class="btn btn-outline-primary button" v-on:click="component = 'FAQcomponent'">FAQ</button>
                </div>
            </div>
            <div style="margin-top: 40px">
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