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
				<textarea maxlength="-1" :disabled="modalName!=null" @input="textareaAInput" placeholder="" :value="form.applyContent"></textarea>
			</view>
			<view class="cu-form-group margin-top">
				<view class="title">设置备注</view>
			</view>
			<view class="cu-form-group ">
				<input placeholder="" name="input" @input="remark" :value="form.remarkContent"></input>
			</view>
			
			<view class="padding flex flex-direction">
				<button class="cu-btn bg-blue margin-tb-sm lg" @click="submit()">发送</button>
			</view>
		</form>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				modalName: null,
				form: {
					applyContent: '',
					remarkContent: '',
					reqUserId: null,
					resUserId: null,
					origin: 1,
					applyState: 1
				}
			};
		},
		onLoad(option) {
			this.form.resUserId = option.resUserId;
			this.getInfo();
		},
		methods: {
			textareaAInput(e) {
				// this.textareaAValue = e.detail.value
				this.form.applyContent = e.detail.value;
			},
			remark(e)
			{
				this.form.remarkContent = e.detail.value;
			},
			getInfo()
			{
				this.$u.api.im.getInfo({}).then(res => {
					if (res.code == '200'){
						this.form.applyContent = '您好，我是' + res.user.nickName;
						this.form.reqUserId = res.user.userId;
					}
				});
			},
			submit()
			{
				this.$u.api.im.applyFriend(this.form).then(res => {
					if (res.code == '200'){
						this.$u.toast('发送成功');
						setTimeout(() => {
							uni.navigateBack();
						}, 500);
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
