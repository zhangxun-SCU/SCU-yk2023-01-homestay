package homestay.service.weather;

import homestay.dao.Data;
//import homestay.servlet.MyExcel;
import homestay.dao.weather.WeatherDao;
import org.json.JSONException;
import org.json.JSONObject;

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
    public void getDeviceRecordByorder(Data data, JSONObject json) throws JSONException, SQLException {
        WeatherDao dao = new WeatherDao();
        dao.getDeviceRecordByorder(data, json);
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
        System.out.println("[Service]addDeviceRecord");
        WeatherDao dao = new WeatherDao();
        dao.addDeviceRecord(data, json);
    }

    public void exportRecord(Data data, JSONObject json) throws JSONException, SQLException, IOException {
        WeatherDao dao = new WeatherDao();
        dao.getDeviceRecord(data, json);
        exportRecordToFile(data, json);
        // exportRecordToExcel(data, json);
    }

    private void exportRecordToFile(Data data, JSONObject json) throws JSONException {
        String jsonStr = json.toString();
        File jsonFile = new File("D:\\upload\\maintain\\weather\\export_weather.rar");
        json.put("download_url", "/upload/maintain/weather/export_weather.rar");
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

    public void getWeatherStatistics(Data data, JSONObject json) throws JSONException {
        WeatherDao dao = new WeatherDao();
        dao.getWeatherStatistics(data, json);
    }

//    private void exportRecordToExcel(Data data, JSONObject json) throws JSONException, IOException {
//        MyExcel myExcel = new MyExcel();
//        json.put("download_url", "/upload/maintain/device/export_device.xls");
//        json.put("file_path", "C:\\upload\\maintain\\device\\export_device.xls");
//        myExcel.exportData(data, json);
//    }
}
