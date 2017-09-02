package cn.aweiyo.springboot.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import cn.aweiyo.springboot.domain.User;
import cn.aweiyo.springboot.dto.UserDTO;

@Mapper
public interface UserMapper {
	public List<User> findAll();

	public void insertUser(UserDTO userDTO);
	
	public User queryUserByToken(String  token);
}
