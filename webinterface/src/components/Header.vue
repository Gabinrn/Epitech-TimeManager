<template>
    <div>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark header">
            <a href="#" class="navbar-brand">
                <img src="../assets/logo.png" width="80">
            </a>
             <div class="form-group">
                <label for="Username" class="input-label"> Username </label>
                <input type="txt" v-model="usernameInput" class="form-control" placeholder="username">
            </div>
             <div class="form-group">
                <label for="email" class="input-label"> Email </label>
                <input type="email" v-model="emailInput" class="form-control" placeholder="Email">
            </div>

            <div class="btn-group" >
            <button class="btn btn-primary w-100" type="submit" style="margin:10px" >Create account</button>
            <button class="btn btn-primary w-100" type="submit" style="margin:10px" >Log in</button>
            <button class="btn btn-primary w-100" type="submit" style="margin:10px" >Log out</button>
            </div>
        </nav>
    </div>
</template>

<style scoped>
    .header {
        height: 100px;
        box-shadow: 5px 5px 5px blue;
        border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;
    }
    .btn-group {
        margin-left: auto;
    }

    .form-group {
        display: inline;
        padding: 3px;
        color: white;
    }
</style>