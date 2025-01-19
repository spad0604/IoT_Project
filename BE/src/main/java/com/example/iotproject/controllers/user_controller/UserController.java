package com.example.iotproject.controllers.user_controller;

import com.example.iotproject.model.phone_fcm_model.PhoneFCMModel;
import com.example.iotproject.repository.phone_fcm_repository.PhoneFCMRepository;
import com.example.iotproject.services.jwt_service.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
    @Autowired
    private PhoneFCMRepository phoneFCMRepository;

    @Autowired
    private JwtService jwtService;
    @PostMapping("/register-device")
    public ResponseEntity<?> registerDevice(@RequestBody PhoneFCMModel phoneFCMModel, @RequestHeader String header) {
        String account = jwtService.extractUserName(header.substring(7));

        if(Objects.equals(account, phoneFCMModel.getAccount())) {
            phoneFCMRepository.save(phoneFCMModel);

            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
