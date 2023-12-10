package homestay.servlet.market;

import homestay.dao.Data;
import homestay.service.market.HouseMarketOrderService;
import homestay.service.market.SpecialtyMarketOrderService;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/specialtyMarketOrder")
public class MarketOrderServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
    {
        try {
            Data data = Data.getPageParameters(req, resp);
            JSONObject resJson = new JSONObject();  /* 响应数据 */
            String goodType = data.getParam().getString("good_type");
            if (goodType.equals("specialty")) {
                querySpecialtyOrder(data,resJson);
            }
            if(goodType.equals("house"))
            {
                queryHouseOrder(data,resJson);
            }
            else {

            }
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(resJson);
        } catch (JSONException | IOException e) {
            e.printStackTrace();
        }
    }

    private void queryHouseOrder(Data data, JSONObject json) throws JSONException {
        HouseMarketOrderService sms=new HouseMarketOrderService();
        String action=data.getParam().getString("action");
        if(action.equals("query_by_list"))
        {
            sms.queryHouseOrderByList(data,json);
        }
    }

    public void querySpecialtyOrder(Data data, JSONObject json) throws JSONException {
        SpecialtyMarketOrderService sms=new SpecialtyMarketOrderService();
        String action=data.getParam().getString("action");
        if(action.equals("query_by_list"))
        {
            sms.querySpecialtyOrderByList(data,json);
        }

    }
}
