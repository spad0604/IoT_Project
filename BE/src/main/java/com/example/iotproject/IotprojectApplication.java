package com.example.iotproject;

import com.example.iotproject.model.device.DeviceModel;
import com.example.iotproject.model.phone_fcm_model.PhoneFCMModel;
import com.example.iotproject.model.user.User;
import com.example.iotproject.repository.device_repository.DeviceRepository;
import com.example.iotproject.repository.user_repository.UserRepository;
import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import com.example.iotproject.repository.phone_fcm_repository.PhoneFCMRepository;

@SpringBootApplication
@OpenAPIDefinition
public class IotprojectApplication {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PhoneFCMRepository phoneFCMRepository;

    @Autowired
    private DeviceRepository deviceRepository;

    public static void main(String[] args) {
        SpringApplication.run(IotprojectApplication.class, args);
    }

    @PostConstruct
    public void addUser() {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode("06042004");

        User user = User.builder()
                .account("giapbacvan")
                .password(encodedPassword)
                .lastName("Giap")
                .firstName("Nguyen")
                .build();

        userRepository.save(user);

        DeviceModel deviceModel = DeviceModel.builder()
                .led1(0)
                .led2(0)
                .temperature(0.0)
                .humidity(0.0)
                .build();

        deviceRepository.save(deviceModel);

        PhoneFCMModel phoneFCMModel = PhoneFCMModel.builder()
                .account("giapbacvan")
                .deviceId(1)
                .fcmToken("fcmToken")
                .build();

        phoneFCMRepository.save(phoneFCMModel);
    }
}
