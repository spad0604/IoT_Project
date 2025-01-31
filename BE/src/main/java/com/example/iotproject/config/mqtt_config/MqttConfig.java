package com.example.iotproject.config.mqtt_config;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MqttConfig {


    public MqttClient mqttPublisher() throws MqttException {
        String broker = "tcp://192.168.216.141:1883";  // Broker của MQTT
        String clientId = "esp32_pub";  // ClientId cho Publisher
        MqttClient mqttClient = new MqttClient(broker, clientId, new MemoryPersistence());

        MqttConnectOptions options = new MqttConnectOptions();
        options.setCleanSession(true);
        mqttClient.connect(options);  // Kết nối tới broker

        return mqttClient;
    }


    public MqttClient mqttSubscriber() throws MqttException {
        String broker = "tcp://192.168.216.141:1883";  // Broker của MQTT
        String clientId = "esp32_sub";
        MqttClient mqttClient = new MqttClient(broker, clientId, new MemoryPersistence());

        MqttConnectOptions options = new MqttConnectOptions();
        options.setCleanSession(true);
        mqttClient.connect(options);  // Kết nối tới broker

        return mqttClient;
    }
}