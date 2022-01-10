<template>
  <div class="loading-wrapper">
    <div
      class="loading-icon-wrapper"
      v-if="loading"
      :style="{ 'background-color': loadingBgColor }"
    >
      <van-loading size="40" color="#1989fa" />
    </div>
    <slot v-else></slot>
  </div>
</template>


<script>
export default {
  name: "BlockLoading",
  props: {
    loading: { type: Boolean, default: false },
    loadingBgColor: { type: String, default: "#f7f8fa" },
  },
};
</script>

<style lang="scss" scoped>
.loading-wrapper {
  position: relative;
  .loading-icon-wrapper {
    position: fixed;
    left: 0px;
    top: 0px;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
  }
}
</style>