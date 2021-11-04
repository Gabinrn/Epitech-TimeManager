<template>
    <section class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-4">
                <div class="login-panel text-left">
                    <div class="alert alert-primary" role="alert" :style="{opacity: isAlertShow ? 1 : 0}">
                    Login successfully. <small>Waiting for redirect.</small>
                    <LoadingComponent width="30"></LoadingComponent>
                    </div>
                    <h1 class="display=3 font-weight-bold">Search User</h1>
                    <p class="font-weight-bold">Search user information.</p>
                    <br>
                    <form action="">
                        <div class="form-group">
                            <label for="email" class="input-label"> Email </label>
                            <input type="email" class="form-control" placeholder="Email">
                        </div>
                        <br>
                        <div class="form-group">
                            <label for="Username" class="input-label"> Username </label>
                            <input type="username" class="form-control" placeholder="username">
                        </div>
                        <br>
                        <div class="form-group d-flex justify-content-center">
                            <button class="btn btn-primary w-25" @click="Login" v-if="!isLoginIn">Search</button>
                            <button class="btn btn-primary w-25" disabled v-if="isLoginIn"><LoadingComponent width="30"></LoadingComponent></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</template>

<script>
import LoadingComponent from '../components/LoadingComponent.vue'

export default {
    components: {
        LoadingComponent
    }, data() {
        return {
            isLoginIn: false,
            isAlertShow: false
        }
    },
    methods: {
        login() {
            this.isLoginIn = true

            setTimeout(() => {
                this.isLoginIn = false
                this.isAlertShow = true
                setTimeout(() => this.redirect(), 1000)
            }, 1000)
        },
        redirect() {
            this.$router.push({name: 'home'})
        }
    }
}
</script>

<style>
    .widget {
        margin: 0;
        height: unset;
    }
    .login-panel {
        padding: 200px 0;
        position: relative;
        /* .alert {
            opacity: 0;
            position: absolute;
            top: 100px;
            width: 100%;
            &.alert-primary {
                background-color: #007BFF;
                color: #fff;
                border: none;
                font-size: 10px;
            }
            .widget {
                position: absolute;
                right: 5px;
                top: 0;
                margin: 10px;
            }
        } */
    }
</style>