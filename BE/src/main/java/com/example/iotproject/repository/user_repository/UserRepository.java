package com.example.iotproject.repository.user_repository;

import com.example.iotproject.model.user.User;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends MongoRepository<User, String> {
    @Query("{ 'account': ?0 }")
    Optional<User> findUserByAccount(String account);
}
