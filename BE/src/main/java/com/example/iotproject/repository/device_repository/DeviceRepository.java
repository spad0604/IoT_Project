package com.example.iotproject.repository.device_repository;

import com.example.iotproject.model.device.DeviceModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface DeviceRepository extends JpaRepository<DeviceModel, Integer> {
    @Modifying
    @Query("UPDATE DeviceModel d SET d.led1 = :led1, d.led2 = :led2 WHERE d.id = :id")
    void setLedState(@Param("id") Integer id, @Param("led1") int led1, @Param("led2") int led2);
}
