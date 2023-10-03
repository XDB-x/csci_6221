<template>
    <div>
      <h2>Login</h2>
      <form @submit.prevent="login">
        <div>
          <label for="email">Email:</label>
          <input type="email" v-model="email" required />
        </div>
        <div>
          <label for="password">Password:</label>
          <input type="password" v-model="password" required />
        </div>
        <button type="submit">Login</button>
      </form>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        email: '',
        password: ''
      };
    },
    methods: {
      async login() {
        try {
          // Send a POST request to the backend
          const response = await this.$http.post('/api/login', {
            email: this.email,
            password: this.password
          });
          // Handle login success (e.g., redirect, save token, etc.)
        } catch (error) {
          // Handle error (e.g., show error message)
        }
      }
    }
  };
  </script>
  