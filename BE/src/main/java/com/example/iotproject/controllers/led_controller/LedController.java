package com.example.iotproject.controllers.led_controller;

import com.example.iotproject.model.device_owner.DeviceOwner;
import com.example.iotproject.model.mqtt_data.MqttDataModel;
import com.example.iotproject.model.user.User;
import com.example.iotproject.repository.device_owner_repository.DeviceOwnerRepository;
import com.example.iotproject.repository.device_repository.DeviceRepository;
import com.example.iotproject.repository.user_repository.UserRepository;
import com.example.iotproject.services.jwt_service.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@RestController
@RequestMapping("/led")
@RequiredArgsConstructor
public class LedController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private DeviceOwnerRepository deviceOwnerRepository;

    @Autowired
    private DeviceRepository deviceRepository;

    @Autowired
    private JwtService jwtService;

    @PostMapping()
    public ResponseEntity<?> ledController(@RequestBody MqttDataModel model, @RequestHeader String header) {
        try {
            final String account = jwtService.extractUserName(header.substring(7));
            if (Objects.equals(account, model.getAccount())) {
                List<DeviceOwner> deviceOwnerList = deviceOwnerRepository.getDeviceByAccount(account);

                for (DeviceOwner deviceOwner : deviceOwnerList) {
                    if (deviceOwner.getDeviceId() == model.getDeviceId()) {
                        deviceRepository.setLedState(model.getDeviceId(), model.getLed1(), model.getLed2());
                        return ResponseEntity.ok().build();
                    }
                }

                return ResponseEntity.notFound().build();
            } else {
                return ResponseEntity.notFound().build();
            }

        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }

    public ResponseEntity<?> registerDevice(@RequestBody DeviceOwner deviceOwner, @RequestHeader String header) {
        try {
            String account = jwtService.extractUserName(header.substring(7));

            if (Objects.equals(account, deviceOwner.getAccount())) {
                Optional<User> user = userRepository.findUserByAccount(deviceOwner.getAccount());

                if (user.isPresent()) {
                    deviceOwnerRepository.save(deviceOwner);

                    return ResponseEntity.ok().build();
                } else {
                    return ResponseEntity.notFound().build();
                }
            } else {
                return ResponseEntity.notFound().build();
            }

        } catch (Exception e) {
            return ResponseEntity.badRequest().build();
        }
    }
}
