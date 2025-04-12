package com.example.iotproject.controllers.firebase;

import com.google.firebase.messaging.FirebaseMessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.iotproject.model.response_model.ResponseModel;
import com.example.iotproject.services.firebase.FCMService;


@RestController
@RequestMapping("/fcm")
public class FCMController {
    @Autowired
    private FCMService fcmService;

    @PostMapping("/send")
    public ResponseEntity<?> sendNotification(
            @RequestParam String token,
            @RequestParam String title,
            @RequestParam String body
    ) {
        try {
            String response = fcmService.sendNotification(token, title, body);
            return ResponseEntity.status(200).body(
                    ResponseModel.builder()
                            .statusCode(200)
                            .message("Successfully sent notification")
                            .data(response)
                            .build()
            );
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body(
                    ResponseModel.builder()
                            .statusCode(500)
                            .message("Failed to send notification")
                            .build()
            );
        }
    }

}
