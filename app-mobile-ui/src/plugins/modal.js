// import { Message, MessageBox, Notification, Loading } from 'element-ui'
import { Notify, Dialog, Loading } from 'vant'
let loadingInstance;

export default {
  // 消息提示
  msg(content) {
    // Message.info(content)
    Notify({ type: 'primary', message: content })
  },
  // 错误消息
  msgError(content) {
    // Message.error(content)
    Notify({ type: 'danger', message: content })
  },
  // 成功消息
  msgSuccess(content) {
    // Message.success(content)
    Notify({ type: 'success', message: content })
  },
  // 警告消息
  msgWarning(content) {
    // Message.warning(content)
    Notify({ type: 'warning', message: content })
  },
  // 弹出提示
  alert(content) {
    // MessageBox.alert(content, "系统提示")
    Dialog.alert({title: '系统提示',message: content}).then(() => {});
  },
  // 错误提示
  alertError(content) {
    // MessageBox.alert(content, "系统提示", { type: 'error' })
    Dialog.alert({title: '系统提示',message: content}).then(() => {});
  },
  // 成功提示
  alertSuccess(content) {
    // MessageBox.alert(content, "系统提示", { type: 'success' })
    Dialog.alert({title: '系统提示',message: content}).then(() => {});
  },
  // 警告提示
  alertWarning(content) {
    // MessageBox.alert(content, "系统提示", { type: 'warning' })
    Dialog.alert({title: '系统提示',message: content}).then(() => {});
  },
  // 通知提示
  notify(content) {
    // Notification.info(content)
    Notify({ type: 'primary', message: content })
  },
  // 错误通知
  notifyError(content) {
    // Notification.error(content);
    Notify({ type: 'danger', message: content })
  },
  // 成功通知
  notifySuccess(content) {
    // Notification.success(content)
    Notify({ type: 'success', message: content })
  },
  // 警告通知
  notifyWarning(content) {
    // Notification.warning(content)
    Notify({ type: 'warning', message: content })
  },
  // 确认窗体
  confirm(content) {
    return Dialog.confirm({title: '系统提示', message: content}).then(() => {}).catch(() => {});
    // return MessageBox.confirm(content, "系统提示", {
    //   confirmButtonText: '确定',
    //   cancelButtonText: '取消',
    //   type: "warning",
    // })
  },
  // 打开遮罩层
  loading(content) {
    // loadingInstance = Loading.service({
    //   lock: true,
    //   text: content,
    //   spinner: "el-icon-loading",
    //   background: "rgba(0, 0, 0, 0.7)",
    // })
  },
  // 关闭遮罩层
  closeLoading() {
    // loadingInstance.close();
  }
}
