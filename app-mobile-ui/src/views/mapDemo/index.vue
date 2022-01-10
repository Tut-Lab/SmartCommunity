<template>
  <div style="width: 100%; height: 100%">
    <div id="container"></div>
  </div>
</template>

<script>
import AMapLoader from "@amap/amap-jsapi-loader";
import { Toast } from "vant";

export default {
  data() {
    return {
      map: null,
    };
  },
  methods: {
    async load() {
      Toast.loading("地图加载中...");
      const AMap = await AMapLoader.load({
        key: "599dfe6bbe92b35d34d4e3d3f40aac6b", // 申请好的Web端开发者Key，首次调用 load 时必填
        version: "2.0", // 指定要加载的 JSAPI 的版本，缺省时默认为 1.4.15
        plugins: [
          "AMap.Scale",
          "AMap.OverView",
          "AMap.ToolBar",
          "AMap.MapType",
        ], // 需要使用的的插件列表，如比例尺'AMap.Scale'等
      });
      this.map = new AMap.Map("container");
      setTimeout(() => Toast.clear(), 1500);
    },
  },
  mounted() {
    this.$nextTick(() => {
      this.load();
    });
  },
  beforeDestroy() {
    Toast.clear();
  },
};
</script>

<style lang="scss" scoped>
#container {
  width: 100%;
  height: 100%;
}
</style>
