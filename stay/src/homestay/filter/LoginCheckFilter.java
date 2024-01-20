package homestay.filter;

import homestay.dao.Data;
import homestay.utils.JwtUtil;
import homestay.utils.UserUtil;
import org.json.JSONException;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = "/*")
//@WebFilter("/*")
public class    LoginCheckFilter implements Filter {

    private String[] noCheckedPaths = {
            "login",
            "register",
            "forgot-password",
            "reset",
            "verify",
            "index",
            "assets",
            "email"
    };

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        String src = "web";
        try {
            src = Data.getPageParameters(req, resp).getParam().has("src") ? Data.getPageParameters(req, resp).getParam().getString("src") : "web";
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
        //  先获取token
        String loginJwt = req.getHeader("token");
        if (loginJwt == null) {
            // 查看cookie是否有, cookie 有直接登录
            Cookie[] cookies = req.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; ++i) {
                    if (cookies[i].getName().equals("token")) {
                        loginJwt = cookies[i].getValue();
                    }
                }
            }
        }

        //        1. url
        String url = req.getRequestURI().toString();
//        System.out.println("request url:" + url);
        // 处理自动登录

        if((url.equals("/") || url.isEmpty() || url.contains("login")) && !src.equals("miniapp")) {
            if(autoLogin(req, resp, loginJwt)) {return;}
        }
        // 通过必要的请求
        if (!this.isRequiringCheck(url)) {
            filterChain.doFilter(req, resp);
            return;
        }
        if (loginJwt == null || loginJwt.equals("")) {
            req.setAttribute("msg", "登录已过期");
            req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
            return;
        }
//        System.out.println("loginJwt: " + loginJwt);
//        校验
        try {
            JwtUtil.parseJwt(loginJwt);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("msg", "登录已过期");
            req.getRequestDispatcher("/user/login.jsp").forward(req, resp);
        }

        filterChain.doFilter(req, resp);
    }

    @Override
    public void destroy() {

    }

    boolean isRequiringCheck(String path) {
        if (path.equals("/")) return false;
        for (String checkPath : this.noCheckedPaths) {
            if (path.contains(checkPath)) {
                return false;
            }
        }
        return true;
    }

    private boolean autoLogin(HttpServletRequest req, HttpServletResponse resp, String jwt) {
        String auto = UserUtil.getUserByKey(req, "auto");
        if (auto == null || auto.equals("")) return false;
        if (auto.equals("true")) {
            // 自动登录
            if (jwt != null && !jwt.equals("")) {
                try {
                    System.out.println(UserUtil.getUserId(req) + "auto login:" + auto);
                    JwtUtil.parseJwt(jwt);
                    resp.sendRedirect("/market/house_market.jsp");
                    return true;
                } catch (Exception e) {
                    return false;
                }
            }
            return false;
        }
        return false;
    }
}
