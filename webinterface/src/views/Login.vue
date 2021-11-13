<template>

  <div>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark sticky-top">
      <a href="#" class="navbar-brand">
        <img src="../assets/logo.png" width="80">
      </a>
      <p class="navbar-brand" href="#"> Username : {{ user.username }} </p>
      <p class="navbar-brand" href="#"> Email : {{ user.email }} </p>
    </nav>

    <section class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-lg-6">
          <div class="login-panel text-left">
            <!-- Redirection -->
            <!-- <div class="alert alert-primary" role="alert" :style="{opacity: isAlertShow ? 1 : 0}">
                Login successfully. <small>Waiting for redirect.</small>
                <LoadingComponent width="30"></LoadingComponent>
            </div> -->
            <!-- End Redirection -->
            <div id="usercontener">
              <br><br><br>
              <h1 class="display=3 font-weight-bold">Put your Informations </h1>
              <!-- <p class="font-weight-bold">User information.</p> -->
              <br>
              <div class="form-group">
                <label for="email" class="input-label"> Email </label>
                <input type="email" v-model="emailInput" class="form-control" placeholder="Email">
              </div>
              <br>
              <div class="form-group">
                <label for="Username" class="input-label"> Username </label>
                <input type="txt" v-model="usernameInput" class="form-control" placeholder="username">
              </div>
              <br>
              <div class="form-group d-flex justify-content-center">
                <button class="btn btn-primary w-25" type="submit" @click="appel(emailInput,usernameInput)">Send
                </button>
              </div>
              <br>
              <div class="form-group d-flex justify-content-center">
                <button class="btn btn-primary w-25" type="submit" @click="postUser(emailInput,usernameInput)">Create
                </button>
              </div>
            </div>
            <br>

            <!-- Affihage / delete -->
            <div id="modfify">
              <div class="card">
                <div class="card-header">
                  User Informations
                </div>
                <div class="card-body">
                  <!-- <h5 class="card-title"> Modify  </h5>  -->
                  <!-- <label> Username : <input type="text" v-model="user.username" /> </label>
                  <label> Email : <input type="text" v-model="user.email" /> </label>                              -->
                  <p class="card-text"> Username : {{ user.username }} </p>
                  <p class="card-text">Email : {{ user.email }} </p>
                  <a class="btn btn-primary" type="button" @click="deleteUser(emailInput, usernameInput)">Delete </a>
                  <br><br>
                  <a class="btn btn-primary" type="button" @click="putUser(emailInput, usernameInput)">Modify </a>
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
          </div>
        </div>
      </div>
      <!-- <ClockTime/> -->
    </section>
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
  methods: {
    async appel(emailInput, usernameInput) {

      await axios.get("http://localhost:4000/api/users",
          {
            params: {
              email: emailInput,
              username: usernameInput
            }
          })
          .then((response) => {
            this.user = response.data.data[0];
            console.log(this.user);
            alert('reussi')
          })
          .catch(function (error) {
            console.log(error);
          });
    },

    async postUser(emailInput, usernameInput) {

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
    },
  },
}
// Travail sur les requêtes
      // login() {
        //     this.isLoginIn = true
        //     setTimeout(() => {
        //         this.isLoginIn = false
        //         this.isAlertShow = true
        //         setTimeout(() => this.redirect(), 1000)
        //     }, 1000)
        // },
        // redirect() {
        //     this.$router.push({name: 'home'})
        // }
//     async getUser(userID) {
//       let user;
//       let url;
//       if (this.usernameDisplay != "" && this.emailDisplay != "") {
//         if (userID != (null && undefined)) {
//           url = "http://localhost:4000/api/users/" + userID;
//         } else {
//           url ="http://localhost:4000/api/users?email=" + this.emailDisplay + "&username=" + this.usernameDisplay;
//         }
//         await axios
//           .get(url)
//           .then(function (response) {
//             user = response.data.data;
//             console.log(user);
//           })
//           .catch(function (error) {
//             console.log(error);
//           });
//         this.userReceived = user;
//       }
//     },
// },
</script>

<style scoped>
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
  border: 1px black solid;
  border-radius: 15px;
  padding: 0.5px 10px 20px 10px;
  margin-top: 25px;
  margin-bottom: 25px;
}

#modify {
  border: 5px black solid;
  border-radius: 15px;
  padding: 30px;
  margin-bottom: 50px;
}
</style>
