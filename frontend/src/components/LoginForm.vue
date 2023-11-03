<template>
  <div class="auth-container">
    <img src="@/assets/Crystal_language_logo.png" alt="Crystal Language Logo" class="auth-logo">
    <h1 class="auth-title">WebChat</h1>
    <form @submit.prevent="login" class="auth-form">
      <input v-model="email" placeholder="Email" required type="email" />
      <p v-if="errors.email" class="error-text">{{ errors.email }}</p>
      <input v-model="password" placeholder="Password" type="password" required />
      <p v-if="errors.password" class="error-text">{{ errors.password }}</p>
      <button>Log In</button>
      <p>Don't have an account? <router-link to="/signup">Create one.</router-link></p>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      email: '',
      password: '',
      errors: {}
    };
  },
  methods: {
    login() {
      this.checkForErrors();
      if (!Object.keys(this.errors).length) {
        axios.post('http://localhost:3000/login', JSON.stringify({
          email: this.email,
          password: this.password
        }), {
          headers: {
            'Content-Type': 'application/json'
          }
        })
        .then(response => {
          if (response.data.status === 'success') {
            this.$router.push('/chat');  
          } else {
            this.errors.global = response.data.message;
          }
        })
        .catch(error => {
          console.error("There was an error!", error);
        });
      }
    },
    checkForErrors() {
      this.errors = {}; // reset errors
      if (!this.email) this.errors.email = "Email cannot be empty.";
      if (!this.password) this.errors.password = "Password cannot be empty.";
    }
  }
}
</script>


<style scoped>
.error-text {
  color: red;
  margin-top: 5px;
}

.auth-title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
  color: #333;
}
.auth-form {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

button {
  background-color: #25D366;
  color: white;
  border: none;
  padding: 10px;
  cursor: pointer;
  border-radius: 5px;
}

button:hover {
  background-color: #1c9a59;
}

.auth-container {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.auth-logo {
  max-width: 200px;  
  margin-bottom: 20px;
}


.chat-interface {
  height: 100%;
}

.chat-list {
  border-right: 1px solid #ccc;
  overflow-y: auto;
}

.auth-form {
  width: 300px; 
  margin: 0 auto;
}

.submit-btn {
  width: 100%;
}

</style>
