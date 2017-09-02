package cn.aweiyo.springboot.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.springframework.beans.factory.annotation.Autowired;

import cn.aweiyo.springboot.dto.UserDTO;
import cn.aweiyo.springboot.service.UserService;

/**
 * 过滤器
 * @author aw
 *
 */
@WebFilter(filterName="authorityFilter",urlPatterns="/*")
public class AuthorityFilter implements Filter{
	
	@Autowired
	private UserService userService;
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		List<UserDTO> list = userService.findAll();
		System.err.println(list.get(0).toString());
		System.err.println("============AuthorityFilter.doFilter============");
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		System.err.println("============AuthorityFilter.destroy============");
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.err.println("============AuthorityFilter.init============");
	}

}
