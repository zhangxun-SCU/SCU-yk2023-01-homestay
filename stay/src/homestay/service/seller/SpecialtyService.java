package homestay.service.seller;

import homestay.dao.Data;
import homestay.dao.seller.SpecialtyDao;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.sql.SQLException;

public class SpecialtyService {
    public void getSpecialty(Data data, JSONObject json) throws JSONException, SQLException {
        SpecialtyDao dao = new SpecialtyDao();
        if (!data.getParam().has("specialty_id")) {
            dao.getSpecialtyByOwner(data, json);
        } else {
            String speciltyId = data.getParam().getString("specialty_id");
            dao.getSpecialtyById(speciltyId, json);
        }
    }

    public void addSpecialty(Data data, JSONObject json) throws JSONException, IOException {
        SpecialtyDao dao = new SpecialtyDao();
        dao.addSpecialty(data, json);
    }

    public void modifySpeicialty(Data data, JSONObject json) throws SQLException, JSONException, IOException {
        SpecialtyDao dao = new SpecialtyDao();
        dao.modifySpecialty(data, json);
    }

    public void deleteSpecialty(Data data, JSONObject json) throws JSONException, SQLException {
        SpecialtyDao dao = new SpecialtyDao();
        dao.deleteSpecialty(data, json);
    }

    public void getStatistics(Data data, JSONObject json) throws JSONException {
        SpecialtyDao dao = new SpecialtyDao();
        if (data.getParam().has("limit")) {
            dao.getTopSales(data, json);
        } else {
            String owner_id = data.getParam().getString("owner_id");
            dao.getTotalSalesInPastWeek(owner_id, json);
        }
    }
}
