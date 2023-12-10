package homestay.service;

import homestay.dao.Data;
import homestay.dao.WeatherDao;
import homestay.servlet.MyExcel;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.SQLException;

public class WeatherService {
    public void getDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException {
        WeatherDao dao = new WeatherDao();
        dao.getDeviceRecord(data, json);
    }

    public void modifyDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException {
        WeatherDao dao = new WeatherDao();
        dao.modifyDeviceRecord(data, json);
    }

    public void deleteDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException {
        WeatherDao dao = new WeatherDao();
        dao.deleteDeviceRecord(data, json);
    }

    public void addDeviceRecord(Data data, JSONObject json) throws JSONException, SQLException {
        WeatherDao dao = new WeatherDao();
        dao.addDeviceRecord(data, json);
    }
    public void exportRecord(Data data, JSONObject json) throws JSONException, SQLException, IOException {
        WeatherDao dao = new WeatherDao();
        dao.getDeviceRecord(data, json);
//        exportRecordToFile(data, json);
//        exportRecordToExcel(data, json);
    }
    private void exportRecordToFile(Data data, JSONObject json) throws JSONException {
        String jsonStr = json.toString();
        File jsonFile = new File("C:\\upload\\maintain\\device\\export_device.rar");
        json.put("download_url", "/upload/maintain/device/export_device.rar");
        try {
            if (!jsonFile.exists()) {
                jsonFile.createNewFile();
            }
            FileWriter fileWriter = new FileWriter(jsonFile.getAbsoluteFile());
            BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
            bufferedWriter.write(jsonStr);
            bufferedWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void exportRecordToExcel(Data data, JSONObject json) throws JSONException, IOException {
        MyExcel myExcel = new MyExcel();
        json.put("download_url", "/upload/maintain/device/export_device.xls");
        json.put("file_path", "C:\\upload\\maintain\\device\\export_device.xls");
        myExcel.exportData(data, json);
    }
}
