package com.example.iotproject.controllers.authenticate_controller;

import com.example.iotproject.model.authenticate_request.AuthenticateRequest;
import com.example.iotproject.model.user.User;
import com.example.iotproject.services.authenticate_service.AuthenticateService;
import com.example.iotproject.services.user_service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthenticateController {
    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private AuthenticateService authenticateService;

    @PostMapping("/login")
    public ResponseEntity<?> authenticate(@RequestBody AuthenticateRequest authenticateRequest) {
        Optional<User> user = userService.findByAccount(authenticateRequest.getAccount());

        if(user.isPresent()) {
            if(passwordEncoder.matches(authenticateRequest.getPassword(), user.get().getPassword())) {
                return ResponseEntity.ok(authenticateService.authenticate(authenticateRequest));
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody User user) {
        Optional<User> userOptional = userService.findByAccount(user.getAccount());

        if(userOptional.isPresent()) {
            return ResponseEntity.status(403).build();
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userService.addUser(user);
        return ResponseEntity.ok().build();
    }
}
