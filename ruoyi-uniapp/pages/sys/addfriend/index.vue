<template>
	<view>
		<view class="cu-bar bg-white search fixed" :style="[{top:CustomBar + 'px'}]">
			<view class="search-form round">
				<text class="cuIcon-search"></text>
				<input @input="onInput" type="text" placeholder="输入账号 手机号搜索" confirm-type="search" value=""></input>
			</view>
		</view>
		<view class="cu-list menu-avatar margin-top">
			<view class="cu-item" :class="modalName=='move-box-'+ index?'move-cur':''" v-for="(item,index) in userList" :key="index" :data-target="'move-box-' + index" @click="navTo('/pages/sys/addfriend/personal-details?userId=' + item.userId)">
				<view class="cu-avatar round lg" :style="[{backgroundImage:'url(https://ossweb-img.qq.com/images/lol/web201310/skin/big2100'+ (index+2) +'.jpg)'}]"></view>
				<view class="content">
					<view class="text-grey">{{item.nickName}}</view>
					<!-- <view class="text-gray text-sm"></view> -->
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
				userList: []
			};
		},
		onLoad() {

		},
		onReady() {
			
		},
		methods: {
			// 跳转
			navTo(url) {
				uni.navigateTo({
					url: url
				});
				// uni.navigateBack()
			},
			onInput(e)
			{
				if(e.detail.value == '') return;
				this.$u.api.im.searchUser({'userName': e.detail.value}).then(res => {
					if (res.code == '200'){
						this.userList = res.rows;
					}
				});
			},
		}
	}
</script>

<style>
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
</style>
