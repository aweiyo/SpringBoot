package cn.aweiyo.springboot.controller.user;

import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import cn.aweiyo.springboot.service.UserService;

@RestController
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private RedisTemplate redisTemplate;

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
	
}
