<template>
  <div id="app" class="app-container">
    <router-view @login="login" @signup="signup"/>
    
    <div v-if="userLoggedIn" class="chat-interface">
      <div class="chat-list">
        <!-- You should implement a ChatList component here. -->
      </div>

      <!-- A Chat component could be placed here. -->
    </div>

    <div v-if="userLoggedIn">
      <p>Welcome {{ username }}!</p>
      <button @click="logout">Logout</button>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      userLoggedIn: false,
      username: ''
    };
  },
  methods: {
    login(username) {
      this.userLoggedIn = true;
      this.username = username;
    },
    signup(username) {
      // You might adapt this method to handle additional user details from your modified SignupForm.vue
      this.userLoggedIn = true;
      this.username = username;
    },
    logout() {
      this.userLoggedIn = false;
      this.username = '';
      this.$router.push('/login'); // Redirect to login page after logging out.
    }
  }
}
</script>

<style>
.app-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
}

.chat-interface {
  display: flex;
  height: 100%;
  width: 100%;
}

.chat-list {
  width: 30%;
  border-right: 1px solid #ccc;
  overflow-y: auto;
}
</style>
