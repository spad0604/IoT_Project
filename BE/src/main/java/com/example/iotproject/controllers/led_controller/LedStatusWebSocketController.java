package com.example.iotproject.controllers.led_controller;

import com.example.iotproject.model.device.DeviceModel;
import com.example.iotproject.model.phone_fcm_model.PhoneFCMModel;
import com.example.iotproject.repository.device_repository.DeviceRepository;
import com.example.iotproject.repository.phone_fcm_repository.PhoneFCMRepository;
import com.example.iotproject.services.jwt_service.JwtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
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

    @MessageMapping("/led-status/{deviceId}/{username}")
    @SendTo("/led_status/{deviceId}/{username}")
    public DeviceModel getLedStatus(@DestinationVariable Integer deviceId, @DestinationVariable String username) {
        // Lấy thông tin user từ session sau khi xác thực qua JwtWebSocketInterceptor
        String account = username;
        
        // Kiểm tra quyền truy cập vào thiết bị
        List<PhoneFCMModel> listDevice = phoneFCMRepository.getPhoneFCMByDevice(deviceId);
        
        if (!listDevice.isEmpty() && Objects.equals(listDevice.get(0).getAccount(), account)) {
            Optional<DeviceModel> deviceModel = deviceRepository.getDeviceData(deviceId);
            return deviceModel.orElse(null);
        }
        
        return null;
    }
}
