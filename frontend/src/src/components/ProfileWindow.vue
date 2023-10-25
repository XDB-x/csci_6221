<template>
  <div class="chat-container">
    <header style="border-bottom: solid 1px lightgray;">
      <img src="@/assets/Crystal_language_logo.png" alt="Crystal Language Logo" class="auth-logo">
    </header>
    <el-page-header @back="goBack" style="border-bottom: solid 1px lightgray;">
      <template #content>
        <span class="text-large font-600 mr-3"> Profile Info </span>
      </template>
    </el-page-header>
    <el-container class="flex-grow">
      <el-aside width="300px" style="display: flex;flex-direction: column; border-right: solid 1px lightgray;padding: 10px; height: calc(100vh - 107px);justify-content: start;align-items: center;">
        <el-avatar :icon="UserFilled" style="width: 200px;height: 200px"/>
        <div style="text-align: left;width: 100%;">
          <h4>Name</h4>
          <div style="display: flex; justify-content: space-between; align-items: center;">
            <p>User1</p>
            <el-icon><EditPen /></el-icon>
          </div>
        </div>
      </el-aside>
      <el-main>
        <div class="chat-messages">
          <div v-for="message in messages" :key="message.id" class="chat-message">
            <strong>{{ message.sender }}:</strong> {{ message.text }}
          </div>
        </div>
        <div class="chat-input">
          <el-input v-model="newMessage" placeholder="Input message" clearable style="margin-top: 10px;"/>
          <el-button type="primary" @click="sendMessage" style="width: 100%;">Send</el-button>
        </div>
      </el-main>
    </el-container>
  </div>
</template>
<script>
export default {
  methods: {
    goBack() {
      this.$router.push('/chat')
    }
  }
}
</script>
<style>
.chat-container {
  width: 100%;
  height: 100vh;
}
</style>