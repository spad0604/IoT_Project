package com.example.iotproject.repository.device_owner_repository;

import com.example.iotproject.model.device_owner.DeviceOwner;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DeviceOwnerRepository extends JpaRepository<DeviceOwner, Integer> {
    @Query("SELECT d FROM DeviceOwner d WHERE d.account = :account")
    List<DeviceOwner> getDeviceByAccount(@Param("account") String account);
}
