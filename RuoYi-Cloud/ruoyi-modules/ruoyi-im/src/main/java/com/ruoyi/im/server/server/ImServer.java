package com.ruoyi.im.server.server;

import java.net.InetSocketAddress;

import com.ruoyi.im.server.initializer.ImServerInitializer;
import io.netty.bootstrap.ServerBootstrap;
import io.netty.channel.ChannelFuture;
import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.nio.NioServerSocketChannel;
import io.netty.util.concurrent.Future;
import io.netty.util.concurrent.GenericFutureListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service("imServer")
//@Slf4j
public class ImServer {

    private static final Logger log = LoggerFactory.getLogger(ImServer.class);

    @Value("${chat.server.port}")
    private int PORT ;

    // 注册到zookeeper的路径
    private static final String MANAGE_PATH ="/im/nodes";

    public static final String PATH_PREFIX = MANAGE_PATH + "/seq-";
//
//    private ZkService zkService;

    private ImServerInitializer imServerInitializer;

    @Autowired
    ImServer(ImServerInitializer imServerInitializer ){
//        this.zkService = zkService;
        this.imServerInitializer = imServerInitializer ;
    }

    private EventLoopGroup bossGroup ;

    private EventLoopGroup workerGroup ;

    public void startImServer() {
        bossGroup = new NioEventLoopGroup();
        workerGroup = new NioEventLoopGroup();
        ServerBootstrap serverBootstrap = new ServerBootstrap();
        try {
            serverBootstrap.group(bossGroup, workerGroup)
            //2 设置nio类型的channel
            .channel(NioServerSocketChannel.class)
            // 3.设置处理器
            .childHandler(imServerInitializer)
            // 绑定端口
            .localAddress(new InetSocketAddress(PORT));

            // 通过调用sync同步方法阻塞直到绑定成功
            ChannelFuture channelFuture = serverBootstrap.bind().sync();

            log.info("IM 服务启动, 端口 " + channelFuture.channel().localAddress());

            channelFuture.addListener(new GenericFutureListener<Future<? super Void>>() {
                @Override
                public void operationComplete(Future<? super Void> future) throws Exception {
                    if (future.isSuccess()) {
//                        log.error("服务端启动成功");
                        System.out.println("(♥◠‿◠)ﾉﾞ  IM服务模块启动成功   ლ(´ڡ`ლ)ﾞ  \n" +
                                " .-------.       ____     __        \n" +
                                " |  _ _   \\      \\   \\   /  /    \n" +
                                " | ( ' )  |       \\  _. /  '       \n" +
                                " |(_ o _) /        _( )_ .'         \n" +
                                " | (_,_).' __  ___(_ o _)'          \n" +
                                " |  |\\ \\  |  ||   |(_,_)'         \n" +
                                " |  | \\ `'   /|   `-'  /           \n" +
                                " |  |  \\    /  \\      /           \n" +
                                " ''-'   `'-'    `-..-'              ");
                        //注册到zookeeper
                        //判断根节点是否存在
                        /*if (zkService.checkNodeExists(MANAGE_PATH)) {
                            zkService.createPersistentNode(MANAGE_PATH);
                        }
                        ServerNode serverNode = new ServerNode("127.0.0.1",PORT);
                        String pathRegistered =  zkService.createNode(PATH_PREFIX, serverNode);
                        //为node 设置id
                        serverNode.setId(NodeUtil.getIdByPath(pathRegistered,PATH_PREFIX));
                        log.info("本地节点, path={}, id={}", pathRegistered, serverNode.getId());
                        ServerWorker.instance().setServerNode(serverNode);
                        ServerRouterWorker.instance().init();*/
                    } else {
                        log.error("服务端启动成失败");
                    }
                }
            });
            // 7 监听通道关闭事件
            // 应用程序会一直等待，直到channel关闭
            ChannelFuture closeFuture =
                    channelFuture.channel().closeFuture();
            closeFuture.sync();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 8 优雅关闭EventLoopGroup，
            // 释放掉所有资源包括创建的线程
            bossGroup.shutdownGracefully();
            workerGroup.shutdownGracefully();
        }
    }
}
