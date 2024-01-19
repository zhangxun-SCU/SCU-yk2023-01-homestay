package homestay.servlet.user;

import homestay.dao.Data;
import homestay.service.user.LandlordService;
import homestay.service.verify.VerifyService;
import homestay.utils.UserUtil;
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

@WebServlet("/landlord")
public class LandlordServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = session.getId();
        try {
            Data data = Data.getPageParameters(req, resp);
            data.getParam().put("userId", UserUtil.getUserId(req));
            JSONObject resJson = new JSONObject();  /* 响应数据 */
            VerifyService imgVerifyService = new VerifyService();
            LandlordService landlordService = new LandlordService();
            String serverImgVerifyCOde = (String) session.getAttribute("SESSION_VERIFY_CODE_" + id);
            if(imgVerifyService.checkCode(data, serverImgVerifyCOde, resJson)) {
                landlordService.beLandlord(data, resJson);
            }

            // 返回
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(resJson);
        } catch (JSONException | SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
