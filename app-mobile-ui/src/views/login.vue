<template>
  <div class="page">
    <van-row type="flex" justify="center">
      <van-image
        round
        width="30vw"
        height="30vw"
        src="https://img01.yzcdn.cn/vant/logo.png"
        style="margin: 10px 0px"
      />
    </van-row>
    <van-cell-group>
      <van-field
        v-model="loginForm.username"
        required
        clearable
        label="用户名"
        placeholder="请输入用户名"
      />

      <van-field
        v-model="loginForm.password"
        type="password"
        clearable
        label="密码"
        placeholder="请输入密码"
        required
      />
    </van-cell-group>
    <van-cell-group>
      <van-field
        v-model="loginForm.code"
        center
        clearable
        label="验证码"
        placeholder="请输入验证码"
        required
      >
        <template #button>
            <div>
                <img :src="codeUrl" @click="getCode" class="login-code-img"/>
            </div>
        </template>
      </van-field>
    </van-cell-group>
    <van-button
      color="linear-gradient(to right, #4bb0ff, #6149f6)"
      size="large"
      @click="handleLogin"
      :loading="loading"
      >登录</van-button
    >
  </div>
</template>
<script>
import { getCodeImg } from "@/api/login";
import Cookies from "js-cookie";
export default {
  data() {
    return {
      loginForm: {
        username: "admin",
        password: "admin123",
        rememberMe: false,
        code: "",
        uuid: "",
      },
      codeUrl: "",
      cookiePassword: "",
      loading: false,
    };
  },
  created() {
    this.getCode();
    this.getCookie();
  },
  methods: {
    getCode() {
      getCodeImg().then((res) => {
        this.captchaOnOff =
          res.captchaOnOff === undefined ? true : res.captchaOnOff;
        if (this.captchaOnOff) {
          this.codeUrl = "data:image/gif;base64," + res.img;
          this.loginForm.uuid = res.uuid;
        }
      });
    },

    getCookie() {
      const username = Cookies.get("username");
      const password = Cookies.get("password");
      const rememberMe = Cookies.get("rememberMe");
      this.loginForm = {
        username: username === undefined ? this.loginForm.username : username,
        password:
          password === undefined ? this.loginForm.password : decrypt(password),
        rememberMe: rememberMe === undefined ? false : Boolean(rememberMe),
      };
    },
    handleLogin() {
      this.loading = true;
      this.$store
        .dispatch("Login", this.loginForm)
        .then(() => {
          this.loading = false;
          this.$toast({
            message: "登录成功",
            position: "middle",
            duration: 500,
            onClose: () => {
              // this.$router.push("/home");
               this.$router.push({ path: "/" }).catch(()=>{});
            },
          });
        })
        .catch((error) => {
          this.loading = false;
          this.$toast(error.message);
          this.getCode();
        });
    },
  },
};
</script>

<style lang="scss" scoped>
.page {
  padding: 10px;
}
.login-code-img {
  height: 38px;
}
</style>
