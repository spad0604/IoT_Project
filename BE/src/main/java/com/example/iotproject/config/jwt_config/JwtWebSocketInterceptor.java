package com.example.iotproject.config.jwt_config;

import com.example.iotproject.services.jwt_service.JwtService;
import org.jetbrains.annotations.NotNull;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.HandshakeInterceptor;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class JwtWebSocketInterceptor implements HandshakeInterceptor {
    @Autowired
    private JwtService jwtService;

    @Autowired
    private UserDetailsService userDetailsService;

    @Override
    public boolean beforeHandshake(@NotNull ServerHttpRequest request, @NotNull ServerHttpResponse response,
                                   @NotNull WebSocketHandler wsHandler, @NotNull Map<String, Object> attributes) {
        if (request instanceof ServletServerHttpRequest servletRequest) {
            String token = servletRequest.getServletRequest().getParameter("token");

            if (token == null) {
                return false;
            }

            try {
                // Không cần cắt "Bearer " vì token từ URL không có prefix này
                String userEmail = jwtService.extractUserName(token);

                if (userEmail != null) {
                    UserDetails userDetails = this.userDetailsService.loadUserByUsername(userEmail);

                    if (jwtService.isTokenValid(token, userDetails)) {
                        UsernamePasswordAuthenticationToken authentication =
                                new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
                        SecurityContextHolder.getContext().setAuthentication(authentication);
                        attributes.put("user", userDetails);
                        return true;
                        //akfjaskfjkasjfkasjf
                    }
                }
            } catch (Exception e) {
                // Log lỗi
                System.err.println("JWT Authentication error: " + e.getMessage());
            }
        }
        return false;
    }

    @Override
    public void afterHandshake(@NotNull ServerHttpRequest request, @NotNull ServerHttpResponse response,
                               @NotNull WebSocketHandler wsHandler, Exception exception) {
    }
}
