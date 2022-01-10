<template>
  <div>
    <header-bar
      :title="$route.meta.title"
      v-if="!$route.meta.hideHeader"
    ></header-bar>
    <div class="content">
      <router-view></router-view>
    </div>
  </div>
</template>

<script>
import HeaderBar from "./HeaderBar.vue";
export default {
  props: {},
  components: {
    HeaderBar,
  },
};
</script>

<style scoped lang="scss">
.content {
}
</style>
