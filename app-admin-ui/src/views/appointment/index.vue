
<template>
  <div>
    <el-form ref="elForm" :model="formData" :rules="rules" size="medium" label-width="100px">
      <el-form-item label="日期选择" prop="field103">
        <el-date-picker v-model="formData.field103" format="yyyy-MM-dd" value-format="yyyy-MM-dd"
          :style="{width: '100%'}" placeholder="请选择日期选择" clearable></el-date-picker>
      </el-form-item>
      <el-form-item label="预约时间" prop="field102">
        <el-time-picker v-model="formData.field102" format="HH:mm:ss" value-format="HH:mm:ss"
          :picker-options='{"selectableRange":"00:00:00-23:59:59"}' :style="{width: '100%'}"
          placeholder="请选择预约时间" clearable></el-time-picker>
      </el-form-item>
      <el-form-item label="预约事项" prop="field104">
        <el-input v-model="formData.field104" placeholder="请输入预约事项" clearable :style="{width: '100%'}">
        </el-input>
      </el-form-item>
      <el-form-item label="居住地址" prop="field105">
        <el-input v-model="formData.field105" placeholder="请输入居住地址" clearable :style="{width: '100%'}">
        </el-input>
      </el-form-item>
      <el-form-item label="手机号" prop="mobile">
        <el-input v-model="formData.mobile" placeholder="请输入手机号" :maxlength="11" show-word-limit clearable
          prefix-icon='el-icon-mobile' :style="{width: '100%'}"></el-input>
      </el-form-item>
      <el-form-item label="按钮" prop="field107">
        <el-button type="primary" icon="el-icon-search" size="medium"> 主要按钮 </el-button>
      </el-form-item>
      <el-form-item size="large">
        <el-button type="primary" @click="submitForm">提交</el-button>
        <el-button @click="resetForm">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import { listYuyue, getYuyue, delYuyue, addYuyue, updateYuyue } from "@/api/system/yuyue";
export default {
  components: {},
  props: [],
  data() {
    return {
      formData: {
        field103: '2024-04-06',
        field102: '16:06:12',
        content: undefined,
        address: undefined,
        phonenumber: '',
        field107: undefined,
      },
      rules: {
        field103: [{
          required: true,
          message: '请选择日期选择',
          trigger: 'change'
        }],
        field102: [{
          required: true,
          message: '请选择预约时间',
          trigger: 'change'
        }],
        field104: [{
          required: true,
          message: '请输入预约事项',
          trigger: 'blur'
        }],
        field105: [{
          required: true,
          message: '请输入居住地址',
          trigger: 'blur'
        }],
        mobile: [{
          required: true,
          message: '请输入手机号',
          trigger: 'blur'
        }, {
          pattern: /^1(3|4|5|7|8|9)\d{9}$/,
          message: '手机号格式错误',
          trigger: 'blur'
        }],
      },
    }
  },
  computed: {},
  watch: {},
  created() {},
  mounted() {},
  methods: {
  submitForm() {
    this.$refs['elForm'].validate(valid => {
      if (!valid) return

      // 提交表单
      addYuyue(this.formData)
        .then(response => {
          // 处理提交成功后的逻辑，可以根据后端返回的数据进行处理
          console.log('提交成功', response)
        })
        .catch(error => {
          // 处理提交失败后的逻辑，可以根据错误信息进行处理
          console.error('提交失败', error)
        })
    })
  },
  resetForm() {
    this.$refs['elForm'].resetFields()
    },
  }
}

</script>
<style>
</style>
