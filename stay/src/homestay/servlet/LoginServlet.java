package homestay.servlet;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

import homestay.dao.Data;
import homestay.service.LoginService;
import homestay.service.VerifyService;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private Data data = null;


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = session.getId();
        try {
            // 图形验证码
            String serverCode = (String) session.getAttribute("SESSION_VERIFY_CODE_" + id);
            data = Data.getPageParameters(req, resp);
            JSONObject resJson = new JSONObject();  /* 响应数据 */
            LoginService loginService = new LoginService();
            VerifyService imgVerifyService = new VerifyService();
            if(imgVerifyService.checkCode(data, serverCode, resJson)) {
               // 图形验证码正确
                if(loginService.checkLogin(data, serverCode, resJson)) {
                    // 登录成功
                    Cookie cookie = new Cookie("token", resJson.getString("token"));
                    cookie.setMaxAge(60*60*24);
                    resp.addCookie(cookie);
                }
            }
            // 返回
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(resJson);
        } catch (JSONException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html; charset=UTF-8");
        resp.getWriter().println("login");
    }
}
