package com.example.iotproject.config.mqtt_config;

import jakarta.annotation.PostConstruct;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.JSONObject;
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
            String topic = "esp32/led";
            mqttClient.setCallback(this);
            mqttClient.subscribe(topic);
            mqttClient.connect();
        } catch (Exception e) {
            System.out.print(e.getMessage());
        }
    }

    @Override
    public void connectionLost(Throwable throwable) {
        System.out.println("Connect lost! " + throwable.getMessage());
    }

    @Override
    public void messageArrived(String topic, MqttMessage message) throws Exception {
        String receivedMessage = new String(message.getPayload());
        System.out.println("Received message: " + receivedMessage);

        try {
            JSONObject j = new JSONObject(receivedMessage);

            String account = (String) j.get("account");

            System.out.print("test " + account);
        } catch (Exception e) {
            System.out.println("Error parsing JSON: " + e.getMessage());
        }

    }


    @Override
    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {
        System.out.println("Delivery complete!");
    }
}
