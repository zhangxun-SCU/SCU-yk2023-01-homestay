package homestay.servlet.verify;

import homestay.dao.Data;
import homestay.service.verify.EmailService;
import org.apache.commons.mail.EmailException;
import org.json.JSONException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/email")
public class EmailServlet extends HttpServlet {
    // 发邮件
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = session.getId();
        try {
            Data data = Data.getPageParameters(req, resp);
            EmailService service = new EmailService();
            String verifyCode = service.sendEmail(data);
            // 存入session
            session.setAttribute("SESSION_EMAIL_VERIFY_CODE_" + id, verifyCode);
            session.setMaxInactiveInterval(300);  /*  5min清楚session，让验证码过期  */
        } catch (JSONException | EmailException e) {
            e.printStackTrace();
        }
    }
}
