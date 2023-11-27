package homestay.service;

import homestay.dao.Data;
import homestay.dao.SpecialtyDao;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;

public class SpecialtyService {
    public void addSpecialty(Data data, JSONObject json) throws JSONException, IOException {
        SpecialtyDao dao = new SpecialtyDao();
        dao.addSpecialty(data);
        json.put("resCode", "00000");
        json.put("addSpecialtyInfo", "success");
    }

    public void modifySpeicialty(Data data, JSONObject json) {

    }

    public void deleteSpecialty(Data data, JSONObject json) {

    }
}
