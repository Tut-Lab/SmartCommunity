<template>
  <div class="footer-wrapper">
    <div class="footer-view">
      <router-view></router-view>
    </div>
    <footer-bar></footer-bar>
  </div>
</template>

<script >
import FooterBar from "./FooterBar.vue";
export default {
  props: {},
  components: {
    FooterBar,
  },
};
</script>

<style scoped lang="scss">
.footer-view {
  height: calc(100vh - 100px);
  overflow: auto;
}
</style>
