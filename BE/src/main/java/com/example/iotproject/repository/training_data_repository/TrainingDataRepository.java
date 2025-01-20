package com.example.iotproject.repository.training_data_repository;

import com.example.iotproject.model.training_data.TrainingData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TrainingDataRepository extends JpaRepository<TrainingData, Integer> {
    @Query("SELECT t FROM TrainingData WHERE t.deviceId = :deviceId")
    List<TrainingData> findDataByDeviceId(@Param("deviceId") Integer deviceId);
}
