package com.example.iotproject.repository.phone_fcm_repository;

import com.example.iotproject.model.phone_fcm_model.PhoneFCMModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
@EnableJpaRepositories
public interface PhoneFCMRepository extends JpaRepository<PhoneFCMModel, String> {
//    @Query("SELECT p FROM PhoneFCMModel FROM WHERE p.deviceId = :deviceId")
//    Optional<PhoneFCMModel> getPhoneFCMByDevice(@Param("deviceId") String deviceId);
}
