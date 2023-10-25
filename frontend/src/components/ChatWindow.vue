
// it just a sample code, you can change it as you want
<template>
    <div class="chat-container">
      <header style="border-bottom: solid 1px lightgray;">
        <img src="@/assets/Crystal_language_logo.png" alt="Crystal Language Logo" class="auth-logo">
      </header>
      <el-container class="flex-grow">
        <el-aside width="300px" style="border-right: solid 1px lightgray;padding: 10px; height: calc(100vh - 107px)">
          <el-menu
            mode="horizontal"
            :ellipsis="false"
            @select="handleSelect"
          >
            <el-menu-item index="0">
              <el-avatar style="cursor: pointer;"/>
            </el-menu-item>
            <div class="flex-grow" />
            <el-menu-item index="1">
              <el-icon><UserFilled /></el-icon>
            </el-menu-item>
            <el-sub-menu index="2">
              <template #title>
                <el-icon><MoreFilled /></el-icon>
              </template>
              <el-menu-item index="2-1">Setting</el-menu-item>
              <el-menu-item index="2-2">Logout</el-menu-item>
            </el-sub-menu>
          </el-menu>
          <el-input v-model="input" placeholder="Search" clearable style="margin-top: 10px;"/>
          <div v-for="item in 10" :key="item" style="display: flex; flex-direction: row; align-items: center;margin-bottom: 10px;margin-top: 10px;">
            <el-avatar :icon="UserFilled" />
            <span style="margin-left: 10px;">user {{ item }}</span>
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
  import { UserFilled } from '@element-plus/icons-vue'

  export default {
    name: 'ChatWindow',
    data() {
      return {
        newMessage: '',
        messages: [
          { id: 1, sender: 'Alice', text: 'Hello!' },
          { id: 2, sender: 'Bob', text: 'Hi Alice, how are you?' }
        ],
        UserFilled: UserFilled
      };
    },
    methods: {
      handleSelect(key) {
        if (key === '0') {
          this.$router.push('/profile');
        }
      },
      sendMessage() {
        if (this.newMessage.trim()) {
          this.messages.push({ id: Date.now(), sender: 'You', text: this.newMessage.trim() });
          this.newMessage = '';
        }
      }
    }
  }
  </script>
  
  <style>
  .chat-container {
    width: 100%;
    height: 100vh;
  }
  
  .chat-header {
    text-align: center;
    font-weight: bold;
    margin-bottom: 20px;
  }

  .flex-grow {
    display: flex;
    flex-grow: 1;
  }
  </style>
  