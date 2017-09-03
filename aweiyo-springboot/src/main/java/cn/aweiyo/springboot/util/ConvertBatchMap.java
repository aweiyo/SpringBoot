package cn.aweiyo.springboot.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ConvertBatchMap {

	public static Map<Object, Object> convertBatch(String value, String field) {
		Map<Object, Object> result = new HashMap<Object, Object>();
		if (StringUtil.hasText(value) && StringUtil.hasText(field)) {
			String[] values = StringUtil.split(value, ",");
			if (values != null && values.length > 0) {
				List<String> valueList = new ArrayList<String>();
				for (String tmp : values) {
					valueList.add(StringUtil.trim(tmp));
				}
				result.put(field, valueList);
			}
		} else {
			result.put(field, null);
		}
		return result;
	}

	public static Map<Object, Object> convertBatch(Map<Object, Object> condition, String key, String field) {
		Map<Object, Object> result = new HashMap<Object, Object>();
		result.putAll(condition);
		if (condition != null && condition.size() > 0 && StringUtil.hasText(key) && StringUtil.hasText(field)) {
			String value = StringUtil.trim(condition.get(key));
			result.putAll(convertBatch(value, field));
		}
		return result;
	}
}
