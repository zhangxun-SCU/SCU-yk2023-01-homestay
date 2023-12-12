package homestay.servlet.market;

import homestay.dao.Data;
import homestay.service.market.HouseMarketService;
import homestay.service.market.RoomService;
import homestay.service.market.SpecialtyMarketService;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet({"/getSpecialtyDetail","/getHouseDetail"})
public class GoodDetailServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            Data data = Data.getPageParameters(req, resp);

            JSONObject resJson = new JSONObject();  /* 响应数据 */
            String goodType = data.getParam().getString("good_type");
            String goodId=data.getParam().getString("good_id");
            if (goodType.equals("specialty")) {
                SpecialtyMarketService service=new SpecialtyMarketService();
                service.querySpecialtyById(goodId,resJson);
            }
            if(goodType.equals("house"))
            {
                HouseMarketService service=new HouseMarketService();
                service.queryHouseById(goodId,resJson);
                RoomService roms=new RoomService();
                roms.getRestNum(data,resJson);
            }
            else {

            }
            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(resJson);
        } catch (JSONException | IOException | SQLException e) {
            e.printStackTrace();
        }
    }


}
