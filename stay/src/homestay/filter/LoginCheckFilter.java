package homestay.filter;

import homestay.utils.JwtUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = "/*")
//@WebFilter("/*")
public class LoginCheckFilter implements Filter {

    private String[] noCheckedPaths = {
            "login",
            "register",
            "verify",
            "index",
            "assets"
    };

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
        // 通过必要的请求
        if(!this.isRequiringCheck(url)) {
            filterChain.doFilter(req, resp);
            return;
        }
        //        3. token check
        String loginJwt = req.getHeader("token");
        if(loginJwt == null) {
            // 查看cookie是否有, cookie 有直接登录
            Cookie[] cookies = req.getCookies();
            for(int i = 0; i  < cookies.length; ++i) {
                if (cookies[i].getName().equals("token")) {
                    loginJwt = cookies[i].getValue();
                }
            }
        }
        if(loginJwt == null) {
            req.setAttribute("msg", "登录已过期");
            req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
            return;
        }
        System.out.println("loginJwt: " + loginJwt);
//        校验
        try {
            JwtUtil.parseJwt(loginJwt);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "登录已过期");
            req.getRequestDispatcher("/user/login.html").forward(req, resp);
        }
        filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {

    }

    boolean isRequiringCheck(String path) {
        if(path.equals("/")) return false;
        for(String checkPath: this.noCheckedPaths) {
            if(path.contains(checkPath)) {
                return false;
            }
        }
        return true;
    }
}
