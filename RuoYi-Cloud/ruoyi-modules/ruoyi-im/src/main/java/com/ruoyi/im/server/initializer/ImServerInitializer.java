package com.ruoyi.im.server.initializer;

import com.ruoyi.im.server.handler.*;
import com.ruoyi.im.server.handler.websocket.WebSocketBindServerSessionHandler;
import io.netty.channel.ChannelInitializer;
import io.netty.channel.ChannelPipeline;
import io.netty.channel.socket.SocketChannel;
import io.netty.handler.codec.http.HttpObjectAggregator;
import io.netty.handler.codec.http.HttpServerCodec;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;
import io.netty.handler.stream.ChunkedWriteHandler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ImServerInitializer extends ChannelInitializer<SocketChannel> {

//    @Autowired
//    private  LoginRequestHandler loginRequestHandler;

    @Autowired
    private WebSocketBindServerSessionHandler webSocketBindServerSessionHandler;


//    @Autowired
//    private NoticeServerHandler noticeServerHandler ;

    @Autowired
    private ConnectedStatusChangetHandler connectedStatusChangetHandler ;

    @Override
    protected void initChannel(SocketChannel ch) throws Exception {

//        ChannelPipeline pipeline = ch.pipeline();
//        // 解决半包 粘包问题
//        pipeline.addLast(new DelimiterBasedFrameDecoder(4096, Delimiters.lineDelimiter()));
//        // 解码器
//        pipeline.addLast(new StringDecoder(CharsetUtil.UTF_8));
//        // 编码器
//        pipeline.addLast("encoder",new StringEncoder(CharsetUtil.UTF_8));
//        // 下线操作
//        pipeline.addLast("connectedStatusChange",connectedStatusChangetHandler);
//        //
//        pipeline.addLast("login",loginRequestHandler);
//        //
//        pipeline.addLast("notice",noticeServerHandler);


        //==============================================================================

        ChannelPipeline pipeline = ch.pipeline();
        pipeline.addLast(new HttpServerCodec());
        //http是以块方式写，添加ChunkedWriteHandler处理器
        pipeline.addLast(new ChunkedWriteHandler());
        /*
        说明
        1. http数据在传输过程中是分段, HttpObjectAggregator ，就是可以将多个段聚合
        2. 这就就是为什么，当浏览器发送大量数据时，就会发出多次http请求
         */
        pipeline.addLast(new HttpObjectAggregator(8192));
         /*
        说明
        1. 对应websocket ，它的数据是以 帧(frame) 形式传递
        2. 可以看到WebSocketFrame 下面有六个子类
        3. 浏览器请求时 ws://localhost:7000/hello 表示请求的uri
        4. WebSocketServerProtocolHandler 核心功能是将 http协议升级为 ws协议 , 保持长连接
        5. 是通过一个 状态码 101
         */
        pipeline.addLast("ws", new WebSocketServerProtocolHandler("/ws", null, true, 65536 * 10));

        //下线操作
        pipeline.addLast("connectedStatusChange",connectedStatusChangetHandler);
        //自定义的handler ，处理业务逻辑
        pipeline.addLast("bindServerSession",webSocketBindServerSessionHandler);
        // 下线操作
//        //
//        pipeline.addLast("login",loginRequestHandler);
//        //
//        pipeline.addLast("notice",noticeServerHandler);

    }
}
