<template>
  <div v-bind:class="type" v-bind:style="{ 'background-color': background }">
    <h1 v-if="type == 'box'">{{ message }} ({{background}})</h1>
    <h3 v-else>{{ message }}</h3>
    <elem v-for="child in children" :key="child.id" :type="child.type" :message = "child.message" :background = "child.background" :children = "child.children"></elem>
  </div>
</template>

<script>
export default {
  name: 'elem',
  props: {
    type: String,
    message: String,
    background: String,
    children: Array
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.box {
  height: 60%;
  width: 70%;
  border-style: solid;
  border-width: 2px;
  margin: auto;
  padding: 2em;
  border-radius: 25px;
}

.text {
  width: 75%;
  margin: auto;
}

h1 {
  font-family: "Tahoma";
  font-weight: bold;
}

h3 {
  font-family: "Arial";
  font-weight: normal;
}

</style>
