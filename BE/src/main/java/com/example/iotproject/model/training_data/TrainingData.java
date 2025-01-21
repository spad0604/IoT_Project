package com.example.iotproject.model.training_data;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Builder
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
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int deviceId;

    private LocalDateTime timeTurnOnLed1;

    private LocalDateTime timeTurnOnLed2;
}
