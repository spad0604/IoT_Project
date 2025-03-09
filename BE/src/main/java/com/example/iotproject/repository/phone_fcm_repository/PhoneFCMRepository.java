package com.example.iotproject.repository.phone_fcm_repository;

import com.example.iotproject.model.phone_fcm_model.PhoneFCMModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@EnableJpaRepositories
public interface PhoneFCMRepository extends JpaRepository<PhoneFCMModel, String> {
    @Query("SELECT p FROM PhoneFCMModel p WHERE p.deviceId = :deviceId")
    List<PhoneFCMModel> getPhoneFCMByDevice(@Param("deviceId") Integer deviceId);
}
