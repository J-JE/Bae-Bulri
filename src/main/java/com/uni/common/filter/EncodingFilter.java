package com.uni.common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class EncodingFilter
 */
//요청이 오는 모든 서블렛이 이 필터를 거치게 한 다음 방식이 post인 것만 바꿈
//@WebFilter("/*") 인코딩 필터 이후에 실행할 필터가 또 있으면 실행하기 위해 webFilter를 지우고(어노테이션) web.xml에서 설정
public class EncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncodingFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		System.out.println("=========================인코딩 필터 동작 start=========================");
		
		//post인것만 처리 되도록처리
		//우리는 서블릿에서 HttpServletRequest를 쓰고있기 때문에 doFilter에서 사용하는 ServletRequest를 형변환 시켜준다.
		//html의 form태그 method 속성에 get인지 post인지 작성하기 때문에 getMethod()를 사용해 post방식을 찾는다.
		if(((HttpServletRequest)request).getMethod().equalsIgnoreCase("post")) {
			System.out.println("=========================post방식이 요청됨=========================");
			request.setCharacterEncoding("UTF-8"); //post방식으로 요청된 것에 인코딩
			//기존에 setCharacterEncoding을 사용했던 기록을 찾아서 주석처리 하기
		}
		chain.doFilter(request, response);
		
		
		System.out.println("=========================서블릿 동작하고 나서 실행=========================");
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
