import Vue from 'vue'

import Cookies from 'js-cookie'

// import Element from 'element-ui'

// import './assets/styles/element-variables.scss'
import Vant from 'vant';
import 'vant/lib/index.css';

import '@/assets/styles/index.scss' // global css
import '@/assets/styles/ruoyi.scss' // ruoyi css

// vant ui begin
// 初始化样式
// import "@/assets/css/reset.css";
// // 设置html根字体大小
// import "@/assets/css/font_html.css";
// 导入vant css(由于采用配置主题方式，这里需要导入vant less 主题文件,如果不需要自定义主题注释下面代码，然后解除config/cdn.js 中vant主题样式的注释)

// 初始化样式
import "@/assets/css/reset.css";

// rem 适配js
// import 'amfe-flexible'

// 设置html根字体大小
import "@/assets/css/font_html.css";

Vue.use(Vant);
// vant ui end

import App from './App'
import store from './store'
import router from './router'
import directive from './directive' //directive
import plugins from './plugins' // plugins
import { download } from '@/utils/request'
// 注册自定义全局组件
import components from "@/utils/components";

import './assets/icons' // icon
import './permission' // permission control
import { parseTime, resetForm, addDateRange, selectDictLabel, selectDictLabels, handleTree } from "@/utils/ruoyi";

// 全局方法挂载
Vue.prototype.parseTime = parseTime
Vue.prototype.resetForm = resetForm
Vue.prototype.addDateRange = addDateRange
Vue.prototype.selectDictLabel = selectDictLabel
Vue.prototype.selectDictLabels = selectDictLabels
Vue.prototype.download = download
Vue.prototype.handleTree = handleTree


Vue.use(directive)
Vue.use(plugins).use(components)


/**
 * If you don't want to use mock-server
 * you want to use MockJs for mock api
 * you can execute: mockXHR()
 *
 * Currently MockJs will be used in the production environment,
 * please remove it before going online! ! !
 */

// Vue.use(Element, {
//   size: Cookies.get('size') || 'medium' // set element-ui default size
// })

Vue.config.productionTip = false

new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
