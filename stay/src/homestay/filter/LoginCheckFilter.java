package homestay.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(urlPatterns = {"/user/profile.html", "/seller/*"})
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
        //        2. 通过登录和注册请求
        if(url.contains("login") || url.contains("register")) {
            filterChain.doFilter(req, resp);
            return;
        }
        //        3. token check
//        String loginJwt = req.getHeader("Access_token");
//        if(loginJwt.length() == 0) {
//            resp.getWriter().println("not login");
//        }
    }

    @Override
    public void destroy() {

    }
}
