<template>
  <el-container id="app" class="app-container">
    <router-view @login="login" @signup="signup"/>
    
    <el-main v-if="userLoggedIn" class="chat-interface">
      <el-aside width="30%" class="chat-list">

      </el-aside>
      <el-container direction="vertical">
        <p>Welcome {{ username }}!</p>
        <el-button @click="logout">Logout</el-button>
      </el-container>
    </el-main>
  </el-container>
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

      this.userLoggedIn = true;
      this.username = username;
    },
    logout() {
      this.userLoggedIn = false;
      this.username = '';
      this.$router.push('/login'); // redirect to login page
  }
},
};
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

.app-container {
  height: 100vh;
}

.chat-interface {
  height: 100%;
}

.chat-list {
  border-right: 1px solid #ccc;
  overflow-y: auto;
}

.auth-form {
  width: 300px; /* Or any desired width */
  margin: 0 auto;
}

.submit-btn {
  width: 100%;
}

</style>
