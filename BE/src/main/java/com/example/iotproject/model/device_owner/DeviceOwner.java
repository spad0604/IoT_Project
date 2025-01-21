package com.example.iotproject.model.device_owner;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Builder
@Table(name = "deviceOwner")
public class DeviceOwner {
    @Id
    private int deviceId;
    private String account;
}
