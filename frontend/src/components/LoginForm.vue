<template>
  <div class="auth-container">
    <img src="@/assets/Crystal_language_logo.png" alt="Crystal Language Logo" class="auth-logo">
    <h1 class="auth-title">WebChat</h1>
    <form @submit.prevent="login" class="auth-form">
      <input v-model="username" placeholder="Username" required />
      <p v-if="errors.username" class="error-text">{{ errors.username }}</p>
      <input v-model="password" placeholder="Password" type="password" required />
      <p v-if="errors.password" class="error-text">{{ errors.password }}</p>
      <button>Log In</button>
      <p>Don't have an account? <router-link to="/signup">Create one.</router-link></p>
    </form>
  </div>
</template>


<script>
export default {
  data() {
  return {
    username: '',
    password: '',
    errors: {}
  };
},
methods: {
  login() {
    this.checkForErrors();
    if (!Object.keys(this.errors).length) {
      this.$emit('login', this.username);
    }
  },
  checkForErrors() {
    this.errors = {}; // reset errors
    if (!this.username) this.errors.username = "Username cannot be empty.";
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
