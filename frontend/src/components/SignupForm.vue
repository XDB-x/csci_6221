<template>
  <div class="auth-container">
    <img src="@/assets/Crystal_language_logo.png" alt="Crystal Language Logo" class="auth-logo">
    <form @submit.prevent="signup" class="auth-form">
      <input v-model="firstName" placeholder="First Name" required />
      <input v-model="lastName" placeholder="Last Name" required />
      <input v-model="email" placeholder="Email" required type="email" />
      <input v-model="password" placeholder="Password" required type="password" />
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
      password: ''
    }
  },
  computed: {
    isValid() {
      const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/
      return this.firstName && this.lastName && passwordRegex.test(this.password)
    }
  },
  methods: {
    signup() {
      if (this.isValid) {
        this.$emit('signup', this.email)
        this.$router.push('/login')
      }
    }
  }
}
</script>


<style>
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
