package com.example.iotproject.controllers.led_controller;

import com.example.iotproject.model.device.DeviceModel;
import com.example.iotproject.model.mqtt_data.MqttDataModel;
import com.example.iotproject.model.mqtt_pub_model.MqttPubModel;
import com.example.iotproject.model.phone_fcm_model.PhoneFCMModel;
import com.example.iotproject.model.response_model.ResponseModel;
import com.example.iotproject.repository.device_repository.DeviceRepository;
import com.example.iotproject.repository.phone_fcm_repository.PhoneFCMRepository;
import com.example.iotproject.repository.user_repository.UserRepository;
import com.example.iotproject.services.convert_to_json.ModelToJson;
import com.example.iotproject.services.jwt_service.JwtService;
import com.example.iotproject.services.mqtt_publisher.MqttPublisher;
import com.example.iotproject.services.device_data_update.DeviceDataUpdate;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.*;

//Update
@RestController
@RequestMapping("/led")
@RequiredArgsConstructor
public class LedController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PhoneFCMRepository phoneFCMRepository;

    @Autowired
    private DeviceRepository deviceRepository;

    @Autowired
    private JwtService jwtService;

    @Autowired
    private MqttPublisher mqttPublisher;

    @Autowired
    private DeviceDataUpdate deviceDataUpdate;

    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    @PostMapping()
    public ResponseEntity<?> ledController(
            @RequestBody MqttDataModel model,
            @RequestHeader(value = "Authorization", required = true) String header) {
        try {
            Optional<String> accountOpt = getAccountFromToken(header);
            if (accountOpt.isEmpty()) {
                return ResponseEntity.status(401).body(
                        ResponseModel.builder()
                                .statusCode(401)
                                .message("Invalid or missing token")
                                .build()
                );
            }

            String account = accountOpt.get();
            if (!Objects.equals(account, model.getAccount())) {
                return ResponseEntity.status(403).body(
                        ResponseModel.builder()
                                .statusCode(403)
                                .message("Token does not match account")
                                .build()
                );
            }

            List<PhoneFCMModel> phoneFCMModelList = phoneFCMRepository.getPhoneFCMByDevice(model.getDeviceId());

            // Lưu trạng thái cũ trước khi cập nhật
            Optional<DeviceModel> oldDeviceState = deviceRepository.getDeviceData(model.getDeviceId());
            
            // Cập nhật trạng thái mới
            deviceRepository.setLedState(model.getDeviceId(), model.getLed1(), model.getLed2());
            deviceRepository.setData(model.getDeviceId(), model.getHumidity(), model.getTemperature());

            // Gửi dữ liệu mới qua MQTT
            MqttPubModel mqttPubModel = MqttPubModel.builder()
                    .deviceId(model.getDeviceId())
                    .led1(model.getLed1())
                    .led2(model.getLed2())
                    .build();

            String json = ModelToJson.modelToJson(mqttPubModel);
            mqttPublisher.publish("esp32_pub", json);
            
            // Lấy trạng thái mới sau khi cập nhật
            Optional<DeviceModel> deviceModel = deviceRepository.getDeviceData(model.getDeviceId());
            
            // Gửi trực tiếp thông báo qua WebSocket
            if (deviceModel.isPresent()) {
                System.out.println("Sending WebSocket update for device: " + model.getDeviceId());
                messagingTemplate.convertAndSend("/led_status/" + model.getDeviceId(), deviceModel.get());
            }

            if (deviceModel.isPresent()) {
                return ResponseEntity.ok(
                        ResponseModel.builder()
                                .statusCode(200)
                                .message("Update success")
                                .data(deviceModel.get())
                                .build()
                );
            }

            return ResponseEntity.status(404).body(
                    ResponseModel.builder()
                            .statusCode(404)
                            .message("Device not found or unauthorized")
                            .build()
            );

        } catch (Exception e) {
            return ResponseEntity.status(500).body(
                    ResponseModel.builder()
                            .statusCode(500)
                            .message("Internal server error: " + e.getMessage())
                            .build()
            );
        }
    }

    @GetMapping()
    public ResponseEntity<?> getData(
            @RequestHeader(value = "Authorization", required = true) String header,
            @RequestParam(required = true) Integer deviceId
    ) {
        try {
            Optional<String> accountOpt = getAccountFromToken(header);
            if (accountOpt.isEmpty()) {
                return ResponseEntity.status(401).body(
                        ResponseModel.builder()
                                .statusCode(401)
                                .message("Invalid or missing token")
                                .build()
                );
            }

            String account = accountOpt.get();

            List<PhoneFCMModel> listDevice = phoneFCMRepository.getPhoneFCMByDevice(deviceId);

            if (!listDevice.isEmpty() && Objects.equals(listDevice.get(0).getAccount(), account)) {
                Optional<DeviceModel> deviceModel = deviceRepository.getDeviceData(deviceId);

                return deviceModel.map(model -> ResponseEntity.ok(
                        ResponseModel.builder()
                                .statusCode(200)
                                .message("Success")
                                .data(model)
                                .build()
                )).orElseGet(() -> ResponseEntity.status(404).body(
                        ResponseModel.builder()
                                .statusCode(404)
                                .message("Device not found")
                                .build()
                ));
            } else {
                return ResponseEntity.status(403).body(
                        ResponseModel.builder()
                                .statusCode(403)
                                .message("Device does not belong to you")
                                .build()
                );
            }
        } catch (Exception e) {
            return ResponseEntity.status(500).body(
                    ResponseModel.builder()
                            .statusCode(500)
                            .message("Internal server error: " + e.getMessage())
                            .build()
            );
        }
    }

    private Optional<String> getAccountFromToken(String header) {
        if (header == null || !header.startsWith("Bearer ")) {
            return Optional.empty();
        }

        try {
            String token = header.substring(7);
            String account = jwtService.extractUserName(token);
            return Optional.of(account);
        } catch (Exception e) {
            return Optional.empty();
        }
    }

}
