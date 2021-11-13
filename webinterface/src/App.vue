<template>
  <div id="app">
    <router-view/>
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Roboto:400,500,700,400italic|Material+Icons">
  </div>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

.Text {
  height: 50px;
  font-size: 35px;
  justify-content: center;
}

.Header {
  color: #fff;
  margin: 10px;
  border: solid;
  border-radius: 10px;
  border-width: thick;
  background-color: #333;
}

.GridView {
  display: grid;
  width: 100%;
  height: 100%;
  margin: auto;
  grid-template-columns: repeat(2, minmax(9em, 1fr));
  grid-gap: 10px;
}

.box {
  min-height: 400px;
  min-width: 100px;
  border-radius: 10px;
  color: white;
  font-size: 30px;
}

</style>
