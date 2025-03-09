package com.example.iotproject.model.response_model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;

@Builder
public class ResponseModel {
    @JsonProperty("code")
    private int statusCode;
    @JsonProperty("message")
    private String message;
    @JsonProperty("data")
    private Object data;
}
