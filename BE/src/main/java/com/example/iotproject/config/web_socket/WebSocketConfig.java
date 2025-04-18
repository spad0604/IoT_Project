package com.example.iotproject.config.web_socket;

import com.example.iotproject.config.jwt_config.JwtWebSocketInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.*;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

    @Autowired
    private JwtWebSocketInterceptor jwtWebSocketInterceptor;

    @Override
    public void configureMessageBroker(final MessageBrokerRegistry config) {
        // Kích hoạt các broker để client có thể subscribe
        config.enableSimpleBroker("/led_socket", "/led_status");
        // Tiền tố cho endpoint xử lý message
        config.setApplicationDestinationPrefixes("/app");
    }

    @Override
    public void registerStompEndpoints(final StompEndpointRegistry registry) {
        // Đổi từ "/stomp" thành "/ws"
        registry.addEndpoint("/ws").setAllowedOrigins("*");
        registry.addEndpoint("/ws").setAllowedOrigins("*").withSockJS();
    }
}
