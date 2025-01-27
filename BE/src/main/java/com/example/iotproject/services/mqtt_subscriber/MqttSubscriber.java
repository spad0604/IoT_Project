package com.example.iotproject.services.mqtt_subscriber;

import com.example.iotproject.config.mqtt_config.MqttConfig;
import com.example.iotproject.model.training_data.TrainingData;
import com.example.iotproject.repository.device_owner_repository.DeviceOwnerRepository;
import com.example.iotproject.repository.device_repository.DeviceRepository;
import com.example.iotproject.repository.training_data_repository.TrainingDataRepository;
import com.example.iotproject.repository.user_repository.UserRepository;
import com.example.iotproject.services.mqtt_publisher.MqttPublisher;
import jakarta.annotation.PostConstruct;
import org.eclipse.paho.client.mqttv3.IMqttDeliveryToken;
import org.eclipse.paho.client.mqttv3.MqttCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttMessage;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;


@Component
public class MqttSubscriber implements MqttCallback {
    @Autowired
    private MqttConfig mqttConfig;

    @Autowired
    private DeviceRepository deviceRepository;

    @Autowired
    private DeviceOwnerRepository deviceOwnerRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TrainingDataRepository trainingDataRepository;

    @PostConstruct
    public void init() {
        try {
            final MqttClient mqttClient = mqttConfig.mqttClient(true);
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

        try {
            JSONObject j = new JSONObject(receivedMessage);

            int device = j.getInt("deviceId");

            String account = j.getString("account");

            int led1 = j.getInt("led1");

            int led2 = j.getInt("led2");

            double humidity = j.getDouble("humidity");

            double temperature = j.getDouble("temperature");

            System.out.println("Updating device with ID: " + device);

            System.out.println("LED1: " + led1 + ", LED2: " + led2 + ", Temperature: " + temperature + ", Humidity: " + humidity);

            deviceRepository.setLedState(device, led1, led2, temperature, humidity);

            if (led1 == 1 && led2 == 1) {
                TrainingData trainingData = TrainingData.builder()
                        .deviceId(device)
                        .timeTurnOnLed1(LocalDateTime.now())
                        .timeTurnOnLed2(LocalDateTime.now())
                        .build();
                trainingDataRepository.save(trainingData);
            } else {
                if (led2 == 0 && led1 == 1) {
                    TrainingData trainingData = TrainingData.builder()
                            .deviceId(device)
                            .timeTurnOnLed1(LocalDateTime.now())
                            .timeTurnOnLed2(null)
                            .build();
                    trainingDataRepository.save(trainingData);
                } else {
                    if (led2 == 1 && led1 == 0) {
                        TrainingData trainingData = TrainingData.builder()
                                .deviceId(device)
                                .timeTurnOnLed1(null)
                                .timeTurnOnLed2(LocalDateTime.now())
                                .build();
                        trainingDataRepository.save(trainingData);
                    }
                }
            }

        } catch (Exception e) {
            System.out.println("Error parsing JSON: " + e.getMessage());
        }
    }

    @Override
    public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {
        System.out.println("Delivery complete!");
    }
}
