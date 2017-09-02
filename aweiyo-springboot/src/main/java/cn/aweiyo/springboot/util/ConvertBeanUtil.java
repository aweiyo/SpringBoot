package cn.aweiyo.springboot.util;

import java.util.List;

import org.springframework.beans.BeanUtils;

public class ConvertBeanUtil {

	public List<Object> copyBeanList(List<Object> sourceList, List<Object> targetList) {
		
		for (Object target : targetList) {
			Object source = new Object();
			BeanUtils.copyProperties(source, target);
			sourceList.add(source);
		}
		
		return sourceList;
		
	}
}
