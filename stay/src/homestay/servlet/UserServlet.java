package homestay.servlet;

import homestay.dao.Data;
import homestay.service.EmailService;
import homestay.service.UserService;
import homestay.service.VerifyService;
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

@WebServlet({"/register", "/reset"})
public class UserServlet extends HttpServlet {



    // 注册
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = session.getId();
        try {
            Data data = Data.getPageParameters(req, resp);
            JSONObject resJson = new JSONObject();  /* 响应数据 */
            EmailService emailService = new EmailService();
            UserService userService = new UserService();
            VerifyService imgVerifyService = new VerifyService();
            // 取session数据
            String serverEmailVerifyCode = (String) session.getAttribute("SESSION_EMAIL_VERIFY_CODE_" + id);
            String serverImgVerifyCOde = (String) session.getAttribute("SESSION_VERIFY_CODE_" + id);
            if(imgVerifyService.checkCode(data, serverImgVerifyCOde, resJson)) {
                if(emailService.checkEmailVerifyCode(data, serverEmailVerifyCode, resJson)) {
                    // 邮箱验证码正确，执行注册
                    System.out.println("[RegisterServlet] 邮箱验证正确");
                    userService.register(data, resJson);
                } else {
                    System.out.println("[RegisterServlet] 邮箱验证错误");
                }
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
        HttpSession session = req.getSession();
        String id = session.getId();
        String serverEmailVerifyCode = (String) session.getAttribute("SESSION_EMAIL_VERIFY_CODE_" + id);
        String serverImgVerifyCOde = (String) session.getAttribute("SESSION_VERIFY_CODE_" + id);
        try {
            Data data = Data.getPageParameters(req, resp);
            JSONObject resJson = new JSONObject();
            UserService userService = new UserService();
            VerifyService imgVerifyService = new VerifyService();
            EmailService emailService = new EmailService();
            if(imgVerifyService.checkCode(data, serverImgVerifyCOde, resJson)) {
                // 图形校验通过
                if(emailService.checkEmailVerifyCode(data, serverEmailVerifyCode, resJson)) {
                    // 邮箱校验通过
                    userService.modifyUserInfo(data, resJson);
                }
            }
            // 返回
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(resJson);
        } catch (JSONException | SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
