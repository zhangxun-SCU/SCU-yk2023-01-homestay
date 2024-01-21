package homestay.servlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import homestay.dao.Data;
import homestay.dao.UserDao;
import homestay.entity.User;
import homestay.service.LoginService;
import homestay.service.verify.VerifyService;
import homestay.utils.JwtUtil;
import homestay.utils.UserUtil;
import org.json.JSONException;
import org.json.JSONObject;


@WebServlet({"/login", "/logout"})
public class LoginServlet extends HttpServlet {

    private Data data = null;
    public final static Map<String,String> userIdTokenMap=new ConcurrentHashMap<>();

//    private final ServletContext context = this.getServletContext();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            data = Data.getPageParameters(req, resp);
            if(data.getParam().getString("src").equals("miniapp")) {
//                context.log("login: user: " + data.getParam().getString("userId") + "from web browser");
                doMiniappLogin(req, resp);
            }  else if(data.getParam().getString("src").equals("miniapp_auto")) {
                UserDao userDao = new UserDao();
                User user = userDao.queryUserById(UserUtil.getUserId(req));
                JSONObject resJson = new JSONObject();
                resJson.put("resCode", "00000");
                resJson.put("loginInfo", "success");
                resJson.put("userId", user.id);
                resJson.put("userPermission", user.permission);
                resJson.put("avatar", user.avatarURL);
                resJson.put("userType",user.permission);
                resp.setContentType("application/json; charset=UTF-8");
                resp.getWriter().println(resJson);
            }  else {
//                context.log("login: user: " + data.getParam().getString("userId") + "from web miniapp");
                doWebLogin(req, resp);
            }
        } catch (JSONException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doWebLogin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = session.getId();
        try {
            // 图形验证码
            String serverCode = (String) session.getAttribute("SESSION_VERIFY_CODE_" + id);
            JSONObject resJson = new JSONObject();  /* 响应数据 */
            LoginService loginService = new LoginService();
            VerifyService imgVerifyService = new VerifyService();
            if(imgVerifyService.checkCode(data, serverCode, resJson)) {
                // 图形验证码正确
                if(loginService.checkLogin(data, serverCode, resJson)){
                    Cookie cookie = new Cookie("token", resJson.getString("token"));
                    cookie.setMaxAge(60*60*24*7);
                    String loginToken = UUID.randomUUID().toString();
                    Cookie cookieLogin = new Cookie("LOGIN_TOKEN", loginToken);
                    String userId= data.getParam().getString("id");
                    Cookie userIdCookie=new Cookie("USER_ID",userId);
                    System.out.println("logintoken:"+loginToken);
                    resp.addCookie(cookie);
                    resp.addCookie(cookieLogin);
                    resp.addCookie(userIdCookie);

                    userIdTokenMap.put(userId,loginToken);
                }
            }
            // 返回
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(resJson);
        } catch (JSONException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doMiniappLogin(HttpServletRequest req, HttpServletResponse resp) {
        try {
            // 图形验证码
            JSONObject resJson = new JSONObject();  /* 响应数据 */
            LoginService loginService = new LoginService();
            VerifyService imgVerifyService = new VerifyService();
            System.out.println(11);
            if(loginService.checkLogin(data, resJson)) {
                System.out.println(22);
                Cookie cookie = new Cookie("token", resJson.getString("token"));
                cookie.setMaxAge(60 * 60 * 24 * 7);
                String loginToken = UUID.randomUUID().toString();
                Cookie cookieLogin = new Cookie("LOGIN_TOKEN", loginToken);
                String userId = data.getParam().getString("id");
                Cookie userIdCookie = new Cookie("USER_ID", userId);
                System.out.println("logintoken:" + loginToken);
                resp.addCookie(cookie);
                resp.addCookie(cookieLogin);
                resp.addCookie(userIdCookie);
                userIdTokenMap.put(userId,loginToken);
            }
            // 返回
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(resJson);
        } catch (JSONException | SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }



    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 删除cookie
        Cookie cookie = new Cookie("token", null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        resp.addCookie(cookie);

        Cookie loginTokenCookie = new Cookie("LOGIN_TOKEN", null);
        loginTokenCookie.setMaxAge(0);
        loginTokenCookie.setPath("/");
        resp.addCookie(loginTokenCookie);

        Cookie userIdCookie = new Cookie("USER_ID", null);
        userIdCookie.setMaxAge(0);
        userIdCookie.setPath("/");
        resp.addCookie(userIdCookie);

        // 使 HttpSession 失效（注销用户）
        req.getSession().invalidate();

        // 重定向到登录页面
        resp.sendRedirect("/user/login.jsp");
    }
}
