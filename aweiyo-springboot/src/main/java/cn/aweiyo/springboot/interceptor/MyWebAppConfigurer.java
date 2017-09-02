package cn.aweiyo.springboot.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * 拦截器配置类
 * @author aw
 *
 */
@Configuration
public class MyWebAppConfigurer extends WebMvcConfigurerAdapter {

	@Autowired
	private MyInterceptor MyInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// TODO Auto-generated method stub
		registry.addInterceptor(MyInterceptor).addPathPatterns("/**");
	}

}
