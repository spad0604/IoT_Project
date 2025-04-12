package com.example.iotproject.config.firebase;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import org.springframework.context.annotation.Configuration;

import com.google.firebase.FirebaseOptions;

import io.jsonwebtoken.io.IOException;
import jakarta.annotation.PostConstruct;

@Configuration
public class FirebaseConfig {
    @PostConstruct
    public void initialize() {
        try {
            FileInputStream serviceAccount = new FileInputStream("src/main/iot-project-acd83-firebase-adminsdk-fbsvc-993d06b2b9.json");

            FirebaseOptions options = FirebaseOptions.builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .build();

            if (FirebaseApp.getApps().isEmpty()) {
                FirebaseApp.initializeApp(options);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
