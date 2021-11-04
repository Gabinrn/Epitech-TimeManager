<template>
    <div class="Dashboard">
        <div class="Header">
            <div class="Text"> Welcome {username} !</div>
        </div>
        <div class="GridView">
            <user-component class="box box1"/>
            <clock-manager class="box box2"/>
            <working-time class="box box3"/>
            <working-times class="box box4"/>
        </div>
    </div>
</template>

<script>
import ClockManager from '../components/ClockManager.vue'
// import UserComponent from '../components/UserComponent.vue'
// import WorkingTime from '../components/WorkingTime.vue'
// import WorkingTimes from '../components/WorkingTimes.vue'

  export default {
     name: "Dashboard",
     components: {
         ClockManager,
        //  UserComponent,
        //  WorkingTime,
        //  WorkingTimes
     }
}
</script>

