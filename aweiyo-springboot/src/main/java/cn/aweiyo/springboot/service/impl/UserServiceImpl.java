package cn.aweiyo.springboot.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.aweiyo.springboot.domain.User;
import cn.aweiyo.springboot.dto.UserDTO;
import cn.aweiyo.springboot.mapper.UserMapper;
import cn.aweiyo.springboot.service.UserService;
import cn.aweiyo.springboot.util.LogUtils;

@Service
public class UserServiceImpl implements UserService {

	private static final Logger logger = LogUtils.getLog(UserServiceImpl.class);
	
	/**
	 * 自动注入Bean
	 */
	@Autowired
	private UserDTO userDTO;
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<UserDTO> findAll() {
		List<UserDTO> targetList = new ArrayList<>();
		List<User> sourceList = userMapper.findAll();
		for (Object source : sourceList) {
			UserDTO target = new UserDTO();
			BeanUtils.copyProperties(source, target);
			targetList.add(target);
		}
		return targetList;
	}

	@Override
	public String insertUser(UserDTO userDTO) {
		String resultCode = "";
		try {
			userMapper.insertUser(userDTO);
			resultCode = "0";
		} catch (Exception e) {
			resultCode = "1";
			logger.error("插入用户出错：UserServiceImpl.insertUser--->" + e);
		}
		return resultCode;
	}

	@Override
	public void deleteUser(String id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateUser(UserDTO userDTO) {
		// TODO Auto-generated method stub

	}

	@Override
	public User findUserById(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserDTO queryUserByToken(String token) {
		User user = null;
		UserDTO userDTO = new UserDTO();
		try {
			user = userMapper.queryUserByToken(token);
			BeanUtils.copyProperties(user, userDTO);
		} catch (Exception e) {
			System.err.println("根据token查询用户出错--->" + e);
			logger.error("根据token查询用户出错--->" + e);
		}
		return userDTO;
	}
	
	
	/**
	 * 整合事物
	 */
	@Transactional(propagation = Propagation.REQUIRED)
	@Override
	public void testTransaction() {
		userDTO.setUsername("testTransaction");
		userDTO.setAddress("address");
		userDTO.setBirthday(new Date());
		userDTO.setPassword("88888");
		userDTO.setSex("男");
		userDTO.setToken("token");
		
		userMapper.insertUser(userDTO);
	}

}
