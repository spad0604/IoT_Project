package com.example.iotproject.model.mqtt_pub_model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MqttPubModel {
    @JsonProperty("deviceId")
    private int deviceId;
    @JsonProperty("led1")
    private int led1;
    @JsonProperty("led2")
    private int led2;
}
