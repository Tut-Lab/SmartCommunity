/**
 * 通用js方法封装处理
 * Copyright (c) 2019 aidex
 */

export function replaceAll (text,stringToFind,stringToReplace) {
	   if ( stringToFind == stringToReplace) return this;
	          var temp = text;
	          var index = temp.indexOf(stringToFind);
	          while (index != -1) {
	              temp = temp.replace(stringToFind, stringToReplace);
	              index = temp.indexOf(stringToFind);
	          }
	return temp;
}



/**
 *  聊天记录本地存储
 */
export function chatListSetStorage(chatInfo)
{
	let chatInfoList = uni.getStorageSync('chatList') != '' ? uni.getStorageSync('chatList') : [];
	chatInfoList.push(chatInfo);
	uni.setStorageSync('chatList', chatInfoList);
}

export function chatListGetStorage(userId, friendId)
{
	// [{'userId':'','chatId':'','unread':'','hide':'',}]
	let chatInfoList = uni.getStorageSync('chatList') != '' ? uni.getStorageSync('chatList') : [];
	let chatInfo = chatInfoList.find(item => item.userId == userId && item.friendId == friendId);
	return chatInfo;
}


/**
 * 聊天详细内容
 */
export function chatDetailSetStorage(chatDetail)
{
	let chatDetailList = uni.getStorageSync('chatDetailList') != '' ? uni.getStorageSync('chatDetailList') : [];
	chatDetailList.push(chatDetail);
	uni.setStorageSync('chatDetailList', chatDetailList);
}

export function chatDetailGetStorage(chatId)
{
	// [{}]
	let chatDetailList = uni.getStorageSync('chatDetailList') != '' ? uni.getStorageSync('chatDetailList') : [];
	const result = chatDetailList.filter( res => res.chatId == chatId);
	return result;
}


/**
 * 日期格式化工具
 */

export function dateFormat(fmt, date) {
    let ret;
    const opt = {
        "Y+": date.getFullYear().toString(),        // 年
        "m+": (date.getMonth() + 1).toString(),     // 月
        "d+": date.getDate().toString(),            // 日
        "H+": date.getHours().toString(),           // 时
        "M+": date.getMinutes().toString(),         // 分
        "S+": date.getSeconds().toString()          // 秒
        // 有其他格式化字符需求可以继续添加，必须转化成字符串
    };
    for (let k in opt) {
        ret = new RegExp("(" + k + ")").exec(fmt);
        if (ret) {
            fmt = fmt.replace(ret[1], (ret[1].length == 1) ? (opt[k]) : (opt[k].padStart(ret[1].length, "0")))
        };
    };
    return fmt;
}