<template>
  <div class="wrapper">
    <van-row type="flex" justify="center">
      <van-image
        round
        width="40vw"
        height="40vw"
        src="https://img01.yzcdn.cn/vant/logo.png"
        fit="cover"
      />
    </van-row>
    <van-row type="flex" justify="center">
      <p style="margin: 10px">欢迎您,{{ userInfo.name }}</p>
    </van-row>
    <van-row type="flex" justify="center">
      <van-button @click="logout" style="margin: 10px"
        >退出登录</van-button
      >
    </van-row>
  </div>
</template>

<script >
import { Dialog } from 'vant'
export default {
  components: {},
  data() {
    return {
      userInfo: {
        name: '里斯',
        avatar: ''
      }
    };
  },
  methods: {
    handleLogOut() {
      $store.dispatch("user/logout");
      $router.replace("/login");
    },
    async logout() {

      Dialog.confirm({title: '提示', message: '确定注销并退出系统吗？'}).then(() => {
         this.$store.dispatch('LogOut').then(() => {
          location.href = '/mobile';
        })
      }).catch(() => {

      })
      // this.$confirm('确定注销并退出系统吗？', '提示', {
      //   confirmButtonText: '确定',
      //   cancelButtonText: '取消',
      //   type: 'warning'
      // }).then(() => {
      //   this.$store.dispatch('LogOut').then(() => {
      //     location.href = '/';
      //   })
      // }).catch(() => {});
    }
  },
};
</script>

<style scoped lang="scss">
.wrapper {
  padding-top: 150px;
}
</style>
