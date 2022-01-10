<template>
  <div class="home">
    <van-icon name="chat-o" />
    <van-button type="primary" v-hasPermi="['system:dept:add1']">主要按钮</van-button>
    <van-button type="info">信息按钮</van-button>
    <van-button type="default">默认按钮</van-button>
    <van-button type="warning">警告按钮</van-button>
    <van-button type="danger" @click="test">危险按钮</van-button>
  </div>
</template>

<script >
import { Notify } from 'vant';
export default {
  name: "home",
  data() {
    return {};
  },
  methods: {
    test()
    {
      Notify({ type: 'primary', message: '通知内容' });
    }
  },
};
</script>
<style lang="scss" scoped>
.home {
  line-height: 80px;
  text-align: center;
  padding: 5px 10px;
}
</style>
