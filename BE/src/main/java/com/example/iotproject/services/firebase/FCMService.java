package com.example.iotproject.services.firebase;

import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import org.springframework.stereotype.Service;

@Service
public class FCMService {
    public String sendNotification(String token, String title, String message) throws FirebaseMessagingException {
        Notification notification = Notification.builder()
                .setTitle(title)
                .setBody(message)
                .build();

        Message mess = Message.builder()
                .setToken(token)
                .setNotification(notification)
                .build();

        String response = FirebaseMessaging.getInstance().send(mess);
        return response;
    }
}
