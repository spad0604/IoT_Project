package com.example.iotproject.config.web_socket;

import org.jetbrains.annotations.NotNull;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.io.IOException;
import java.util.concurrent.CopyOnWriteArrayList;

public class MyWebSocketHandler extends TextWebSocketHandler {
    private static final CopyOnWriteArrayList<WebSocketSession> sessions = new CopyOnWriteArrayList<>();

    @Override
    public void afterConnectionEstablished(@NotNull WebSocketSession session) {
        sessions.add(session);
        System.out.println("New client connected: " + session.getId());
    }

    @Override
    protected void handleTextMessage(@NotNull WebSocketSession session, TextMessage message) throws IOException {
        String receivedMessage = message.getPayload();
        System.out.println("Received: " + receivedMessage);

        // Phát lại tin nhắn tới tất cả client
        for (WebSocketSession s : sessions) {
            s.sendMessage(new TextMessage("Server received: " + receivedMessage));
        }
    }

    @Override
    public void afterConnectionClosed(@NotNull WebSocketSession session, org.springframework.web.socket.CloseStatus status) {
        sessions.remove(session);
        System.out.println("Client disconnected: " + session.getId());
    }
}
