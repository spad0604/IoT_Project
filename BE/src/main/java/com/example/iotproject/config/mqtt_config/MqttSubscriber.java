package com.example.iotproject.config.mqtt_config;

import jakarta.annotation.PostConstruct;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MqttSubscriber implements MqttCallback {
    @Autowired
    private MqttConfig mqttConfig;

    @PostConstruct
    public void init() {
        try {
            final MqttClient mqttClient = mqttConfig.mqttClient();
            String topic = "esp32/data";
            mqttClient.setCallback(this);
            mqttClient.subscribe(topic);
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    }

    @Override
    public void connectionLost(Throwable throwable) {
        System.out.println("Connect lost! " + throwable.getMessage());
    }

    @Override
    public void messageArrived(String s, MqttMessage mqttMessage) throws Exception {
        System.out.println("Received message: " + new String(mqttMessage.getPayload()));
    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {
        System.out.println("Delivery complete!");
    }
}
