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
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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

    @PostMapping()
    public ResponseEntity<?> ledController(@RequestBody MqttDataModel model, @RequestHeader(value = "Authorization", required = true) String header) {
        try {
            final String account = jwtService.extractUserName(header.substring(7));
            if (Objects.equals(account, model.getAccount())) {
                List<PhoneFCMModel> phoneFCMModelList = phoneFCMRepository.getPhoneFCMByDevice(model.getDeviceId());

                for (PhoneFCMModel phoneFCMModel : phoneFCMModelList) {
                    if (Objects.equals(phoneFCMModel.getDeviceId(), model.getDeviceId())) {
                        deviceRepository.setLedState(model.getDeviceId(), model.getLed1(), model.getLed2());

                        deviceRepository.setData(model.getDeviceId(), model.getHumidity(), model.getTemperature());

                        //Gửi thông điệp MQTT cho vi điều khien
                        MqttPubModel mqttPubModel = MqttPubModel.builder().deviceId(model.getDeviceId()).led1(model.getLed1()).led2(model.getLed2()).build();

                        String json = ModelToJson.modelToJson(mqttPubModel);

                        mqttPublisher.publish("esp32_pub", json);

                        Optional<DeviceModel> deviceModel = deviceRepository.getDeviceData(model.getDeviceId());

                        ResponseModel responseModel = ResponseModel.builder()
                                .statusCode(200)
                                .message("Update success")
                                .data(deviceModel.get())
                                .build();
                        return ResponseEntity.ok(responseModel);
                    }
                }

            }

            ResponseModel responseModel = ResponseModel
                    .builder()
                    .statusCode(404)
                    .message("Not found")
                    .build();
            return ResponseEntity.status(404).body(responseModel);

        } catch (Exception e) {
            ResponseModel responseModel = ResponseModel
                    .builder()
                    .statusCode(401)
                    .message("Bad request")
                    .build();

            return ResponseEntity.status(401).body(responseModel);
        }
    }

    @GetMapping()
    public ResponseEntity<?> getData(@RequestHeader(value = "Authorization", required = true) String header, @RequestParam Integer deviceId) {
        String account = jwtService.extractUserName(header.substring(7));

        List<PhoneFCMModel> listDevice = phoneFCMRepository.getPhoneFCMByDevice(deviceId);

        if (!listDevice.isEmpty() && Objects.equals(listDevice.get(0).getAccount(), account)) {
            Optional<DeviceModel> deviceModel = deviceRepository.getDeviceData(deviceId);

            if (deviceModel.isPresent()) {
                ResponseModel responseModel = ResponseModel.builder()
                        .statusCode(200)
                        .message("Success")
                        .data(deviceModel.get())
                        .build();

                return ResponseEntity.ok(responseModel);
            } else {
                ResponseModel responseModel = ResponseModel.builder()
                        .statusCode(404)
                        .message("Not found")
                        .build();

                return ResponseEntity.status(404).body(responseModel);
            }
        } else {
            ResponseModel responseModel = ResponseModel.builder()
                    .statusCode(403)
                    .message("Device is not belong you")
                    .build();

            return ResponseEntity.status(403).body(responseModel);
        }
    }
}
