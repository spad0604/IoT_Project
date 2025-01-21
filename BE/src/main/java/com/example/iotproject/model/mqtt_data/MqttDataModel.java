package com.example.iotproject.model.mqtt_data;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class MqttDataModel {
    private int deviceId;
    private String account;
    private int led1;
    private int led2;
    private double temperature;
    private double humidity;
}
