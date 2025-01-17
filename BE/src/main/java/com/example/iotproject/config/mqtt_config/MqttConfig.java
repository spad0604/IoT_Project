package com.example.iotproject.config.mqtt_config;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;

@Configuration
public class MqttConfig {
    public MqttClient mqttClient() throws MqttException {
        String broker = "tcp://localhost:1883"; // Địa chỉ broker
        String clientId = "test-client";        // Client ID
        MqttClient mqttClient = new MqttClient(broker, clientId, new MemoryPersistence());
        MqttConnectOptions options = new MqttConnectOptions();
        options.setUserName("user");
        options.setPassword("pass".toCharArray());
        mqttClient.connect(options);           // Kết nối broker
        return mqttClient;
    }
}