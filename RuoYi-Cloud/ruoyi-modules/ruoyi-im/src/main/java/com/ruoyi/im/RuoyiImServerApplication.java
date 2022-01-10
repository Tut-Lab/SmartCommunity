package com.ruoyi.im;

import com.ruoyi.common.security.annotation.EnableCustomConfig;
import com.ruoyi.common.security.annotation.EnableRyFeignClients;
import com.ruoyi.common.swagger.annotation.EnableCustomSwagger2;
import com.ruoyi.im.server.server.ImServer;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;


@EnableCustomConfig
@EnableRyFeignClients
@SpringBootApplication
@EnableCustomSwagger2
public class RuoyiImServerApplication {

//    public static void main(String[] args) {
//        SpringApplication.run(RuoyiImServerApplication.class, args);
//    }

    public static void main(String[] args) throws Exception {
        ConfigurableApplicationContext context = SpringApplication.run(RuoyiImServerApplication.class, args);
        startChatServer(context);
    }

    /**
     * 启动服务器
     * @param context
     */
    private static void startChatServer(ConfigurableApplicationContext context) throws Exception {
        ImServer imServer =context.getBean(ImServer.class);
        imServer.startImServer();
    }
}
