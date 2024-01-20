package homestay.service.seller;

import homestay.dao.Data;
import homestay.dao.seller.ExportDao;
import org.json.JSONObject;

public class ExportService {
    public void exportData(Data data, JSONObject json) {
        System.out.println("[ExportService][exportData]");
        ExportDao dao = new ExportDao();
        dao.exportData(data, json);
    }
}
