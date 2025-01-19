package com.example.iotproject.services.fcm_service;

import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;


public class FcmService {
    private static final String FCM_API_URL = "https://fcm.googleapis.com/fcm/send";
    private static final String SERVER_KEY = "152743912802";

    public void sendNotification(String targetToken, String title, String body) {
        try {
            RestTemplate restTemplate = new RestTemplate();

            JSONObject payload = new JSONObject();
            payload.put("to", targetToken);

            JSONObject notification = new JSONObject();
            notification.put("title", title);
            notification.put("body", title);

            payload.put("notification", notification);

            HttpHeaders httpHeaders = new HttpHeaders();
            httpHeaders.setContentType(MediaType.APPLICATION_JSON);
            httpHeaders.setBearerAuth(SERVER_KEY);

            HttpEntity<String> entity = new HttpEntity<>(payload.toString(), httpHeaders);

            ResponseEntity<String> response = restTemplate.postForEntity(FCM_API_URL, entity, String.class);

            System.out.println("FCM Response: " + response.getBody());

        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    }
}
