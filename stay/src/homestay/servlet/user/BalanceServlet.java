package homestay.servlet.user;

import homestay.dao.Data;
import homestay.service.user.BalanceService;
import homestay.utils.UserUtil;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/balance")
public class BalanceServlet  extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = UserUtil.getUserId(req);
        try {
            Data data = Data.getPageParameters(req, resp);
            data.getParam().put("userId", userId);
            String action = data.getParam().getString("action");
            if(action.equals("recharge")) {
                doRecharge(req, resp, data);
            } else if(action.equals("payouts")) {
                doPayouts(req, resp, data);
            }
        } catch (JSONException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doRecharge(HttpServletRequest req, HttpServletResponse resp, Data data) throws IOException, SQLException, JSONException {
        JSONObject resJson = new JSONObject();  /* 响应数据 */
        BalanceService balanceService = new BalanceService();
        balanceService.recharge(data, resJson);
        // 返回
        resp.setContentType("application/json; charset=UTF-8");
        resp.getWriter().println(resJson);
    }

    protected void doPayouts(HttpServletRequest req, HttpServletResponse resp, Data data) throws IOException, JSONException {
        JSONObject resJson = new JSONObject();  /* 响应数据 */
        BalanceService balanceService = new BalanceService();
        balanceService.payouts(data, resJson);
        // 返回
        resp.setContentType("application/json; charset=UTF-8");
        resp.getWriter().println(resJson);
    }
}
