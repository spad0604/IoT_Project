package com.example.iotproject.services.convert_to_json;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ModelToJson {
    public static String modelToJson(Object model) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            return objectMapper.writeValueAsString(model);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return "{}"; // Trả về JSON rỗng nếu có lỗi
        }
    }
}
