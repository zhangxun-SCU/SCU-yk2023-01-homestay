package homestay.filter;

import homestay.utils.JwtUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {
        "/user/profile.html",
        "/seller/*",
        "/frame/*",})
//@WebFilter("/*")
public class LoginCheckFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req =(HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        //        1. url
        String url = req.getRequestURI().toString();
        System.out.println("request url:" + url);
        if(url.equals("/")) {
            filterChain.doFilter(req, resp);
            return;
        }
        //        2. 通过登录和注册请求
        if(url.contains("login") || url.contains("register")) {
            filterChain.doFilter(req, resp);
            return;
        }
        //        3. token check
        String loginJwt = req.getHeader("token");
        if(loginJwt == null) {
            // 查看cookie是否有, cookie 有直接登录
            Cookie[] cookies = null;
            cookies = req.getCookies();
            for(int i = 0; i  < cookies.length; ++i) {
                if (cookies[i].getName().equals("token")) {
                    loginJwt = cookies[i].getValue();
                }
            }
        }
        if(loginJwt == null) {
            resp.getWriter().println("not login");
        }
        System.out.println(loginJwt);
//        校验
        try {
            JwtUtil.parseJwt(loginJwt);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("登录令牌失效");
            resp.getWriter().println("not login");
            return;
        }
        filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {

    }
}
