package cn.aweiyo.springboot.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import cn.aweiyo.springboot.domain.User;
import cn.aweiyo.springboot.dto.UserDTO;
import cn.aweiyo.springboot.service.UserService;
import cn.aweiyo.springboot.util.CacheUtil;

@RestController
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private RedisTemplate redisTemplate;

	@RequestMapping
	public String hello() {
		return "hello springboot";
	}

	/**
	 * 返回DTO
	 */
	@RequestMapping("pojo")
	public User showUser() {
		// 创建User对象
		User user = new User();
		// user.setId(1);
		user.setSex("男");
		user.setUsername("aweiyo");
		user.setBirthday(new Date());
		user.setAddress("深圳");
		return user;
		// 返回结果
		// {"id":1,"userName":"aweiyo","birthday":1502536577774,"sex":"男","address":"深圳"}

	}

	/**
	 * 返回集合
	 */
	@RequestMapping("maps")
	public Map<Object, String> showMps() {
		HashMap<Object, String> map = new HashMap<Object, String>();
		map.put("username", "aweiyo");
		map.put("age", "19");
		return map;
		// 返回结果
		// {"age":"19","username":"aweiyo"}
	}

	/**
	 * 返回list
	 */
	@RequestMapping("list")
	public List<Object> showList() {
		List<Object> list = new ArrayList<Object>();
		list.add("1");
		list.add("2");
		return list;
		// 返回结果
		// ["1","2"]
	}

	/**
	 * 返回list集合对象
	 */
	@RequestMapping("showListDTO")
	public List<User> showListDTO() {
		List<User> list = new ArrayList<>();
		User user1 = new User();
		// user1.setId(1);
		user1.setSex("男");
		user1.setUsername("aweiyo");
		user1.setBirthday(new Date());
		user1.setAddress("深圳");

		User user2 = new User();
		// user2.setId(1);
		user2.setSex("男");
		user2.setUsername("aweiyo");
		user2.setBirthday(new Date());
		user2.setAddress("深圳");

		list.add(user1);
		list.add(user2);

		return list;
		// [
		// {
		// "id":1,"userName":"aweiyo","birthday":1502543705227,"sex":"男","address":"深圳"
		// },
		// {
		// "id":2,"userName":"aweiyo","birthday":1502543705227,"sex":"男","address":"深圳"
		// }
		// ]
	}

	@RequestMapping("jsp")
	public ModelAndView showModelAndView() {
		return new ModelAndView("index");
	}

	/**
	 * 查询所有用户的接口
	 * 
	 * @return
	 */
	@RequestMapping(value = "findAllUser", method = RequestMethod.GET)
	public List<UserDTO> findAllUser() {
		return userService.findAll();
	}

	/**
	 * 新增用户（MD5加密）
	 */
	@RequestMapping(value = "insertUser", method = RequestMethod.POST)
	public String insertUser(@RequestBody UserDTO userDTO) {
		userDTO.setBirthday(new Date());
		userDTO.setToken(UUID.randomUUID().toString());
		return userService.insertUser(userDTO);
	}

	/**
	 * 测试SpringBoot整合事物
	 */
	@RequestMapping(value = "testTransaction", method = RequestMethod.POST)
	@ResponseBody
	public String testTransaction() {
		String resultCode = "";
		try {
			userService.testTransaction();
			resultCode = "0";
		} catch (Exception e) {
			resultCode = "1";
			e.printStackTrace();
		}
		return resultCode;
	}

	/**
	 * 1、在https://github.com/dmajkic/Redis/downloads下载64位
	 * 2、（windows下）找到刚下载的地址，redis-server.exe redis.conf
	 * 测试SpringBoot整合Redis
	 */
	@RequestMapping(value = "testRedis", method = RequestMethod.POST)
	@ResponseBody
	public String testRedis() {
		String key = "test";
		ValueOperations<String, String> operations = redisTemplate.opsForValue();

		// 缓存存在
		boolean hasKey = redisTemplate.hasKey(key);
		if (hasKey) {
			String city = operations.get(key);

			System.out.println("CityServiceImpl.findCityById() : 从缓存中获取了城市 >> " + city.toString());
			return city;
		}

		// 从 DB 中获取城市信息
		String city = "空城";

		// 插入缓存
		operations.set(key, city, 120, TimeUnit.SECONDS);
		System.out.println("CityServiceImpl.findCityById() : 城市插入缓存 >> " + city.toString());

		return city;
	}
	
	/**
	 * 模拟初始化网站缓存
	 */
	@RequestMapping(value = "initWebsiteCache", method = RequestMethod.GET)
	@ResponseBody
	public String initWebsiteCache() {
//		String key = "test";
//		ValueOperations<String, String> operations = redisTemplate.opsForValue();
//
//		// 缓存存在
//		boolean hasKey = redisTemplate.hasKey(key);
//		if (hasKey) {
//			String city = operations.get(key);
//
//			System.out.println("CityServiceImpl.findCityById() : 从缓存中获取了城市 >> " + city.toString());
//			return city;
//		}
//
//		// 从 DB 中获取城市信息
//		String city = "空城";
//
//		// 插入缓存
//		operations.set(key, city, 120, TimeUnit.SECONDS);
//		System.out.println("CityServiceImpl.findCityById() : 城市插入缓存 >> " + city.toString());
//
//		return city;
		String resultCode = "0";
		try {
			CacheUtil.initYpWebsiteConfigCache();
		} catch (Exception e) {
			resultCode = "1";
			e.printStackTrace();
		}
		return resultCode;
	}
}
