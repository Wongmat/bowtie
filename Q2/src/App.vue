<template>
  <div id="app">
    <elem v-bind:type="elements.type" v-bind:message = "elements.message" v-bind:background = "elements.background" v-bind:children = "elements.children"></elem>   
  </div>
</template>

<script>
const axios = require('axios')
export default {
  name: 'app',
  data() {
    return {
      elements: {}
    }
  },
  async mounted () {
    let res = await axios.get("http://localhost:3000")
    this.elements = res.data
  }
}
</script>

<style>
#app {
  border-style: solid;
  border-width: 3px;
  color: #2c3e50;
  padding: 2em;
  position: inherit;
  min-height: 90vh;
}
</style>
