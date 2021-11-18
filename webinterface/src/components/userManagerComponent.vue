<template>
  <div>
    <div class="workingTime">
      <md-table md-card class="table">
        <md-table-toolbar>
          <h1 class="md-title">Users List</h1>
          <md-button class="md-fab md-mini md-primary" @click="createModal()">
            <md-icon>add</md-icon>
          </md-button>
        </md-table-toolbar>

        <md-table-row class="head">
          <md-table-head>Email</md-table-head>
          <md-table-head>Username</md-table-head>
          <md-table-head>Role</md-table-head>
          <md-table-head>Action</md-table-head>
        </md-table-row>

        <md-table-row slot="md-table-row" v-for="user in users" :key="user.id">
          <md-table-cell md-label="email" md-sort-by="email" class="align-middle">{{ user.email }}</md-table-cell>
          <md-table-cell md-label="username" md-sort-by="username" class="align-middle">{{ user.username }}</md-table-cell>
          <md-table-cell md-label="role" md-sort-by="role" class="align-middle">{{ user.user_role }}</md-table-cell>
          <md-table-cell>
            <md-button class="md-fab md-mini md-primary" @click="setModal(user)">
              <md-icon>edit</md-icon>
            </md-button>
            <md-button class="md-fab md-mini md-accent" @click="deleteWorkingTime(user.id);">
              <md-icon>delete</md-icon>
            </md-button>
          </md-table-cell>
        </md-table-row>
      </md-table>

      <!--Create Modal-->
      <b-modal
          id="modal-prevent-closing"
          ref="modal"
          title="Submit New User"
          @hidden="resetModal"
          @ok="handleOk"
      >
        <form ref="form" @submit.stop.prevent="handleSubmit">

          <label for="username">Username</label>
          <b-form-input required v-model="username"></b-form-input>
          <label for="email">Email</label>
          <b-form-input required type="email" v-model="email"></b-form-input>
          <label for="user_role">Role</label>
          <b-form-input required v-model="user_role"></b-form-input>
          <label for="password">Password</label>
          <b-form-input required v-model="password" type="password"></b-form-input>
        </form>
      </b-modal>

      <!--Update Modal-->

      <b-modal
          id="modal-prevent-closing"
          ref="update"
          title="Submit Your WorkingTime"
          @hidden="resetModal"
          @ok="handleUpdate"
      >
        <form ref="form" @submit.stop.prevent="handleSubmit">

          <label for="username">Username</label>
          <b-form-input v-model="username"></b-form-input>
          <label for="email">Email</label>
          <b-form-input v-model="email"></b-form-input>
          <label for="user_role">Role</label>
          <b-form-input v-model="user_role"></b-form-input>
          <label for="password">Password</label>
          <b-form-input required v-model="password" type="password"></b-form-input>
        </form>
      </b-modal>
    </div>
  </div>

</template>
<script>
/* eslint-disable no-new */
import axios from "axios";

export default {
  name: "userManager",
  data() {
    return {
      username:"",
      email:"",
      user_role:"",
      password:"",
      userId :"",
      user: '',
      key: 0,
      showDialog: false,
      active: false,
      value: null,
      users: [],
    };
  },
  mounted() {
    this.getAllUsers();
  },
  methods: {
    async getAllUsers() {
      this.users = [];
      axios.get('http://localhost:4000/api/allUsers', {
      }).then(function (response) {
        for (let i = 0; i < (response.data.data).length; i++) {
          this.users.push(response.data.data[i])
        }
      }.bind(this));
    },

    deleteWorkingTime(id) {
      axios.delete('http://localhost:4000/api/users/' + id)
          .then(() => {
            this.getAllUsers();
          })
    },


    createModal() {
      this.$refs['modal'].show()
    },


    resetModal() {
      this.username = ""
      this.userId = ""
      this.email = ""
      this.user_role = ""
      this.password = ""
    },


    handleOk(bvModalEvt) {
      // Prevent modal from closing
      bvModalEvt.preventDefault()
      // Trigger submit handler
      this.handleSubmit()
    },

    setModal(user) {
      this.$refs['update'].show()
      this.userId = user.id
      this.username = user.username
      this.email = user.email
      this.user_role = user.user_role
      this.password = user.password
    },


    handleSubmit() {
      const requestOptions = {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          users: {
            username: this.username,
            email: this.email,
            user_role: this.user_role,
            password: this.password
          }
        })
      };
      fetch('http://localhost:4000/api/users', requestOptions)
          .then(response => response.json())
          .then(() => {
            this.getAllUsers();
            this.$refs['modal'].hide()
          })
    },

    handleUpdate() {
      const requestOptions = {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          user: {
            username: this.username,
            email: this.email,
            user_role: this.user_role,
            password: this.password
          }
        })
      };
      fetch('http://localhost:4000/api/users/' + this.userId, requestOptions)
          .then(response => response.json())
          .then(() => {
            this.getAllUsers();
          })
    },

  }
};
</script>
<style>
.selectUser{
  width: 10% !important;
  display: flex !important;
  margin-left: 10% !important;
}

.WorkingComponent {
  justify-content: flex-end;
  background-color: rgb(103, 103, 180);
  flex-direction: column;
  border-radius: 10px;
  margin-right: 180px;
  height: 100%;
}
.table{
  width: 700px !important;
  margin-right: 100px;
}

.workingTime{
  display: flex !important;
  flex-direction: row !important;
  justify-content: center;
  margin-top: 2%;
}
</style>