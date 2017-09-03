package cn.aweiyo.springboot.util;

import java.util.List;
import java.util.Map;

/**
 * redis操作工具类
 * @author aw
 *
 */
public class RedisCacheUtil {

	private static RedisUtil redisUtil;

	public static RedisUtil getRedisUtil() {
		return redisUtil;
	}

	public static void setRedisUtil(RedisUtil redisUtil) {
		RedisCacheUtil.redisUtil = redisUtil;
	}

	public static Object getObject(String key) {
		if (StringUtil.hasText(key)) {
			return redisUtil.ObjectGet(key);
		}
		return null;
	}

	public static String getMapObjectValue(String key, String field) {
		if (StringUtil.hasText(key) && StringUtil.hasText(field)) {
			Map<Object, Object> map = getMapObject(key);
			if (map != null && map.size() > 0) {
				return StringUtil.trim(map.get(field));
			}
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public static Map<Object, Object> getMapObject(String key) {
		if (StringUtil.hasText(key) && isExistCache(key)) {
			Object object = redisUtil.ObjectGet(key);
			if (object != null) {
				return (Map<Object, Object>) object;
			}
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	public static List<Map<Object, Object>> getListObject(String key) {
		if (StringUtil.hasText(key) && isExistCache(key)) {
			Object object = redisUtil.ObjectGet(key);
			if (object != null) {
				return (List<Map<Object, Object>>) object;
			}
		}
		return null;
	}

	public static String addCache(String key, Object object) {
		if (StringUtil.hasText(key)) {
			return redisUtil.ObjectSet(key, object);
		}
		return null;
	}

	public static long delCache(String key) {
		if (StringUtil.hasText(key)) {
			return redisUtil.delKey(key).longValue();
		}
		return 0L;
	}

	public static boolean isExistCache(String key) {
		boolean result = false;
		if (StringUtil.hasText(key)) {
			result = redisUtil.existKey(key).booleanValue();
		}
		return result;
	}
	
	public static long hashSet(String key, String field, String value, final int expire) {
		if (StringUtil.hasText(key)) {
			return redisUtil.hashSet(key, field, value, expire);
		}
		return 1;
	}

	public static String hashGet(String key, String field) {
		if (StringUtil.hasText(key)) {
			return redisUtil.hashGet(key, field);
		}
		return null;
	}
	
	public static long hashDel(String key, String field) {
		if (StringUtil.hasText(key)) {
			return redisUtil.hashDel(key, field);
		}
		return 0;
	}

}
