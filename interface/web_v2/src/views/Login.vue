<template>
    <section class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-lg-4">
                <div class="login-panel text-left">
                    <div class="alert alert-primary" role="alert" :style="{opacity: isAlertShow ? 1 : 0}">
                    Login successfully. <small>Waiting for redirect.</small>
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
</script>

<style>
    .widget {
        margin: 0;
        height: unset;
    }
    .login-panel {
        padding: 200px 0;
        position: relative;
    }
</style>