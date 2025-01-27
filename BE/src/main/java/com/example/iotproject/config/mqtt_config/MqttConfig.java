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
    public MqttClient mqttClient(boolean isSubscriber) throws MqttException {
        String broker = "tcp://192.168.14.141:1883";
        String clientId = "";
        if (isSubscriber) {
            clientId = "esp32_sub";
        } else {
            clientId = "esp32_pub";
        }
        MqttClient mqttClient = new MqttClient(broker, clientId, new MemoryPersistence());
        MqttConnectOptions options = new MqttConnectOptions();
        options.setCleanSession(true);
        mqttClient.connect(options);
        return mqttClient;
    }
}