<template>
  <div class="container">
    <div class="main">
      
      <div class="loginbox">
        <div class="title1">Login</div>
          <form @submit.prevent="login" class="auth-form">
            <input v-model="username" class = "Username" placeholder="Username" />
            <input v-model="password" class = "Password" placeholder="Password" type="password" />
            <button>Log In</button>
            <p>Don't have an account? <router-link to="/signup">Create one</router-link></p>
          </form> 
         <div class="background">
            <div class="title2">Welcome to Crystal chat</div>
        </div>

      </div>
    </div>
  </div>
</template>


<script>

import { ref } from 'vue';
import { useRoute, useRouter } from 'vue-router';

export default {
  setup() {
    const route = useRoute();
    const router = useRouter();

    const username = ref('');
    const password = ref('');
    const user_list = ref([]); 

    const login = () => {
      let flag = 0;

      if (!route.query.list) {
        user_list.value.forEach((item) => {
          if (item.username === username.value) {
            if (item.password === password.value) {
              flag = 1;
            }
          }
        });

        if (flag === 1) {
          router.push('/ChatWindow');
        } else {
          alert('Username or password is wrong, please re-enter');
        }
      } else {
        const routerParams = JSON.parse(route.query.list);
        user_list.value = routerParams;

        user_list.value.forEach((item) => {
          if (item.username === username.value) {
            if (item.password === password.value) {
              flag = 1;
            }
          }
        });

        if (flag === 1) {
          router.push('/chat');
        } else {
          alert('Username or password is wrong, please re-enter');
        }
      }
    };

    return {
      username,
      password,
      login,
    };
  },
};
</script>


<style scoped>
.loginbox{
   display:flex;
   position:absolute;
   width:800px;
   height:400px;
   top:40%;
   left:50%;
   transform:translate(-50%,-50%);
   box-shadow: 0 12px 16px 0  rgba(0,0,0,0.24), 0 17px 50px 0 #4E655D;
}
.title1{
   margin-top:50px;
   margin-left: 50px;
   font-weight:bold;
   font-size:20px;
   color:#4E655D;
}
.auth-form{
   margin-top:120px ;
   height:30px;
    width:230px;
    /* display: flex; */
    margin-left:-70px;
}


.background{
   width:570px;
   background-image:url('../assets/Crystal_language_logo.png');
   background-size:  300px 126px;
   margin-top:120px ;
   margin-left:100px;
   background-repeat:no-repeat;
   font-family:sans-serif;
}
.title2{
   margin-top:200px;
   margin-left:20px;
   font-weight:bold;
   font-size:20px;
   color:#4E655D;
   
}
.title2:hover{
    font-size:21px;
    transition: all 0.4s ease-in-out;
    cursor: pointer;
}

input{
   outline-style: none ;
   border: 0;
   border-bottom:1px solid #E9E9E9;
   background-color:transparent;
   height:20px;
    font-family:sans-serif;
   font-size:15px;
   color:#445b53;
   font-weight:bold;
}

input:focus{
   border-bottom:2px solid #445b53;
   background-color:transparent;
    transition: all 0.2s ease-in;
    font-family:sans-serif;
   font-size:15px;
    color:#445b53;
    font-weight:bold;
    
}
input:hover{
   border-bottom:2px solid #445b53;
   background-color:transparent;
    transition: all 0.2s ease-in;
    font-family:sans-serif;
   font-size:15px;
    color:#445b53;
    font-weight:bold;
    
}

input:-webkit-autofill {

box-shadow: 0 0 0px 1000px  #89AB9E inset !important;

-webkit-text-fill-color: #445b53;
} 

input:-webkit-autofill::first-line {

font-size: 15px;

font-weight:bold;
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
 box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
   cursor: pointer;
    background-color: #0b5137;
     transition: all 0.2s ease-in;
}

 </style>