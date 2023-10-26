package com.example.service.impl;

import java.util.Optional;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dto.UsersDTO;
import com.example.mapper.UserMapper;
import com.example.service.UserSecuService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserServiceImpl implements UserSecuService{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public UserServiceImpl(SqlSessionTemplate ss) {
		this.sqlSession = ss;
	}
	
    /**
     * 로그인 구현체
     *
     * @param userDto UserDto
     * @return Optional<UserDto>
     */
	@Override
	public Optional<UsersDTO> login(UsersDTO userDto) {
		UserMapper um = sqlSession.getMapper(UserMapper.class);
		return um.login(userDto);
	}

}
