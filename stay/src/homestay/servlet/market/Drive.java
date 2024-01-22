package homestay.servlet.market;

import homestay.dao.Data;
import homestay.service.market.DriveService;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/getDriveData")
public class Drive extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) {
        try {
            Data data = Data.getPageParameters(req, resp);
            String action = data.getParam().getString("action");
            JSONObject json = new JSONObject();
            DriveService ds=new DriveService();
            if(action.equals("sun"))
            {
                ds.getSunData(data,json);
            }

            resp.setContentType("application/json; charset=UTF-8");
            resp.getWriter().println(json);
        } catch (JSONException | IOException | SQLException e) {
            e.printStackTrace();
        }
    }
}
