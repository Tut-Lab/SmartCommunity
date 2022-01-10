<template>
  <div class="layout-header-bar">
    <van-nav-bar
      :title="title"
      left-text="返回"
      left-arrow
      @click-left="onClickLeft"
    >
      <!-- <template #left>
        <div class="left-box">
          <van-icon
            name="arrow-left"
            size="15"
            class="left-box-icon"
          ></van-icon>
          <span>返回</span>
        </div>
      </template> -->
      <template #right>
        <slot name="right"></slot>
      </template>
    </van-nav-bar>
  </div>
</template>
<script>
import { NavBar, Toast } from "vant";
import $router from "@/router";
export default {
  name: "header-bar",
  components: {
    [NavBar.name]: NavBar,
  },
  props: {
    title: {
      type: String,
      default: "标题",
    },
  },

  data() {
    return {};
  },
  methods: {
    onClickLeft() {
      // this.$toast('返回');
      $router.go(-1);
    },
    onClickRight() {
      Toast("按钮");
    },
  },
};
</script>

<style scoped lang="scss">
.left-box {
  display: flex;
  height: 100%;
  width: 100%;
  align-items: center;
  font-size: 30px;
}
.left-box-icon {
  font-size: 20px;
}
</style>
