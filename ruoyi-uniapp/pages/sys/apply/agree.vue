<template>
	<view>
		<!-- <cu-custom bgColor="bg-gradual-pink" :isBack="true">
			<block slot="backText">返回</block>
			<block slot="content">表单</block>
		</cu-custom> -->
		<form>
			<view class="cu-form-group margin-top">
				<view class="title">发送添加朋友申请</view>
			</view>
			<view class="cu-form-group ">
				<textarea maxlength="-1" :disabled="modalName!=null" @input="textareaAInput" placeholder="填写好友申请"></textarea>
			</view>
			<view class="cu-form-group margin-top">
				<view class="title">设置备注</view>
			</view>
			<view class="cu-form-group ">
				<input placeholder="" name="input"></input>
			</view>
			
			<view class="padding flex flex-direction">
				<button class="cu-btn bg-blue margin-tb-sm lg">同意</button>
				<button class="cu-btn bg-red margin-tb-sm lg">拒绝</button>
			</view>
		
		</form>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				modalName: null,
			};
		},
		onLoad(option) {
			
		},
		methods: {
			textareaAInput(e) {
				this.textareaAValue = e.detail.value
			},
			getApplyById()
			{
				this.$u.api.im.searchUser({'userName': e.detail.value}).then(res => {
					if (res.code == '200'){
						this.userList = res.rows;
					}
				});
			}
		}
	}
</script>

<style>
	.cu-form-group .title {
		min-width: calc(4em + 15px);
	}
</style>
