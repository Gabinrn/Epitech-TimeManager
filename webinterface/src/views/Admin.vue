<template>
  <div class="dashboard">
    <div class="row">
      <div>
        <Header></Header>
      </div>
    </div>
    <div class="row" style="flex-wrap: nowrap; overflow:hidden">
      <div class="sidebar">
        <div class="nav nav-pills flex-column mb-auto sidebar">
          <b-sidebar id="sidebar-variant" no-header-close="true" visible="true" bg-variant="dark" text-variant="light">
            <div class="px-3 py-2">
              <h1 class="title">Admin</h1>
              <div class="button-group">
                <button type="button" class="btn btn-outline-primary button" v-on:click="component = 'user'">Users Info</button>
                <button type="button" class="btn btn-outline-primary button" v-on:click="component = 'FAQcomponent'">FAQ</button>
              </div>
            </div>
          </b-sidebar>
        </div>
      </div>
      <div style="margin-top: 40px">
        <component class="test" v-bind:is="component"></component>
      </div>
    </div>
  </div>
</template>

<script>
import FAQComponent from '../components/FAQcomponent.vue'
import Header from '../components/Header.vue'
import userManager from '../components/userManagerComponent.vue'

export default {
  name: "Admin",
  beforeCreate() {
    document.querySelector('body').setAttribute('style', 'background:#BEB1B1')
  },
  components: {
    Header,
    'user': userManager,
    'FAQcomponent': FAQComponent,
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

.button-group {
  display: flex;
  flex-direction: column;
  margin-top: 100px;
}

.button {
  margin-top: 20px;
  margin-bottom: 50px;
  margin-right: 10px;
  margin-left: 10px;
  height: 60px;
}
</style>