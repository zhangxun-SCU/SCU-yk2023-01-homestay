package homestay.servlet.market;

import homestay.dao.Data;
import homestay.service.market.CartService;
import homestay.utils.UserUtil;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/getCartGood")
public class CartServlet  extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp){
        try {
            Data data= Data.getPageParameters(req,resp);
            String action=data.getParam().getString("action");
            JSONObject json=new JSONObject();
            CartService cs=new CartService();
            String user_id = UserUtil.getUserId(req);
            if(action.equals("query"))
            {
                cs.queryAllGood(json,user_id);
            }
            else if(action.equals("delete"))
            {
                cs.deleteCartGood(data,json,user_id);
            }
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(json);
        } catch (JSONException | IOException e) {
            e.printStackTrace();
        }

    }
}
