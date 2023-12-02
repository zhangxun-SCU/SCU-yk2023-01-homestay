package homestay.servlet;

import homestay.dao.Data;
import homestay.service.VerifyService;
import homestay.utils.VerifyUtil;
import org.json.JSONException;
import org.json.JSONObject;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

@WebServlet("/verify")
public class VerifyServlet  extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = session.getId();
        VerifyService service = new VerifyService();
        Object[] verifyCode = service.getVerifyCode();

        // 存入session
        session.setAttribute("SESSION_VERIFY_CODE_" + id, verifyCode[0]);
        System.out.println("[VerifyServlet genCode]" + verifyCode[0]);
        // 返回
        BufferedImage image = (BufferedImage) verifyCode[1];
        resp.setContentType("image/png");
        OutputStream os = resp.getOutputStream();
        ImageIO.write(image, "png", os);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = session.getId();
        try {
            Data data = Data.getPageParameters(req, resp);
            JSONObject resJson = new JSONObject();
            // 验证验证码
            String serverCode = (String) session.getAttribute("SESSION_VERIFY_CODE_" + id);
            VerifyService service = new VerifyService();
            service.checkCode(data, serverCode, resJson);
            // 返回
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(resJson);
        } catch (JSONException e) {
            throw new RuntimeException(e);
        }
    }
}
