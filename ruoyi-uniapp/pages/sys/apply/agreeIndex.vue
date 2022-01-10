<template>
	<view>
		<!-- <cu-custom bgColor="bg-gradual-pink" :isBack="true">
			<block slot="backText">返回</block>
			<block slot="content">表单</block>
		</cu-custom> -->
		<form>
			<view class="cu-form-group margin-top">
				<view class="title">设置备注</view>
			</view>
			<view class="cu-form-group ">
				<input placeholder="" name="input" @input="remark" :value="form.myRemarkContent"></input>
			</view>
			
			<view class="padding flex flex-direction">
				<button class="cu-btn bg-blue margin-tb-sm lg" @click="submit()">完成</button>
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
					applyId: '',
					myRemarkContent: '',
					applyState: 2
				}
			};
		},
		onLoad(option) {
			this.form.applyId = option.applyId;
			// this.getInfo();
		},
		methods: {
			remark(e)
			{
				this.form.myRemarkContent = e.detail.value;
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
				console.log(this.form)
				this.$u.api.im.finishAddFriend(this.form).then(res => {
					if (res.code == '200'){
						this.$u.toast('验证完成');
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
