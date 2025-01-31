package com.example.iotproject.services.mqtt_publisher;

import com.example.iotproject.config.mqtt_config.MqttConfig;
import com.example.iotproject.services.fcm_service.FcmService;
import jakarta.annotation.PostConstruct;
import lombok.NoArgsConstructor;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
@NoArgsConstructor
public class MqttPublisher {
    private static final Logger logger = LoggerFactory.getLogger(MqttPublisher.class);

    @Autowired
    private MqttConfig mqttConfig;

    @Autowired
    private FcmService fcmService;

    private MqttClient mqttClient;

    @PostConstruct
    public void init() {
        try {
            mqttClient = mqttConfig.mqttPublisher();
            logger.info("MQTT client initialized successfully.");
        } catch (Exception e) {
            logger.error("Failed to initialize MQTT client.", e);
        }
    }

    public void publish(String topic, String payload) {
        try {
            if (mqttClient == null || !mqttClient.isConnected()) {
                logger.warn("MQTT client is disconnected. Reconnecting...");
                mqttClient.reconnect();
            }
            MqttMessage message = new MqttMessage(payload.getBytes());
            message.setQos(1);
            mqttClient.publish(topic, message);
            logger.info("Published message to topic {}: {}", topic, payload);
        } catch (Exception e) {
            logger.error("Failed to publish message to topic {}: {}", topic, payload, e);
        }
    }
}
