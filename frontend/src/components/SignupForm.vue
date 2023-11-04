<template>
  <div class="auth-container">
    <img src="@/assets/Crystal_language_logo.png" alt="Crystal Language Logo" class="auth-logo">
    <h1 class="auth-title">WebChat</h1>
    <form @submit.prevent="signup" class="auth-form">
      <input v-model="username" placeholder="Username" required />
      <input v-model="email" placeholder="Email" required type="email" />
      <input v-model="password" placeholder="Password" required type="password" />
      <button :disabled="!isValid">Sign Up</button>
    </form>
  </div>
</template>

<script>
import { ref, computed } from 'vue';
import { useRouter } from 'vue-router';

export default {
  setup() {
    const router = useRouter();
    const username = ref('');
    const email = ref('');
    const password = ref('');

    // Define and initialize user_list
    const user_list = ref([]);

    const isValid = computed(() => {
      const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
      return (
        username.value && email.value &&
        passwordRegex.test(password.value)
      );
    });

    const signup = () => {
      if (isValid.value) {
        const usernameExists = user_list.value.some(user => user.username === username.value);
    if (usernameExists) {
      alert('The username already exists');
    }
      else{
        const item = {};

        item.username = username.value;
        item.email = email.value;
        item.password = password.value;

        user_list.value.push(item);
        alert('Register successfully');

        router.push({
          path: '/login',
          query: {
            list: JSON.stringify(user_list.value),
    },
  });

      }

      }
    };

    return {
      username,
      email,
      password,
      isValid,
      signup,
      user_list,
    };
  },
};
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