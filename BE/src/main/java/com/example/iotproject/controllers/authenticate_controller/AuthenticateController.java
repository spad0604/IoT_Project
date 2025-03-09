package com.example.iotproject.controllers.authenticate_controller;

import com.example.iotproject.model.authenticate_request.AuthenticateRequest;
import com.example.iotproject.model.mqtt_pub_model.MqttPubModel;
import com.example.iotproject.model.response_model.ResponseModel;
import com.example.iotproject.model.user.User;
import com.example.iotproject.services.authenticate_service.AuthenticateService;
import com.example.iotproject.services.convert_to_json.ModelToJson;
import com.example.iotproject.services.mqtt_publisher.MqttPublisher;
import com.example.iotproject.services.user_service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@CrossOrigin(origins = "*")
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

    @Autowired
    private MqttPublisher mqttPublisher;

    @PostMapping("/login")
    public ResponseEntity<?> authenticate(@RequestBody AuthenticateRequest authenticateRequest, @RequestHeader(value = "header", required = false) String header) {
        Optional<User> user = userService.findByAccount(authenticateRequest.getAccount());

        if (user.isPresent()) {
            if (passwordEncoder.matches(authenticateRequest.getPassword(), user.get().getPassword())) {
                ResponseModel responseModel = ResponseModel.builder()
                        .statusCode(200)
                        .message("Login Success")
                        .data(authenticateService.authenticate(authenticateRequest))
                        .build();

                return ResponseEntity.ok(responseModel);
            } else {
                ResponseModel responseModel = ResponseModel.builder()
                        .statusCode(403)
                        .message("Wrong Password")
                        .build();
                return ResponseEntity.status(403).body(responseModel);
            }
        } else {
            ResponseModel responseModel = ResponseModel.builder()
                    .statusCode(404)
                    .message("Account does not exits")
                    .build();
            return ResponseEntity.status(404).body(responseModel);
        }
    }

    @PostMapping("/logout")
    public ResponseEntity<?> logout(@RequestHeader("Authorization") String token) {
        try {
            // Gọi service để xử lý logout
            authenticateService.logout(token);

            ResponseModel responseModel = ResponseModel.builder()
                    .statusCode(200)
                    .message("Logout Success")
                    .build();

            return ResponseEntity.ok(responseModel);
        } catch (Exception e) {
            ResponseModel responseModel = ResponseModel.builder()
                    .statusCode(500)
                    .message("Logout Failed: " + e.getMessage())
                    .build();

            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(responseModel);
        }
    }

    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody User user) {
        Optional<User> userOptional = userService.findByAccount(user.getAccount());

        if (userOptional.isPresent()) {
            ResponseModel responseModel = ResponseModel.builder()
                    .statusCode(401)
                    .message("Accout is exits")
                    .build();

            return ResponseEntity.status(401).body(responseModel);
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userService.addUser(user);

        ResponseModel responseModel = ResponseModel.builder()
                .statusCode(200)
                .message("Register Success")
                .build();

        return ResponseEntity.ok(responseModel);
    }
}
