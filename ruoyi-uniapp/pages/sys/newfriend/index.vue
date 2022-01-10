<template>
	<view>
		<view class="cu-bar bg-white search fixed" :style="[{top:CustomBar + 'px'}]">
			<view class="search-form round">
				<text class="cuIcon-search"></text>
				<input type="text" placeholder="输入搜索的关键词" confirm-type="search"></input>
			</view>
		</view>
		<view class="cu-bar bg-white solid-bottom margin-top margin-bottom" @click="navTo('/pages/sys/addfriend/index')">
			<view class="action">
				<button class="cu-btn content btn-container" open-type="contact">
					<text class="cuIcon-btn text-olive"></text>
					<text class="text-grey">添加朋友</text>
				</button>
			</view>
		</view>
		<view class="cu-list menu-avatar">
			<view class="cu-item" :class="modalName=='move-box-'+ index?'move-cur':''" v-for="(item,index) in applyList" :key="index"
			 @touchstart="ListTouchStart" @touchmove="ListTouchMove" @touchend="ListTouchEnd" :data-target="'move-box-' + index" @click="navTo('/pages/sys/apply/personal-details?userId=' + item.reqUserId + '&applyId=' + item.applyId)">
				<view class="cu-avatar round lg" :style="[{backgroundImage:'url(https://ossweb-img.qq.com/images/lol/web201310/skin/big2100'+ (index+2) +'.jpg)'}]"></view>
				<view class="content">
					<view class="text-grey">{{item.sysUser.nickName}}</view>
					<view class="text-gray text-sm">
						<text class="text-red  margin-right-xs"></text>{{item.applyContent}}</view>
				</view>
				<view class="action">
					<view class="text-grey text-xs">{{item.applyState == 1 ? '查看' : (item.applyState == 2 ? '已同意' : '未同意')}}</view>
				</view>
				<view class="move">
					<!-- <view class="bg-grey">置顶</view> -->
					<view class="bg-red">删除</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				modalName: null,
				listTouchStart: 0,
				applyList: []
			};
		},
		onLoad() {
			this.getApplyList()
		},
		onReady() {
			
		},
		methods: {
			// ListTouch计算滚动
			ListTouchEnd(e) {
				if (this.listTouchDirection == 'left') {
					this.modalName = e.currentTarget.dataset.target
				} else {
					this.modalName = null
				}
				this.listTouchDirection = null
			},
			// ListTouch计算方向
			ListTouchMove(e) {
				this.listTouchDirection = e.touches[0].pageX - this.listTouchStart > 0 ? 'right' : 'left'
			},
			// ListTouch触摸开始
			ListTouchStart(e) {
				this.listTouchStart = e.touches[0].pageX
			},
			// 跳转
			navTo(url) {
				uni.navigateTo({
					url: url
				});
				// uni.navigateBack()
			},
			// 获取请求列表
			getApplyList()
			{
				this.$u.api.im.getApplyList({}).then(res => {
					if (res.code == '200'){
						console.log(res)
						this.applyList = res.data
					}
				});
			}
		}
	}
</script>

<style scoped>
	page {
		padding-top: 100upx;
	}

	.indexes {
		position: relative;
	}

	.indexBar {
		position: fixed;
		right: 0px;
		bottom: 0px;
		padding: 20upx 20upx 20upx 60upx;
		display: flex;
		align-items: center;
	}

	.indexBar .indexBar-box {
		width: 40upx;
		height: auto;
		background: #fff;
		display: flex;
		flex-direction: column;
		box-shadow: 0 0 20upx rgba(0, 0, 0, 0.1);
		border-radius: 10upx;
	}

	.indexBar-item {
		flex: 1;
		width: 40upx;
		height: 40upx;
		display: flex;
		align-items: center;
		justify-content: center;
		font-size: 24upx;
		color: #888;
	}

	movable-view.indexBar-item {
		width: 40upx;
		height: 40upx;
		z-index: 9;
		position: relative;
	}

	movable-view.indexBar-item::before {
		content: "";
		display: block;
		position: absolute;
		left: 0;
		top: 10upx;
		height: 20upx;
		width: 4upx;
		background-color: #f37b1d;
	}

	.indexToast {
		position: fixed;
		top: 0;
		right: 80upx;
		bottom: 0;
		background: rgba(0, 0, 0, 0.5);
		width: 100upx;
		height: 100upx;
		border-radius: 10upx;
		margin: auto;
		color: #fff;
		line-height: 100upx;
		text-align: center;
		font-size: 48upx;
	}
	.btn-container{
		background-color:#F4F5F6
	}
	
	
	.btn-container {
	    background-color: rgba(0,0,0,0);
	}
</style>
