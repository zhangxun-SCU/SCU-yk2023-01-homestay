package homestay.servlet.market;

import homestay.dao.Data;
import homestay.service.market.HouseMarketService;
import homestay.service.market.SpecialtyMarketService;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet({"/specialtyMarket","/houseMarket"})
public class MarketServlet extends HttpServlet {
    @Override
    public  void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            Data data = Data.getPageParameters(req, resp);
            JSONObject resJson = new JSONObject();  /* 响应数据 */
            String goodType=data.getParam().getString("good_type");
            if(goodType.equals("specialty")){
                getSpecialtyMarketService(data,resJson);
            }

            if(goodType.equals("house")){
                getHouseMarketService(data,resJson);
            }
            else{
            }
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(resJson);
        } catch (JSONException | SQLException e) {
            e.printStackTrace();
        }
    }

    private void getHouseMarketService(Data data, JSONObject json) throws JSONException, SQLException {
        HouseMarketService sms=new HouseMarketService();
        String action=data.getParam().getString("action");
        if(action.equals("query_all"))
        {
            sms.queryAllHouse(data,json);
        }
        if(action.equals("query_by_name"))
        {
            sms.queryHouseByName(data,json);
        }
        if(action.equals("query_by_list"))
        {
            sms.queryHouseByList(data,json);
        }
    }

    public void getSpecialtyMarketService(Data data,JSONObject json) throws JSONException, SQLException {
        SpecialtyMarketService sms=new SpecialtyMarketService();
        String action=data.getParam().getString("action");
        if(action.equals("query_all"))
        {
            sms.queryAllSpecialty(data,json);
        }
        if(action.equals("query_by_name"))
        {
            sms.querySpecialtyByName(data,json);
        }
        if(action.equals("query_by_list"))
        {
            sms.querySpecialtyByList(data,json);
        }
    }
    }

