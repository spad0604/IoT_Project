package com.example.iotproject.services.device_data_update;

import com.example.iotproject.model.device.DeviceModel;
import com.example.iotproject.repository.device_repository.DeviceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.event.TransactionalEventListener;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DeviceDataUpdate {
    @Autowired
    private SimpMessagingTemplate template;

    @Autowired
    private DeviceRepository deviceRepository;

    @Autowired
    private ApplicationEventPublisher eventPublisher;

    @TransactionalEventListener
    public void handleDataChange(DeviceModel changedEntity) {
        // Lấy dữ liệu mới từ database
        DeviceModel updatedData = deviceRepository.findById(changedEntity.getId()).orElse(null);

        // Gửi dữ liệu qua WebSocket
        if (updatedData != null) {
            System.out.println("LED state changed for device ID: " + updatedData.getId());
            System.out.println("New state: LED1=" + updatedData.getLed1() + ", LED2=" + updatedData.getLed2());
            
            // Gửi đến topic cụ thể cho thiết bị này
            template.convertAndSend("/led_status/" + updatedData.getId(), updatedData);
            System.out.println("Notification sent to /led_status/" + updatedData.getId());
        }
    }

    @Transactional
    public void updateDevice(DeviceModel device) {
        // Cập nhật thiết bị trong database
        DeviceModel updatedDevice = deviceRepository.save(device);
        System.out.println("Device updated in database: " + updatedDevice.getId());
        
        // Phát sự kiện thay đổi
        eventPublisher.publishEvent(updatedDevice);
        System.out.println("Change event published for device: " + updatedDevice.getId());
    }
}
