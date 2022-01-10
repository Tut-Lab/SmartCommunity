import Vue from 'vue'

import Cookies from 'js-cookie'

// element注释不用 begin
import Element from 'element-ui'
import './assets/styles/element-variables.scss'
import '@/assets/styles/index.scss' // global css
import '@/assets/styles/ruoyi.scss' // ruoyi css
Vue.use(Element, {
  size: Cookies.get('size') || 'medium' // set element-ui default size
})
// element注释不用 end



// 引入DataV begin 
// 引入全局css
import './assets/scss/style.scss';
// 按需引入vue-awesome图标
import Icon from 'vue-awesome/components/Icon';
import 'vue-awesome/icons/chart-bar.js';
import 'vue-awesome/icons/chart-area.js';
import 'vue-awesome/icons/chart-pie.js';
import 'vue-awesome/icons/chart-line.js';
import 'vue-awesome/icons/align-left.js';
import dataV from '@jiaminghi/data-view'
Vue.component('icon', Icon);
Vue.use(dataV)
// 引入echart
import echarts from 'echarts'
Vue.prototype.$echarts = echarts

// 引入DataV end

import App from './App'
import store from './store'
import router from './router'
import directive from './directive' //directive
import plugins from './plugins' // plugins
import { download } from '@/utils/request'

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
Vue.use(plugins)

/**
 * If you don't want to use mock-server
 * you want to use MockJs for mock api
 * you can execute: mockXHR()
 *
 * Currently MockJs will be used in the production environment,
 * please remove it before going online! ! !
 */
Vue.config.productionTip = false

new Vue({
  el: '#app',
  router,
  store,
  render: h => h(App)
})
