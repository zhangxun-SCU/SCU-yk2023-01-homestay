package homestay.dao.seller;

import homestay.dao.DB;
import homestay.dao.Data;
import org.json.JSONException;
import org.json.JSONObject;
import sun.misc.BASE64Decoder;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.sql.ResultSet;

public class SpecialtyDao {
    private static String IMAGE_DIR = "D:\\upload\\specialty_image\\";

    private void showDebug(String function, String message) {
        String log = "[SpecialtyDao]" + function + message;
        System.out.println(log);
    }

    private void base64ToImage(String b64_data, String filepath) throws IOException {
        BASE64Decoder decoder = new BASE64Decoder();
        //Base64解码
        byte[] buffer = new byte[0];
        try {
            buffer = decoder.decodeBuffer(b64_data);
            for (int i = 0; i < buffer.length; ++i) {
                if (buffer[i] < 0) {
                    //调整异常数据
                    buffer[i] += 256;
                }
            }
            OutputStream out = new FileOutputStream(filepath);
            out.write(buffer);
            out.flush();
            out.close();
            showDebug("[base64ToImage]", "image saved to " + filepath);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void addSpecialty(Data data, JSONObject json) throws JSONException, IOException {
        String resCode = "00000";
        String info = "success";
        DB db = new DB("group1");
        String username = data.getParam().has("username") ? data.getParam().getString("username") : "";
        // id: GoodsSpecialty + timestamp
        String specialty_id = "GS" + Long.toString(new Date().getTime());
        String specialty_name = data.getParam().getString("specialty_name");
        Double price = data.getParam().getDouble("price");
        int num = data.getParam().getInt("num");
        String imageurl = data.getParam().getString("imageurl");
        String imagePath = IMAGE_DIR + specialty_id + ".png";
        base64ToImage(imageurl, imagePath);
        imageurl = "/upload/specialty_image/" + specialty_id + ".png";
        String sql = "Insert Into specialty ";
        String values = String.format(
                "Values('%s', '%s', '%f', '%d', '%s', '%s')",
                specialty_id,
                specialty_name,
                price,
                num,
                username,
                imageurl
        );
        sql += values;
        showDebug("[addSpecialty]", "sql: " + sql);
        db.executeUpdate(sql);
        db.close();
        json.put("resCode", resCode);
        json.put("addSpecialtyInfo", info);
    }

    public void getSpecialtyByOwner(Data data, JSONObject json) throws JSONException, SQLException {
        String resCode = "00000";
        String info = "success";
        DB db = new DB("group1");
        String ownerId = data.getParam().getString("username");
        String sql = "Select * From specialty Where owner_id='" + ownerId + "'";
        showDebug("[getSpecialtyByOwner]", "sql: " + sql);
        ResultSet res = db.executeQuery(sql);
        ResultSetMetaData resMetaData = res.getMetaData();
        List resList = new ArrayList();
        int fieldCount = resMetaData.getColumnCount();
        while (res.next()) {
            Map map = new HashMap();
            for (int i = 0; i < fieldCount; i++) {
                String key = resMetaData.getColumnName(i + 1);
                String value = res.getString(key);
                map.put(key, value);
                showDebug("[getSpecialtyByOwner]", key + ": " + value);
            }
            resList.add(map);
        }
        res.close();
        db.close();
        json.put("resCode", resCode);
        json.put("getSpecialtyInfo", info);
        json.put("specialtyList", resList);
    }

    public void getSpecialtyById(String specialtyId, JSONObject json) throws JSONException, SQLException {
        String resCode = "00000";
        String info = "success";
        DB db = new DB("group1");
        String sql = "Select * From specialty Where specialty_id='" + specialtyId + "'";
        showDebug("[getSpecialtyById]", "sql: " + sql);
        ResultSet res = db.executeQuery(sql);
        ResultSetMetaData resMetadata = res.getMetaData();
        int fieldCount = resMetadata.getColumnCount();
        Map map = new HashMap();
        while (res.next()) {
            for (int i = 0; i < fieldCount; i++) {
                String key = resMetadata.getColumnName(i + 1);
                String value = res.getString(key);
                map.put(key, value);
                showDebug("[getSpecialtyById]", key + ": " + value);
            }
        }
        if (map.isEmpty()) {
            resCode = "GS002";
            info = "特产不存在";
        }
        res.close();
        db.close();
        json.put("resCode", resCode);
        json.put("getSpecialtyInfo", info);
        json.put("specialty", map);
    }

    public void modifySpecialty(Data data, JSONObject json) throws JSONException, SQLException, IOException {
        DB db = new DB("group1");
        String resCode = "00000";
        String info = "success";
        String specialtyId = data.getParam().getString("specialty_id");
        String specialtyName = data.getParam().getString("specialty_name");
        double price = data.getParam().getDouble("price");
        int num = data.getParam().getInt("num");
        String imageurl = data.getParam().getString("imageurl");
        String imagePath = IMAGE_DIR + specialtyId + ".png";
        base64ToImage(imageurl, imagePath);
        String sql = "Update specialty Set ";
        String values = String.format(
                "specialty_name='%s', price='%f', num='%d' Where specialty_id='%s'",
                specialtyName,
                price,
                num,
                specialtyId
        );
        sql += values;
        db.executeUpdate(sql);
        json.put("resCode", resCode);
        json.put("modifySpecialtyInfo", info);
    }

    public void deleteSpecialty(Data data, JSONObject json) throws JSONException, SQLException {
        DB db = new DB("group1");
        String resCode = "00000";
        String info = "success";
        if (data.getParam().has("specialty_id")) {
            String specialtyId = data.getParam().getString("specialty_id");
            String sql = "Delete From specialty Where specialty_id='" + specialtyId + "'";
            showDebug("[deleteSpecialty]", "sql: " + sql);
            db.executeUpdate(sql);
            String imagePath = IMAGE_DIR + specialtyId + ".png";
            File originImage = new File(imagePath);
            if (originImage.delete()) {
                showDebug("[deleteSpecialty]", "该商品图片已一同删除");
            }
        } else {
            resCode = "GS002";
            info = "特产不存在";
        }
        db.close();
        json.put("resCode", resCode);
        json.put("deleteSpecialtyInfo", info);
    }
}
