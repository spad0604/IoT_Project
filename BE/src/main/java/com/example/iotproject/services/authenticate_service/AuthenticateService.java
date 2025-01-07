package com.example.iotproject.services.authenticate_service;

import com.example.iotproject.model.authenticate_request.AuthenticateRequest;
import com.example.iotproject.model.authenticate_response.AuthenticateResponse;
import com.example.iotproject.repository.user_repository.UserRepository;
import com.example.iotproject.services.jwt_service.JwtService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class AuthenticateService {
    private final AuthenticationManager authenticationManager;

    @Autowired
    private final UserRepository userRepository;

    @Autowired
    private final JwtService jwtService;

    public AuthenticateResponse authenticate(AuthenticateRequest request) {
        authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        request.getAccount(),
                        request.getPassword()));
        var user = userRepository.findUserByAccount(request.getAccount());

        var jwtToken = jwtService.generateTokenWithUserDetails(user.get());

        return AuthenticateResponse.builder()
                .token(jwtToken)
                .account(user.get().getAccount())
                .build();
    }
}
