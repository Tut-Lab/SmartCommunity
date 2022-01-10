<template>
	<view class="wrap">
		<view class="list-cell">
			<image class="user-images" src="/static/aidex/images/user06.png"></image>
			<view class="user-name">
				<span>{{userInfo.nickName}}</span><u-icon size="32" color="#f04d94" :name="sex"></u-icon><br>
				<!-- <span class="user-other">员工编号：8888 8888</span> -->
			</view>
		</view>
		<u-gap height="20" bg-color="#f5f5f5"></u-gap>
		<u-cell-group :border="false">
			<u-cell-item title="若依号" :value="userInfo.userName" icon="home" :title-width="180" :arrow="false"></u-cell-item>
			<u-cell-item title="所属部门" :value="userInfo.dept==null ? '暂无' : userInfo.dept.deptName" icon="file-text" :title-width="180" :arrow="false"></u-cell-item>
			<u-cell-item title="岗位" :value="posts[0] != null ? posts[0].postName : '待定'" icon="account" :title-width="180" :arrow="false"></u-cell-item>
			<u-cell-item title="手机" class="connect" :value="userInfo.phonenumber" icon="phone" :title-width="180" :arrow="false"></u-cell-item>
			<u-cell-item title="邮箱" class="connect" :value="userInfo.email" icon="email" :title-width="180" :arrow="false"></u-cell-item>
			<u-gap height="20" bg-color="#f5f5f5"></u-gap>
		</u-cell-group>
		<u-cell-group :border="false" class="textcenter">
			<u-cell-item value="前往验证" calss="u-cell-one" :title-width="0" center :arrow="false" @click="navTo('/pages/sys/apply/agreeIndex')"></u-cell-item>
		</u-cell-group>
	</view>
	
</template>
<script>
	 import HeadNavBar from '@/components/headnavbar/index';
/**
 * Copyright (c) 2013-Now http://aidex.vip All rights reserved.
 */
export default {
	components: {
	  HeadNavBar
	},
	data() {
		return {
			sex: 'man',
			userInfo: {},
			posts: [],
			userId: '',
			applyId: ''
		}
	},
	onLoad(option) {
		this.applyId = option.applyId;
		this.getUserInfo(option.userId);
	},
	methods: {
		navTo(url) {
			url = url + '?applyId=' + this.applyId;
			uni.navigateTo({
				url: url
			});
		},
		getUserInfo(userId){
			this.$u.api.im.searchUserByUserId({'userId': userId}).then(res => {
				if (res.code == '200'){
					// console.log(res)
					this.userInfo = res.data;
					this.posts = res.posts;
					this.userId = res.data.userId;
				}
			});
		}
	}
};
</script>
<style lang="scss" scoped>
@import 'index.scss';
page {
	background-color: #f5f5f5;
}
.list-cell {
	display: flex;
	box-sizing: border-box;
	width: 100%;
	padding: 10px 24rpx;
	overflow: hidden;
	color: #323233;
	font-size: 14px;
	line-height: 24px;
	background-color: #fff;
	align-items: center;
	
}
.user-images{
	width: 80rpx;
	height: 80rpx;
	margin-right: 10px;
}
.user-name{
	font-size: 32rpx;
	color: #000000;
	span{
	}
	.user-other{
		font-size: 26rpx;
		color: #999999;
		font-weight: normal;
	}
}

.u-cell-one{
	text-align: center;
}
/deep/ .textcenter .u-cell .u-cell__value{
	text-align: center;
	color: #505256;
}
</style>
