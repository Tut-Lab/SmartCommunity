<template>
	<view id="w-container">
		<cu-custom class="cu-container" bgColor="bg-gradual-pink" :isBack="true">
			<block slot="backText" @click="back()">返回</block>
			<block slot="content">{{friendName}}</block>
		</cu-custom>
		
		
	
		<!-- <scroll-view id="scrollview" class="chat-window" scroll-y="true" :style="{height: style.contentViewHeight + 'px'}" :scroll-with-animation="true" :scroll-top="scrollTop"> -->
		
		<view class="cu-chat" v-for="(item,index) in chatList" :key="index">
			
			
			<view class="cu-item" :class="item.self == 1 ? 'self' : ''">
				<view v-if="item.self == 2" class="cu-avatar radius"
					style="background-image:url(https://ossweb-img.qq.com/images/lol/web201310/skin/big143004.jpg);">
				</view>
				<view class="main">
					<view class="content bg-green shadow">
						<text>{{ item.content }}</text>
					</view>
				</view>
				<view v-if="item.self == 1" class="cu-avatar radius"
					style="background-image:url(https://ossweb-img.qq.com/images/lol/web201310/skin/big107000.jpg);">
				</view>
				<view class="date">{{ item.sendTime }}</view>
			</view>
			<!-- <view class="cu-info round">对方撤回一条消息!</view> -->

			<!-- <view class="cu-item">
				<view class="cu-avatar radius" style="background-image:url(https://ossweb-img.qq.com/images/lol/web201310/skin/big143004.jpg);"></view>
				<view class="main">
					<view class="content shadow">
						<text>{{ item.content}}</text>
					</view>
				</view>
				<view class="date ">13:23:55</view><!-- 2018年3月23日 13:23:55 
			</view> -->

			<!-- <view class="cu-info">
				<text class="cuIcon-roundclosefill text-red "></text> 对方拒绝了你的消息
			</view>
			
			<view class="cu-info">
				对方开启了好友验证，你还不是他(她)的好友。请先发送好友验证请求，对方验证通过后，才能聊天。
				<text class="text-blue">发送好友验证</text>
			</view>
			
			<view class="cu-item self">
				<view class="main">
					<image src="https://ossweb-img.qq.com/images/lol/web201310/skin/big10006.jpg" class="radius" mode="widthFix"></image>
				</view>
				<view class="cu-avatar radius" style="background-image:url(https://ossweb-img.qq.com/images/lol/web201310/skin/big107000.jpg);"></view>
				<view class="date"> 13:23</view>
			</view>
			
			<view class="cu-item self">
				<view class="main">
					<view class="action text-bold text-grey">
						3"
					</view>
					<view class="content shadow">
						<text class="cuIcon-sound text-xxl padding-right-xl"> </text>
					</view>
				</view>
				<view class="cu-avatar radius" style="background-image:url(https://ossweb-img.qq.com/images/lol/web201310/skin/big107000.jpg);"></view>
				<view class="date">13:23</view>
			</view>
			
			<view class="cu-item self">
				<view class="main">
					<view class="action">
						<text class="cuIcon-locationfill text-orange text-xxl"></text>
					</view>
					<view class="content shadow">
						喵星球，喵喵市
					</view>
				</view>
				<view class="cu-avatar radius" style="background-image:url(https://ossweb-img.qq.com/images/lol/web201310/skin/big107000.jpg);"></view>
				<view class="date">13:23</view>
			</view>
			
			<view class="cu-item">
				<view class="cu-avatar radius" style="background-image:url(https://ossweb-img.qq.com/images/lol/web201310/skin/big143004.jpg);"></view>
				<view class="main">
					<view class="content shadow">
						@#$^&**
					</view>
					<view class="action text-grey">
						<text class="cuIcon-warnfill text-red text-xxl"></text> <text class="text-sm margin-left-sm">翻译错误</text>
					</view>
				</view>
				<view class="date">13:23</view>
			</view> -->

		</view>
		
		<!-- </scroll-view> -->

		<view class="cu-bar foot input" :style="[{bottom:InputBottom+'px'}]">
			<view class="action">
				<text class="cuIcon-sound text-grey"></text>
			</view>
			<input @input="onInput" class="solid-bottom" :adjust-position="false" :focus="false" maxlength="300"
				cursor-spacing="10" @focus="InputFocus" @blur="InputBlur" :value="msg"></input>
			<view class="action">
				<text class="cuIcon-emojifill text-grey"></text>
			</view>
			<button class="cu-btn bg-green shadow" @click="send()">发送</button>
		</view>

	</view>
</template>

<script>
	import {
		chatDetailGetStorage,
		chatListGetStorage,
		chatListSetStorage,
		chatDetailSetStorage,
		dateFormat
	} from '@/common/common.js';
	export default {
		data() {
			return {
				InputBottom: 0,
				// chatList: [{'userId':'f613572bd0324fc384a830f998c19ee3','type':'1','content':'我是猴猴','sendTime':'2021-12-14 11:16:36','self':'1'},
				// 		   {'userId':'1','type':'1','content':'我是若依','sendTime':'2021-12-14 11:18:55','self':'2'}],
				chatList: [],
				newChat: true,
				friendId: '',
				userId: '',
				friendName: '',
				chatId: '',
				msg: ''
			};
		},
		onReady() {
			//获取聊天列表容器对象
			this.getScroll();
		},
		onHide()
		{
			console.log(666);
			console.log(this);
		},
		onBackPress()
		{
			console.log(8888);
			console.log(this);
		},
		onLoad(option) {
			console.log(option)
			this.friendName = option.userName;
			this.friendId = option.friendId;
			if (this.$store.state.socketTask) {
				this.onSocketMessage(this.$store.state.socketTask);
			} else {
				this.$store.dispatch('WEBSOCKET_INIT', 'ws://172.16.2.73:18080/ws');
				this.onSocketMessage(this.$store.state.socketTask);
			}

			// 判断是否是新的聊天
			// 获取用户id
			let userId = uni.getStorageSync('userInfo').userId;
			this.userId = userId;
			if (!(chatListGetStorage(userId, this.friendId) == undefined || chatListGetStorage(userId, this.friendId) == null)) // 存在老的聊天记录
			{
				let chatInfo = chatListGetStorage(userId, this.friendId);
				// console.log(chatInfo)
				// 更改聊天状态
				this.newChat = false;
				// 回显聊天记录
				let chatList = chatDetailGetStorage(chatInfo.chatId);
				this.chatList = chatList;
			}
		},
		
		methods: {
			// 滚动条
			getScroll() {
				this.$nextTick(() => {window.scrollTo(0, (document.documentElement.scrollHeight) || (document.body.scrollHeight))});
			},
			onInput(e) {
				this.msg = e.detail.value.trim();
			},
			InputFocus(e) {
				this.InputBottom = e.detail.height
			},
			InputBlur(e) {
				this.InputBottom = 0
			},
			back(url) {
				uni.navigateBack();
			},
			onSocketMessage(socket) {
				socket.onMessage(res => {
					console.log('CHAT页面收到的消息：' + res.data);
					let socketObj = JSON.parse(res.data);
					if (socketObj.msgType != 'CHAT') return;
					let socketContent = socketObj.sendContent;
					// console.log(socketContent, 'socketContent')
					// console.log(socketContent.sendTime, '66');
					// console.log(dateFormat('YYYY-mm-dd HH:MM:SS',new Date(Number(socketContent.sendTime))))
					// {"content":"6666","msgType":"CHAT","sendContent":{"content":"1212","sendTime":1639496501000,"type":1},"success":true,"toUserId":"1","user":{"platform":"WEB","uid":"f613572bd0324fc384a830f998c19ee3"}}
					if (this.newChat) {
						// 创建新的聊天列表
						// {'userId':'','friendId':'','unread':'','state': 0,'hide': 0,'type':1}
						this.$u.api.im.addChatInfo({
							'userId': this.userId,
							'friendId': this.friendId,
							'unread': 0,
							'state': 0,
							'hide': 0,
							'type': 1
						}).then(res => {
							if (res.code == '200') {
								this.chatId = res.data.chatId;
								chatListSetStorage(res.data);
								// 发送消息
								let sendObj = {
									'chatId': this.chatId,
									'userId': this.userId,
									'content': socketContent.content,
									'sendTime': dateFormat('YYYY-mm-dd HH:MM:SS', new Date(Number(
										socketContent.sendTime))),
									'state': 0,
									'self': 2,
									'recall': 1,
									'type': socketContent.type
								};
								// console.log(sendObj);
								this.$u.api.im.addChatDetailInfo(sendObj).then(res => {
									if (res.code == '200') {
										chatDetailSetStorage(sendObj);
										// this.chatList = chatDetailGetStorage(this.chatId);
										this.chatList.push(sendObj);
										this.getScroll();
									}
								});
							}
						});
					} else {
						let chatInfo = chatListGetStorage(this.userId, this.friendId);
						let sendObj = {
							'chatId': chatInfo.chatId,
							'userId': this.userId,
							'content': socketContent.content,
							'sendTime': dateFormat('YYYY-mm-dd HH:MM:SS', new Date(Number(socketContent
								.sendTime))),
							'state': 0,
							'self': 2,
							'recall': 0,
							'type': socketContent.type
						};
						this.$u.api.im.addChatDetailInfo(sendObj).then(res => {
							if (res.code == '200') {
								chatDetailSetStorage(sendObj);
								// this.chatList = chatDetailGetStorage(this.chatId);
								this.chatList.push(sendObj);
								this.getScroll();
							}
						});
					}
				})
			},
			// 发送消息
			send() {
				if (this.msg.length == 0) {
					// this.$u.toast('登录成功');
					return;
				}
				let sendTime = dateFormat('YYYY-mm-dd HH:MM:SS', new Date());
				// socket发送内容
				let socketMsg = {
					"msgType": "CHAT",
					"user": {
						"uid": this.userId,
						"platform": "WEB"
					},
					"toUserId": this.friendId,
					"content": "6666",
					"sendContent": {
						"type": "1",
						"content": this.msg,
						"sendTime": sendTime
					}
				};
				this.$u.api.im.socketSend(socketMsg).then(res => {
					if (res.code == '200') {

					}
				});
				// 判断是不是新的聊天
				if (this.newChat) {
					// 创建新的聊天列表
					// {'userId':'','friendId':'','unread':'','state': 0,'hide': 0,'type':1}
					this.$u.api.im.addChatInfo({
						'userId': this.userId,
						'friendId': this.friendId,
						'unread': 0,
						'state': 0,
						'hide': 0,
						'type': 1
					}).then(res => {
						if (res.code == '200') {
							this.chatId = res.data.chatId;
							chatListSetStorage(res.data);
							// 发送消息
							let sendObj = {
								'chatId': this.chatId,
								'userId': this.userId,
								'content': this.msg,
								'sendTime': sendTime,
								'state': 0,
								'self': 1,
								'recall': 0,
								'type': 1
							};
							// console.log(sendObj);
							this.$u.api.im.addChatDetailInfo(sendObj).then(res => {
								if (res.code == '200') {
									chatDetailSetStorage(sendObj);
									// this.chatList = chatDetailGetStorage(this.chatId);
									this.chatList.push(sendObj);
									this.getScroll();
									this.msg = '';
								}
							});
						}
					});
				} else // 老的聊天记录
				{
					// 发送消息
					let chatInfo = chatListGetStorage(this.userId, this.friendId);
					let sendObj = {
						'chatId': chatInfo.chatId,
						'userId': this.userId,
						'content': this.msg,
						'sendTime': sendTime,
						'state': 0,
						'self': 1,
						'recall': 0,
						'type': 1
					};
					// console.log(sendObj);
					this.$u.api.im.addChatDetailInfo(sendObj).then(res => {
						if (res.code == '200') {
							chatDetailSetStorage(sendObj);
							// this.chatList = chatDetailGetStorage(this.chatId);
							this.chatList.push(sendObj);
							this.getScroll();
							this.msg = '';
						}
					});
				}
			}
		}
	}
</script>

<style scoped>
	page {
		padding-bottom: 100upx;
	}

	.cu-container {
		height: 0;
	}
</style>
