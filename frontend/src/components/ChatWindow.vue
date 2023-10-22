
// it just a sample code, you can change it as you want
<template>
    <div class="chat-container">
      <div class="chat-header">Chat Room</div>
      <div class="chat-messages">
        <div v-for="message in messages" :key="message.id" class="chat-message">
          <strong>{{ message.sender }}:</strong> {{ message.text }}
        </div>
      </div>
      <div class="chat-input">
        <input v-model="newMessage" placeholder="Type your message" />
        <button @click="sendMessage">Send</button>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'ChatWindow',
    data() {
      return {
        newMessage: '',
        messages: [
          { id: 1, sender: 'Alice', text: 'Hello!' },
          { id: 2, sender: 'Bob', text: 'Hi Alice, how are you?' }
        ]
      };
    },
    methods: {
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
    width: 400px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
  }
  
  .chat-header {
    text-align: center;
    font-weight: bold;
    margin-bottom: 20px;
  }
  
  .chat-messages {
    max-height: 300px;
    overflow-y: auto;
    margin-bottom: 20px;
  }
  
  .chat-input {
    display: flex;
    justify-content: space-between;
  }
  
  .chat-input input {
    flex: 1;
    padding: 5px;
    margin-right: 10px;
  }
  </style>
  