package com.example.iotproject.controllers.led_controller;

import com.example.iotproject.model.device.DeviceModel;
import com.example.iotproject.model.phone_fcm_model.PhoneFCMModel;
import com.example.iotproject.repository.device_repository.DeviceRepository;
import com.example.iotproject.repository.phone_fcm_repository.PhoneFCMRepository;
import com.example.iotproject.services.jwt_service.JwtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Controller
public class LedStatusWebSocketController {

    @Autowired
    private DeviceRepository deviceRepository;

    @Autowired
    private PhoneFCMRepository phoneFCMRepository;

    @Autowired
    private JwtService jwtService;

    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    // Thêm method để gửi cập nhật theo cách thủ công
    public void sendDeviceUpdate(Integer deviceId) {
        System.out.println("Manual WebSocket update for device: " + deviceId);
        Optional<DeviceModel> deviceModel = deviceRepository.getDeviceData(deviceId);
        if (deviceModel.isPresent()) {
            messagingTemplate.convertAndSend("/led_status/" + deviceId, deviceModel.get());
            System.out.println("Sent update to /led_status/" + deviceId);
        } else {
            System.out.println("Device not found: " + deviceId);
        }
    }

    @MessageMapping("/led-status/{deviceId}")
    public void getLedStatus(@DestinationVariable Integer deviceId) {
        System.out.println("Received request for device status: " + deviceId);
        sendDeviceUpdate(deviceId);
    }
}
