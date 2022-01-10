/**
 * Copyright (c) 2013-Now http://aidex.vip All rights reserved.
 */
// 此处第二个参数vm，就是我们在页面使用的this，你可以通过vm获取vuex等操作
const install = (Vue, vm) => {
	
	// 参数配置对象
	const config = vm.vuex_config;
	
	// 将各个定义的接口名称，统一放进对象挂载到vm.$u.api(因为vm就是this，也即this.$u.api)下
	vm.$u.api = {
		
		// 基础服务：登录登出、身份信息、菜单授权、切换系统、字典数据等
		lang: (params = {}) => vm.$u.get('/lang/'+params.lang),
		index: (params = {}) => vm.$u.get(config.adminPath+'/mobile/index', params),
		getUserInfo: (params = {}) => vm.$u.get(config.adminPath+'/mobile/user/getUserInfo', params),
		// login: (params = {}) => vm.$u.post(config.adminPath+'/mobile/login/loginByPassword', params),
		login: (params = {}) => vm.$u.post(config.adminPath+'/auth/signByPassword', params),
		sendCode: (params = {}) => vm.$u.post(config.adminPath+'/mobile/login/sendCode', params),
		registerUser: (params = {}) => vm.$u.post(config.adminPath+'/mobile/user/registerUser', params),
		//首页相关api
		getIndexCardInfo: (params = {}) => vm.$u.get(config.adminPath+'/mobile/index/getIndexCardInfo', params),
		getM2mOrderFlowList: (params = {}) => vm.$u.get(config.adminPath+'/mobile/index/getM2mOrderFlowList', params),
		//获取卡可购买套餐包
		getM2mOrderPackageList: (params = {}) => vm.$u.get(config.adminPath+'/mobile/index/getM2mOrderPackageList', params),
		
		// logout: (params = {}) => vm.$u.get(config.adminPath+'/mobile/login/logout', params),
		logout: (params = {}) => vm.$u.delete(config.adminPath+'/auth/logout', params),
		authInfo: (params = {}) => vm.$u.get(config.adminPath+'/authInfo', params),
		menuTree: (params = {}) => vm.$u.get(config.adminPath+'/menuTree', params),
		switchSys: (params = {}) => vm.$u.get(config.adminPath+'/switch/'+params.sysCode),
		dictData: (params = {}) => vm.$u.get(config.adminPath+'/system/dict/data/type/'+params.dictType),
		
		// 账号服务：验证码接口、忘记密码接口、注册账号接口等
		validCode: (params = {}) => vm.$u.getText('/validCode', params),
		getFpValidCode: (params = {}) => vm.$u.post('/account/getFpValidCode', params),
		savePwdByValidCode: (params = {}) => vm.$u.post('/account/savePwdByValidCode', params),
		getRegValidCode: (params = {}) => vm.$u.post('/account/getRegValidCode', params),
		saveRegByValidCode: (params = {}) => vm.$u.post('/account/saveRegByValidCode', params),
		
		// APP公共服务
		upgradeCheck: () => vm.$u.post('/app/upgrade/check', {appCode: config.appCode, appVersion: config.appVersion}),
		commentSave: (params = {}) => vm.$u.post('/app/comment/save', params),
		
		// 个人信息修改
		user: {
			saveUserInfo: (params = {}) => vm.$u.post(config.adminPath+'/mobile/user/saveUserInfo', params),
			infoSavePwd: (params = {}) => vm.$u.put(config.adminPath+'/system/user/profile/updatePwd', params),
			infoSavePqa: (params = {}) => vm.$u.post(config.adminPath+'/sys/user/infoSavePqa', params),
		},
		
		// 员工用户查询
		empUser: {
			listData: (params = {}) => vm.$u.get(config.adminPath+'/sys/empUser/listData', params),
		},
		
		// 组织机构查询
		office: {
			treeData: (params = {}) => vm.$u.get(config.adminPath+'/sys/office/treeData', params),
		},
		
		// im即时通讯接口
		im: {
			// 获取好友列表
			// getFriend: (params = {}) => vm.$u.get(config.adminPath+'/im/friend/list', params),
			// 查找用户
			searchUser: (params = {}) => vm.$u.get(config.adminPath+'/system/user/list', params),
			// 根据id查询用户
			searchUserByUserId: (params = {}) => vm.$u.get(config.adminPath+'/system/user/' + params.userId, params),
			// 获取用户本人信息
			getInfo: (params = {}) => vm.$u.get(config.adminPath+'/system/user/getInfo', params),
			// 好友申请
			applyFriend: (params = {}) => vm.$u.post(config.adminPath+'/im/apply', params),
			// 获取请求添加列表
			getApplyList: (params = {}) => vm.$u.get(config.adminPath+'/im/apply/getApplyList', params),
			// 获取请求列表根据请求对象
			
			//完成好友添加
			finishAddFriend: (params = {}) => vm.$u.put(config.adminPath+'/im/apply/finishAddFriend', params),
			// 好友列表
			getFriendList: (params = {}) => vm.$u.get(config.adminPath+'/im/friend/friendList', params),
			// 创建聊天列表
			addChatInfo: (params = {}) => vm.$u.post(config.adminPath+'/im/info', params),
			
			// 存储聊天记录 发送消息
			addChatDetailInfo: (params = {}) => vm.$u.post(config.adminPath+'/im/detail', params),
			// 获取好友
			getfriend: (params = {}) => vm.$u.get(config.adminPath+'/im/friend/getFriendInfo/' + params.friendId, params),
			// socket发送
			socketSend: (params = {}) => vm.$u.post(config.adminPath+'/im/chat/chatAction', params),
		},
		
		
		// 增删改查例子
		testData: {
			form: (params = {}) => vm.$u.post(config.adminPath+'/test/testData/form', params),
			list: (params = {}) => vm.$u.post(config.adminPath+'/test/testData/listData', params),
			save: (params = {}) => vm.$u.postJson(config.adminPath+'/test/testData/save', params),
			disable: (params = {}) => vm.$u.post(config.adminPath+'/test/testData/disable', params),
			enable: (params = {}) => vm.$u.post(config.adminPath+'/test/testData/enable', params),
			delete: (params = {}) => vm.$u.post(config.adminPath+'/test/testData/delete', params),
		},
		
	};
	
}

export default {
	install
}