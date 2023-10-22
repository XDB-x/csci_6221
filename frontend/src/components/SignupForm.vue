<template>
  <div class="auth-container">
    <img src="@/assets/Crystal_language_logo.png" alt="Crystal Language Logo" class="auth-logo">
    <h1 class="auth-title">WebChat</h1>
    <form @submit.prevent="signup" class="auth-form">
      <input v-model="firstName" placeholder="First Name" required />
      <input v-model="lastName" placeholder="Last Name" required />
      <input v-model="email" placeholder="Email" required type="email" />
      <div v-if="errors.email" class="error-message">{{ errors.email }}</div>
      <input v-model="password" placeholder="Password" required type="password" />
      <div v-if="errors.password" class="error-message">{{ errors.password }}</div>
      <button :disabled="!isValid">Sign Up</button>
    </form>
  </div>
</template>



<script>
export default {
  data() {
  return {
    firstName: '',
    lastName: '',
    email: '',
    password: '',
    errors: {}
  };
},
methods: {
  signup() {
    this.checkForErrors();
    if (!Object.keys(this.errors).length) {
      this.$emit('signup', this.email);
      this.$router.push('/login');
    }
  },
  checkForErrors() {
  this.errors = {}; // reset errors
  if (!this.email) this.errors.email = "Email cannot be empty.";
  else if (!this.isEmailValid) this.errors.email = "The email format must be correct.";
  if (!this.password) this.errors.password = "Password cannot be empty.";
  else if (!this.isPasswordValid) this.errors.password = "Password must be at least 8 characters. Include at least one uppercase letter, one lowercase letter, and number.";
},
computed: {
    isEmailValid() {
      const emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
      return emailRegex.test(this.email);
    },
    isPasswordValid() {
      const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
      return passwordRegex.test(this.password);
    },
    isValid() {
      return this.isEmailValid && this.isPasswordValid && this.firstName && this.lastName;
    }
  }
}
}

</script>


<style>
.error-text {
  color: red;
  margin-top: 5px;
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

.auth-title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
  color: #333;
}

</style>
