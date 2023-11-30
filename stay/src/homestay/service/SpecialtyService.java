package homestay.service;

import homestay.dao.Data;
import homestay.dao.SpecialtyDao;
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

    public void modifySpeicialty(Data data, JSONObject json) {

    }

    public void deleteSpecialty(Data data, JSONObject json) throws JSONException, SQLException {
        SpecialtyDao dao = new SpecialtyDao();
        dao.deleteSpecialty(data, json);
    }
}
