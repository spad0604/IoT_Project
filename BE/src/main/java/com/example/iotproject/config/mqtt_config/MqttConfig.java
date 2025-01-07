package com.example.iotproject.config.mqtt_config;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MqttConfig {
    @Bean
    public MqttClient mqttClient() {
        try {
            String brokerUrl = "tcp://localhost:1883";
            String clientId = "SpringBootServer";
            MemoryPersistence persistence = new MemoryPersistence();

            MqttClient mqttClient = new MqttClient(brokerUrl, clientId, persistence);
            MqttConnectOptions connectOptions = new MqttConnectOptions();
            connectOptions.setCleanSession(true);
            mqttClient.connect(connectOptions);

            return mqttClient;
        } catch (Exception e) {
            throw new RuntimeException("MQTT connection failed", e);
        }
    }
}
