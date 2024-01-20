package homestay.service.seller;

import homestay.dao.Data;
import homestay.dao.seller.HomestayDao;
import homestay.dao.seller.SpecialtyDao;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.sql.SQLException;

public class HomestayService {
    public void addHomestay(Data data, JSONObject json) throws JSONException, IOException {
        HomestayDao homestayDao = new HomestayDao();
        homestayDao.addHomestay(data, json);
    }

    public void getHomestay(Data data, JSONObject json) throws JSONException, SQLException {
        HomestayDao homestayDao = new HomestayDao();
        String house_id = data.getParam().has("house_id") ? data.getParam().getString("house_id") : "";
        if (house_id.isEmpty()) {
            homestayDao.getHomestayByOwner(data, json);
        } else {
            homestayDao.getHomestayById(house_id, json);
        }
    }

    public void modifyHomestay(Data data, JSONObject json) throws JSONException, IOException {
        HomestayDao homestayDao = new HomestayDao();
        homestayDao.modifyHomestay(data, json);
    }

    public void deleteHomestay(Data data, JSONObject json) throws JSONException {
        HomestayDao homestayDao = new HomestayDao();
        homestayDao.deleteHomestay(data, json);
    }

    public void getLocations(Data data, JSONObject json) throws JSONException, SQLException {
        HomestayDao dao = new HomestayDao();
        String house_name = data.getParam().getString("house_name");
        dao.getLocations(house_name, json);
    }

    public void getStatistics(Data data, JSONObject json) throws JSONException {
        HomestayDao dao = new HomestayDao();
        if (data.getParam().has("limit")) {
            dao.getTopSales(data, json);
        } else {
            String owner_id = data.getParam().getString("owner_id");
            dao.getTotalSalesInPastWeek(owner_id, json);
        }
    }
}
