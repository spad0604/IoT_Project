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
    private Integer deviceId;
    private String account;
    private Integer led1;
    private Integer led2;
    private double temperature;
    private double humidity;
}
