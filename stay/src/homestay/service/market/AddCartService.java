package homestay.service.market;
import homestay.dao.Data;
import homestay.utils.UserUtil;
import org.json.JSONException;
import org.json.JSONObject;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/addGood2Cart")
public class AddCartService extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
    {
        try {
            String user_id = UserUtil.getUserId(req);
            Data data= Data.getPageParameters(req, resp);
            JSONObject json=new JSONObject();
            CartService cs=new CartService();
            cs.addGood2Cart(data,json,user_id);
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(json);
        } catch (JSONException | IOException e) {
            e.printStackTrace();
        }

    }
}
