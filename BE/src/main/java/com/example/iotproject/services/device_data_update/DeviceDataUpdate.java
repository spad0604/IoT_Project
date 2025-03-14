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
            template.convertAndSend("/topic/updates", updatedData);
        }
    }

    @Transactional
    public void updateDevice(DeviceModel device) {
        // Cập nhật thiết bị trong database
        DeviceModel updatedDevice = deviceRepository.save(device);
        System.out.println("Publishing event for device: " + updatedDevice.getId());

        // Phát sự kiện thay đổi
        eventPublisher.publishEvent(updatedDevice);
    }
}
