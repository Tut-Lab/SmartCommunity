<template>
  <div>
    <div class="home">
      <SignCanvas ref="SignCanvas" :options="options" v-model="value" />
    </div>
    <div>
      <img class="view-image" :src="value" width="150" height="150" />
    </div>
    <div class="btn">
      <van-button type="primary" @click="canvasClear">清空</van-button>
      <van-button type="info" @click="rescind">撤销</van-button>
      <van-button type="danger" @click="downloadSignImg">下载</van-button>
      <van-button type="warning" @click="saveAsImg">保存</van-button>
    </div>
  </div>
</template>

<script >
import { Notify } from "vant";

import { Toast } from "vant";

// import SignCanvas from "../components/SignCanvas";
import SignCanvas from "sign-canvas";

export default {
  name: "home",
  components: { SignCanvas },
  data() {
    return {
      imgBase64: '',
      value: null,
      show: false,
      options: {
        isSign: true, //签名模式 [Boolean] 默认为非签名模式,有线框, 当设置为true的时候没有任何线框
        isShowBorder: true, //是否显示边框 [可选]
        canvasWidth: document.documentElement.clientWidth, //canvas宽高 [Number] 可选
        canvasHeight: document.documentElement.clientWidth / 2, //高度  [Number] 可选
      },
    };
  },
  mounted() {},
  methods: {
    test() {
      Notify({ type: "primary", message: "通知内容" });
    },


    // 撤销
    rescind() {
      this.$refs.SignCanvas.rescind();
    },

    // 清空
    canvasClear() {
      this.$refs.SignCanvas.canvasClear();
    },

    // 下载图片
    downloadSignImg() {
      this.$refs.SignCanvas.downloadSignImg();
    },

    // 保存图片
    saveAsImg() {
      const img = this.$refs.SignCanvas.saveAsImg();
      Toast(img);
    },
  },
};
</script>
<style lang="scss" scoped>
.home {
  margin: 0 auto;
  display: flex;
  justify-content: center;
}
.btn {
  margin: 0 auto;
  display: flex;
  justify-content: space-around;
}
.view-image {
  display: block;
  margin: 20px auto;
  border: 1px solid #999;
}
</style>
