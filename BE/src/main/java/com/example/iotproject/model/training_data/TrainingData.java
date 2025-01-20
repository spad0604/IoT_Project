package com.example.iotproject.model.training_data;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Index;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "trainingData", indexes = {
        @Index(name = "inx_deviceId", columnList = "deviceId")
})
public class TrainingData {
    @Id
    private int id;

    private int deviceId;

    private LocalDateTime timeTurnOnLed1;

    private LocalDateTime timeTurnOnLed2;
}
