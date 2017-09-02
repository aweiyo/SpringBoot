package cn.aweiyo.springboot.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogUtils {

	public static <T> Logger getLog(Class<T> clazz){
		return LoggerFactory.getLogger(clazz);
	} 
	
}
