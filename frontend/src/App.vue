<template>
    <div id="app">
      <login />
      <register />
    </div>
  </template>
  
  <script>
  import Login from './components/Login.vue';
  import Register from './components/Register.vue';
  
  export default {
    components: {
      Login,
      Register
    }
  };
  </script>
  