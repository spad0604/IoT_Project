package com.example.iotproject.config.web_socket;

import com.example.iotproject.config.jwt_config.JwtChannelInterceptor;
import com.example.iotproject.config.jwt_config.JwtWebSocketInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.Message;
import org.springframework.messaging.MessageChannel;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.support.ChannelInterceptor;
import org.springframework.messaging.support.MessageHeaderAccessor;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.config.annotation.*;
import org.springframework.web.socket.handler.WebSocketHandlerDecorator;


@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
    @Autowired
    private JwtWebSocketInterceptor jwtWebSocketInterceptor;

    @Autowired
    private JwtChannelInterceptor jwtChannelInterceptor;

    @Override
    public void configureMessageBroker(final MessageBrokerRegistry config) {
        // Kích hoạt các broker để client có thể subscribe
        config.enableSimpleBroker("/led_status", "/topic");
        // Tiền tố cho endpoint xử lý message
        config.setApplicationDestinationPrefixes("/app");
    }

    @Override
    public void registerStompEndpoints(final StompEndpointRegistry registry) {
        // Đăng ký endpoint WebSocket thông thường với interceptor
        registry.addEndpoint("/ws")
                .setAllowedOrigins("*")
                .addInterceptors(jwtWebSocketInterceptor);

        // Đăng ký endpoint SockJS (không thể thêm interceptor trực tiếp vào SockJS)
        registry.addEndpoint("/ws")
                .setAllowedOrigins("*")
                .withSockJS();
    }

    // Thêm phương thức này để đăng ký interceptor cho inbound channel
    @Override
    public void configureClientInboundChannel(ChannelRegistration registration) {
        registration.interceptors(new ChannelInterceptor() {
            @Override
            public Message<?> preSend(Message<?> message, MessageChannel channel) {
                StompHeaderAccessor accessor = MessageHeaderAccessor.getAccessor(message, StompHeaderAccessor.class);
                if (accessor != null) {
                    System.out.println("STOMP Command: " + accessor.getCommand());
                    if (accessor.getCommand() != null) {
                        switch (accessor.getCommand()) {
                            case CONNECT:
                                System.out.println("Client connecting...");
                                break;
                            case SUBSCRIBE:
                                System.out.println("Client subscribing to: " + accessor.getDestination());
                                break;
                            case SEND:
                                System.out.println("Client sending to: " + accessor.getDestination());
                                break;
                        }
                    }
                }
                return message;
            }
        });
    }

    @Override
    public void configureWebSocketTransport(WebSocketTransportRegistration registry) {
        registry.addDecoratorFactory(handler -> {
            return new WebSocketHandlerDecorator(handler) {
                @Override
                public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
                    if (message instanceof TextMessage) {
                        TextMessage textMessage = (TextMessage) message;
                        System.out.println("Received raw message: " + textMessage.getPayload());
                    }
                    super.handleMessage(session, message);
                }
            };
        });
    }

    // @Override
    // public void configureWebSocketTransport(WebSocketTransportRegistration registry) {
    //     registry.setMessageSizeLimit(64 * 1024) // 64KB
    //             .setSendBufferSizeLimit(128 * 1024) // 128KB
    //             .setSendTimeLimit(20000) // 20 seconds
    //             .setTimeToFirstMessage(60000); // 60 seconds
    // }
}
