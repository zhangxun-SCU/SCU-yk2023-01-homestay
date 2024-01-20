package homestay.filter;

import homestay.dao.UserDao;
import homestay.entity.User;
import homestay.servlet.LoginServlet;
import org.json.JSONException;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Objects;

@WebFilter({"/admin/", "/superadmin/", "/seller/"})
public class PermissionFilter implements Filter {

    private final UserDao userDao;

    public PermissionFilter() {
        this.userDao = new UserDao();
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 初始化代码（如果有需要）
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // 获取用户 ID，这里假设用户 ID 存储在 session 中
        HttpSession session = httpRequest.getSession();
//        String userId = (String) session.getAttribute("user_id");

        /*

        // 判断用户是否已登录
        if (userId == null || userId.isEmpty()) {
            // 用户未登录，可以根据实际需求进行处理，这里简单示例为返回 401 状态码
            httpResponse.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }
*/
        // 获取请求路径
        String requestPath = httpRequest.getRequestURI();

        // 判断是否需要权限验证
        String userId = null;
        String token = null;

        for (Cookie cookie : httpRequest.getCookies()) {
            if ("USER_ID".equals(cookie.getName())) {
                userId = cookie.getValue();
            }
            if ("LOGIN_TOKEN".equals(cookie.getName())) {
                token = cookie.getValue();
            }
        }
        if (userId == null || token == null) {
            httpResponse.setStatus(HttpServletResponse.SC_FORBIDDEN);
            return;
        }
        if (checkUserPermission(userId, token, requestPath)) {
            // 用户有权限，继续执行请求
            chain.doFilter(request, response);
        }

    }

    @Override
    public void destroy() {
        // 销毁代码（如果有需要）
    }

//    private boolean isPathRequiringPermission(String path) {
////1
//
//
//        String[] pathsToCheck = {"/admin/", "/superadmin/"};
//
//
//        for (String checkPath : pathsToCheck) {
//           if (path.contains(checkPath)) {
//                return true;
//            }
//        }
//
//
//       return false;
//
////2
//        /*
//        管理员可以跳转到操作界面，它包含全部权限
//
//        */
//        // 根据路径判断是否需要权限验证，根据实际需求实现
//        // 这里仅作示例，假设路径中包含 "/xxxx/" 的都需要权限验证
//        //return path.contains("/seller/");
//    }

    private boolean checkUserPermission(String userId, String token, String requestPath) {
        // 根据 userId 去数据库或其他地方检查用户的权限，根据实际需求实现
        // 这里仅作示例，检查 permission 是否为 "high"，是的话就认为有权限
        String expectedToken = LoginServlet.userIdTokenMap.get(userId);

//        if (!Objects.equals(token, expectedToken)) {
//            return false;
//        }

        try {
            // 查询用户的 permission
            User user = userDao.queryUserById(userId);
            System.out.println("User permission: " + user.permission);
            // 判断 permission 是否为 "high"
            String permission = user.permission;
            if (requestPath.startsWith("/superadmin")) {
                return "superhigh".equals(permission);
            } else if (requestPath.startsWith("/admin")) {
                return "high".equals(permission);
            } else if (requestPath.startsWith("/seller")) {
                return "middle".equals(permission);
            }
            return false;
        } catch (SQLException | JSONException e) {
            // 处理异常，可以抛出或记录到日志
            e.printStackTrace();
            return false;
        }
    }


    private boolean isSuperAdministrator(String userId, String token) {
        // 根据 userId 去数据库或其他地方检查用户是否为超级管理员，根据实际需求实现
        // 这里仅作示例，检查 userType 是否为 "superhigh"
        // 这里仅作示例，检查 permission 是否为 "high"，是的话就认为有权限
        String expectedToken = LoginServlet.userIdTokenMap.get(userId);

//        if (!Objects.equals(token, expectedToken)) {
//            return false;
//        }
        try {
            // 查询用户的 permission
            User user = userDao.queryUserById(userId);

            // 判断 permission 是否为 "high"
            String permission = user.permission;
            return "superhigh".equals(permission);
        } catch (SQLException | JSONException e) {
            // 处理异常，可以抛出或记录到日志
            e.printStackTrace();
            return false;
        }
    }

}