package com.example.iotproject.controllers.user_controller;

import com.example.iotproject.model.phone_fcm_model.PhoneFCMModel;
import com.example.iotproject.model.response_model.ResponseModel;
import com.example.iotproject.repository.phone_fcm_repository.PhoneFCMRepository;
import com.example.iotproject.services.jwt_service.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private PhoneFCMRepository phoneFCMRepository;

    @Autowired
    private JwtService jwtService;

    @PostMapping("/register-device")
    public ResponseEntity<?> registerDevice(@RequestBody PhoneFCMModel phoneFCMModel) {
        try {
            phoneFCMRepository.save(phoneFCMModel);
            return ResponseEntity.ok(
                    ResponseModel.builder()
                            .statusCode(200)
                            .message("Update success")
                            .build());
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.notFound().build();
        }
    }
}
