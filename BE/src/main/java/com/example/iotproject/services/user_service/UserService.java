package com.example.iotproject.services.user_service;

import com.example.iotproject.model.user.User;
import com.example.iotproject.repository.user_repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public void addUser(User user) {
        userRepository.save(user);
    }

    public Optional<User> findByAccount(String account) {
        return userRepository.findUserByAccount(account);
    }
}
