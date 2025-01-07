package com.example.iotproject.model.authenticate_response;

import lombok.*;

@Data
@Builder
@Setter
@Getter
@RequiredArgsConstructor
@AllArgsConstructor
public class AuthenticateResponse {
    private String token;
    private String account;
}
