package com.example.iotproject.model.phone_fcm_model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "phoneFcmModel")
public class PhoneFCMModel {
    @Id
    @Column(length = 1000)
    private String fcmToken;

    @Column(name = "deviceId")
    private Integer deviceId;

    @Column(name = "account")
    private String account;
}
