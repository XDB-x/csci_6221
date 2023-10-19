<template>
  <form @submit.prevent="login" class="auth-form">
    <input v-model="username" placeholder="Username" />
    <input v-model="password" placeholder="Password" type="password" />
    <button>Log In</button>
    <p>Don't have an account? <router-link to="/signup">Create one.</router-link></p>
  </form>
</template>

<script>
export default {
  data() {
    return {
      username: '',
      password: ''
    }
  },
  methods: {
    login() {
      this.$emit('login', this.username)
    }
  }
}
</script>


<style scoped>
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
</style>
