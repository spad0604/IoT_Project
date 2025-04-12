package com.example.iotproject.model.authenticate_request;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
public class AuthenticateRequest {
    private String account;
    private String password;
}
