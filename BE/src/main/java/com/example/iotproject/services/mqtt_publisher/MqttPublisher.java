package com.example.iotproject.services.mqtt_publisher;

import com.example.iotproject.config.mqtt_config.MqttConfig;
import com.example.iotproject.services.fcm_service.FcmService;
import lombok.NoArgsConstructor;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@NoArgsConstructor
public class MqttPublisher {
    private MqttConfig mqttConfig;

    private FcmService fcmService;

    public void publish(String topic, String payload) {
        try {
            MqttClient mqttClient = mqttConfig.mqttClient();
            MqttMessage message = new MqttMessage(payload.getBytes());
            message.setQos(1);
            mqttClient.publish(topic, message);

        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    }
}
