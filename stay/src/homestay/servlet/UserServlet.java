package homestay.servlet;

import homestay.dao.Data;
import homestay.service.UserService;
import org.apache.commons.mail.EmailException;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet({"/email/send", "/register", "/reset"})
public class UserServlet extends HttpServlet {

    // 发邮件
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = session.getId();
        try {
            Data data = Data.getPageParameters(req, resp);
            UserService service = new UserService();
            String verifyCode = service.sendEmail(data);
            // 存入session
            session.setAttribute("SESSION_EMAIL_VERIFY_CODE_" + id, verifyCode);
            session.setMaxInactiveInterval(300);  /*  5min清楚session，让验证码过期  */
        } catch (JSONException | EmailException e) {
            e.printStackTrace();
        }
    }

    // 注册
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = session.getId();
        try {
            Data data = Data.getPageParameters(req, resp);
            JSONObject resJson = new JSONObject();  /* 响应数据 */
            UserService service = new UserService();

            // 取session数据
            String serverEmailVerifyCode = (String) session.getAttribute("SESSION_EMAIL_VERIFY_CODE_" + id);
            if(service.checkEmailVerifyCode(data, serverEmailVerifyCode, resJson)) {
                // 邮箱验证码正确，执行注册
                System.out.println("[RegisterServlet] 邮箱验证正确");
                service.register(data, resJson);
            } else {
                System.out.println("[RegisterServlet] 邮箱验证错误");
            }
            // 返回
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(resJson);
        } catch (JSONException | SQLException e) {
            e.printStackTrace();
        }
    }


    // 修改密码
    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Data data = Data.getPageParameters(req, resp);
            JSONObject resJson = new JSONObject();
            UserService service = new UserService();
            service.modifyUserInfo(data, resJson);
            // 返回
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(resJson);
        } catch (JSONException | SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
