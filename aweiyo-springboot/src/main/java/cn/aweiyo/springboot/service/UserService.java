package cn.aweiyo.springboot.service;

import java.util.List;

import cn.aweiyo.springboot.domain.User;
import cn.aweiyo.springboot.dto.UserDTO;

public interface UserService {

	public List<UserDTO> findAll();

	public String insertUser(UserDTO userDTO);
	
	public void deleteUser(String id);
	
	public void updateUser(UserDTO userDTO);
	
	public User findUserById(String userId);
	
	public UserDTO queryUserByToken(String token);

	public void testTransaction();

}
