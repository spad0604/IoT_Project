package com.example.iotproject.repository.training_data_repository;

import com.example.iotproject.model.training_data.TrainingData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TrainingDataRepository extends JpaRepository<TrainingData, Integer> {
    @Query("SELECT t FROM TrainingData t WHERE t.deviceId = :deviceId")
    List<TrainingData> findDataByDeviceId(@Param("deviceId") Integer deviceId);
}
