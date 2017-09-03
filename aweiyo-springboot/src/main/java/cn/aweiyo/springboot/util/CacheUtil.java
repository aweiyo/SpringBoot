package cn.aweiyo.springboot.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * 缓存工具类
 * 
 * @author aw
 *
 */
public class CacheUtil {

	@Autowired
	private static RedisUtil redisUtil;

	/**
	 * 初始化项目缓存
	 * 
	 * @param bid
	 */
	public static void initYpWebsiteConfigCache() {
		redisUtil = new RedisUtil();
		Map<Object, Object> condition = new HashMap<Object, Object>();
		// 从DB获取需要缓存到Redis中的内容(模拟)
		// 循环放入Map中
		Map<String, String> configValMap = new HashMap<String, String>();
		configValMap.put("website_config_key", "website_config_value");
		configValMap.put("city_config_key", "city_config_value");
		
		// 存HashMap值
		Map<String, String> hashGetAll = redisUtil.hashGetAll(CacheKeyContants.WEBSITE_CONFIG);
		// 判断缓存中是否存在，若存在删除缓存中的数据
		if (redisUtil.existKey(CacheKeyContants.WEBSITE_CONFIG).booleanValue()) {
			redisUtil.delKey(CacheKeyContants.WEBSITE_CONFIG);
		}
		redisUtil.hashMultipleSet(CacheKeyContants.WEBSITE_CONFIG, configValMap);
	}

	/**
	 * 重置项目缓存
	 * 
	 * @param bid
	 */
	public static void resetYpWebsiteConfigCache() {
		redisUtil.delKey(CacheKeyContants.WEBSITE_CONFIG);
		initYpWebsiteConfigCache();
	}
}
