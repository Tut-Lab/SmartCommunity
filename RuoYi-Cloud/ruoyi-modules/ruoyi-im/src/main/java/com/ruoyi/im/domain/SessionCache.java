package com.ruoyi.im.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.io.Serializable;

@Data
@AllArgsConstructor
public class SessionCache implements Serializable {
	//用户的id
	private String userId;
	//session id
	private String sessionId;

	//节点信息
	private ServerNode serverNode;

	public SessionCache()
	{
		userId = "";
		sessionId = "";
		serverNode = new ServerNode("unKnown", 0);
	}

}
