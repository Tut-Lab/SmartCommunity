<template>
  <van-tabbar route v-model="active" :safe-area-inset-bottom="true">
    <van-tabbar-item icon="wap-home" replace to="/index">首页</van-tabbar-item>
    <van-tabbar-item icon="location" replace to="/mapDemo"
      >地图</van-tabbar-item
    >
    <van-tabbar-item icon="manager" replace to="/personCenter">
      个人中心
    </van-tabbar-item>
  </van-tabbar>
</template>
<script>
import { Tabbar, TabbarItem } from "vant";

// ..
export default {
  name: "FooterTabbar",
  components: {
    [Tabbar.name]: Tabbar,
    [TabbarItem.name]: TabbarItem,
  },
  data() {
    return {
      active: 0,
    };
  },
};
</script>
