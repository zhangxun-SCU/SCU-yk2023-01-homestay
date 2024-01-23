package homestay.service.seller;

import homestay.dao.Data;
import homestay.dao.seller.StatisticsDao;
import org.json.JSONException;
import org.json.JSONObject;

import java.sql.SQLException;

public class StatisticsService {
    public void getNewOrders(Data data, JSONObject json) throws SQLException, JSONException {
        StatisticsDao dao = new StatisticsDao();
        dao.getNewOrders(data, json);
    }

    public void getTotalStatistics(Data data, JSONObject json) throws SQLException, JSONException {
        StatisticsDao dao = new StatisticsDao();
        dao.getTotalStatistics(data, json);
    }

    public void getSalesComparison(Data data, JSONObject json) throws SQLException, JSONException {
        StatisticsDao dao = new StatisticsDao();
        dao.getSalesComparison(data, json);
    }
}
