<template>
    <div class="component">
        <h1>User Component</h1>
          <div id="usercontener">
                
                              <div class="card-body">
                                    <h5 class="card-title"> Delete or put your new informations  </h5>
                                    <p class="card-text"> Username : </p>
                                    <p class="card-text">Email : </p>
                                    <a class="btn btn-primary" type="button" @click="deleteUser(emailInput, passwordInput)">Delete </a>
                                    <br><br>
                                    <a class="btn btn-primary" type="button" @click="putUser(emailInput, passwordInput)">Modifier </a>
                            <br><br>        
                                <!-- Modifier  -->
                                    <div class="form-group">
                                        <label for="email" class="input-label"> Email </label>
                                        <input type="email" v-model="emailInput" class="form-control" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <label for="Username" class="input-label"> Username </label>
                                        <input type="txt" v-model="usernameInput" class="form-control" placeholder="username">
                                    </div>
                                </div>
        </div>
    </div>
</template>

<script>
// import LoadingComponent from '../components/LoadingComponent.vue'
import axios from 'axios'
// import ClockTime from "@/components/ClockTime"

export default {
  components: {
    // LoadingComponent,
    // ClockTime
  },
  data() {
    return {
      user: [{
        id: 0,
        usernameInput: '',
        emailInput: '',
        username: '',
        email: ''
      }]
    }
  },
  mounted() {
    this.appel()
  },
  methods: {
    appel() {
      axios.get("http://localhost:4000/api/users",
          {
            params: {
              email: "admin@admin2.com",
              username: "adminadmin2"
            }
          })
          .then((response) => {
            this.user = response.data.data[0];
            console.log(this.user);
          })
          .catch(function (error) {
            console.log(error);
          });
    },

/*    async postUser(emailInput, usernameInput) {

      await axios.post("http://localhost:4000/api/users",
          {
            users: {
              email: emailInput,
              username: usernameInput
            }
          })
          .then(() => {
            alert('reussi')
          })
          .catch(function (error) {
            console.log(error);
          });
    },

    async deleteUser(emailInput, usernameInput) {

      await axios.delete("http://localhost:4000/api/users/" + this.user.id,
          {
            users: {
              email: emailInput,
              username: usernameInput
            }
          })

          .then(() => {
            alert('reussi')
          })
          .catch(function (error) {
            console.log(error);
            alert(error)
          });
    },

    async putUser(emailInput, usernameInput) {

      await axios.put("http://localhost:4000/api/users/" + this.user.id,
          {
            users: {
              email: emailInput,
              username: usernameInput
            }
          })
          .then(() => {
            alert('reussi')
          })
          .catch(function (error) {
            console.log(error);
            alert(error);
          });
    },*/
  },
}
</script>

<style>
.userTable{
  margin-top: 15%;
  margin-left: 20%;
}

.component{
    justify-content: flex-end;
    background-color: rgb(207, 103, 103);
    flex-direction: column;
    border-radius: 10px;
    margin-right: 180px;
    height: 100%;
}
.widget {
  margin: 0;
  height: unset;
}

.login-panel {
  position: relative;
}

.login-panel .alert {
  opacity: 0;
  position: absolute;
  top: 100px;
  width: 50%;
}

.login-panel .alert.alert-primary {
  background-color: #007BFF;
  color: #fff;
  border: none;
  font-size: 10px;
}

.login-panel .alert .widget {
  position: absolute;
  right: 5px;
  top: 0;
  margin: 10px;
}

#usercontener {
  /* border: 1px black solid; */
  border-radius: 15px;
  padding: 0.5px 10px 20px 10px;
  margin-top: 25px;
  margin-bottom: 25px;
}

</style>