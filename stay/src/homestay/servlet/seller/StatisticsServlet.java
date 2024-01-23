package homestay.servlet.seller;

import homestay.dao.Data;
import homestay.service.seller.StatisticsService;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/seller_statistics")
public class StatisticsServlet extends HttpServlet {
    private Data data = null;

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        try {
            data = Data.getPageParameters(request, response);
            JSONObject json = new JSONObject();
            String action = data.getParam().getString("action");
            StatisticsService statisticsService = new StatisticsService();
            if (action.equals("get_new_orders")) {
                statisticsService.getNewOrders(data, json);
            } else if (action.equals("get_total_statistics")) {
                statisticsService.getTotalStatistics(data, json);
            } else if (action.equals("get_sales_comparison")) {
                statisticsService.getSalesComparison(data, json);
            }
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().println(json);
        } catch (SQLException | JSONException | IOException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
