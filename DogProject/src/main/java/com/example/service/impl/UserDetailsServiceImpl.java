package com.example.service.impl;

import java.util.Collections;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import com.example.dto.UserDetailsDTO;
import com.example.dto.UsersDTO;
import com.example.service.UserSecuService;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{

	private final UserSecuService userService;
	
	public UserDetailsServiceImpl(UserSecuService us) {
		this.userService = us;
	}
	
    @Override
    public UserDetails loadUserByUsername(String userId) {
        UsersDTO userDto = new UsersDTO(userId, null, null, null);

        // 사용자 정보가 존재하지 않는 경우
        if (userId == null || userId.equals("")) {
            return userService.login(userDto)
            		.map(u -> new UserDetailsDTO(u, Collections.singleton(new SimpleGrantedAuthority(u.getUserID()))))
                    .orElseThrow(() -> new AuthenticationServiceException("Authentication service error"));
        }
        // 비밀번호가 맞지 않는 경우
        else {
            return userService.login(userDto)
                    .map(u -> new UserDetailsDTO(u, Collections.singleton(new SimpleGrantedAuthority(u.getUserID()))))
                    .orElseThrow(() -> new BadCredentialsException("Bad credentials"));
        }
    }	
}
