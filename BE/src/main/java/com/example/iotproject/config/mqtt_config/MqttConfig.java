package com.example.iotproject.config.mqtt_config;

import io.github.cdimascio.dotenv.Dotenv;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MqttConfig {
    public MqttClient mqttClient() throws MqttException {
        String broker = "tcp://13.211.227.100:1883";
        String clientId = "test-client";
        MqttClient mqttClient = new MqttClient(broker, clientId, new MemoryPersistence());
        MqttConnectOptions options = new MqttConnectOptions();
        options.setCleanSession(true);
        mqttClient.connect(options);
        return mqttClient;
    }
}