<template>
    <div>
      <h2>Register</h2>
      <form @submit.prevent="register">
        <div>
          <label for="email">Email:</label>
          <input type="email" v-model="email" required />
        </div>
        <div>
          <label for="password">Password:</label>
          <input type="password" v-model="password" required />
        </div>
        <button type="submit">Register</button>
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
      async register() {
        try {
          // Send a POST request to the backend
          const response = await this.$http.post('/api/register', {
            email: this.email,
            password: this.password
          });
          // Handle registration success
        } catch (error) {
          // Handle error
        }
      }
    }
  };
  </script>
  