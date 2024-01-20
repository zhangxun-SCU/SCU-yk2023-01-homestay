package homestay.dao.seller;

import homestay.dao.DB;
import homestay.dao.Data;
import homestay.entity.Homestay;
import org.json.JSONException;
import org.json.JSONObject;
import sun.misc.BASE64Decoder;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.*;

public class HomestayDao {
    private static String IMAGE_DIR = "D:\\upload\\house_image\\";

    private void showDebug(String function, String message) {
        String log = "[HomestayDao]" + function + message;
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

    public void addHomestay(Data data, JSONObject json) throws JSONException, IOException {
        DB db = new DB("group1");
        String resCode = "00000";
        String info = "success";
        String owner = data.getParam().getString("username");
        String houseName = data.getParam().getString("house_name");
        double longitude = data.getParam().getDouble("longitude");
        double latitude = data.getParam().getDouble("latitude");
        String location = data.getParam().getString("location");
        // id = GoodsHomestay + timestamp
        String houseId = "GH" + Long.toString(new Date().getTime());
        String imageurl = data.getParam().getString("imageurl");
        String imagePath = IMAGE_DIR + houseId + ".png";
        base64ToImage(imageurl, imagePath);
        imageurl = "/upload/house_image/" + houseId + ".png";
        String sql = "Insert Into house ";
        String values = String.format("Values('%s', '%s', '%s', %f, %f, '%s', '%s')",
                houseId,
                houseName,
                owner,
                longitude,
                latitude,
                imageurl,
                location
        );
        sql += values;
        showDebug("[addHomestay]", "sql: " + sql);
        db.executeUpdate(sql);
        db.close();
        json.put("resCode", resCode);
        json.put("addHomestayInfo", info);
    }

    public void getHomestayByOwner(Data data, JSONObject json) throws JSONException, SQLException {
        String resCode = "00000";
        String info = "success";
        DB db = new DB("group1");
        String ownerId = data.getParam().getString("username");
        String sql = "Select * From house Where owner_id='" + ownerId + "'";
        showDebug("[getHomestayByOwner]", "sql: " + sql);
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
                showDebug("[getHomestayByOwner]", key + ": " + value);
            }
            resList.add(map);
        }
        res.close();
        db.close();
        json.put("resCode", resCode);
        json.put("getHomestayInfo", info);
        json.put("houseList", resList);
    }

    public void getHomestayById(String houseId, JSONObject json) throws JSONException, SQLException {
        String resCode = "00000";
        String info = "success";
        DB db = new DB("group1");
        String sql = "Select * From house Where house_id='" + houseId + "'";
        showDebug("[getHomestayById]", "sql: " + sql);
        ResultSet res = db.executeQuery(sql);
        ResultSetMetaData resMetadata = res.getMetaData();
        int fieldCount = resMetadata.getColumnCount();
        Map map = new HashMap();
        while (res.next()) {
            for (int i = 0; i < fieldCount; i++) {
                String key = resMetadata.getColumnName(i + 1);
                String value = res.getString(key);
                map.put(key, value);
                showDebug("[getHomestayById]", key + ": " + value);
            }
        }
        if (map.isEmpty()) {
            resCode = "GH002";
            info = "民宿不存在";
        }
        res.close();
        db.close();
        json.put("resCode", resCode);
        json.put("getHomestayInfo", info);
        json.put("house", map);
    }

    public void modifyHomestay(Data data, JSONObject json) throws JSONException, IOException {
        DB db = new DB("group1");
        String resCode = "00000";
        String info = "success";
        String houseId = data.getParam().getString("house_id");
        String houseName = data.getParam().getString("house_name");
        double longitude = data.getParam().getDouble("longitude");
        double latitude = data.getParam().getDouble("latitude");
        String houseLocation = data.getParam().getString("location");
        if (data.getParam().has("imageurl")) {
            String imageurl = data.getParam().getString("imageurl");
            String imagePath = IMAGE_DIR + houseId + ".png";
            base64ToImage(imageurl, imagePath);
        }
        String sql = "Update house Set ";
        String values = String.format(
                "house_name='%s', longitude='%f', latitude='%f', location='%s' Where house_id='%s'",
                houseName,
                longitude,
                latitude,
                houseLocation,
                houseId
        );
        sql += values;
        db.executeUpdate(sql);
        json.put("resCode", resCode);
        json.put("modifyHomestayInfo", info);
    }

    public void deleteHomestay(Data data, JSONObject json) throws JSONException {
        DB db = new DB("group1");
        String resCode = "00000";
        String info = "success";
        if (data.getParam().has("house_id")) {
            String houseId = data.getParam().getString("house_id");
            String imagePath = IMAGE_DIR + houseId + ".png";
            File houseImage = new File(imagePath);
            if (houseImage.delete()) {
                showDebug("[deleteHomestay]", "该民宿图片已一同删除");
            }
            String sql = String.format("Delete From house Where house_id='%s'", houseId);
            showDebug("[deleteHomestay]", "sql: " + sql);
            db.executeUpdate(sql);
            db.close();
        } else {
            resCode = "GH002";
            info = "民宿不存在";
        }
        json.put("resCode", resCode);
        json.put("deleteHomestayInfo", info);
    }

    public Homestay queryHomestayById(String homestayId) throws SQLException {
        DB db = new DB("group1");
        String sql = "Select * From house Where house_id='" + homestayId + "'";
        showDebug("[queryHomestayById]", "sql: " + sql);
        ResultSet res = db.executeQuery(sql);
        Homestay homestay = new Homestay();
        while (res.next()) {
            homestay.house_id = res.getString("house_id");
            homestay.house_name = res.getString("house_name");
            homestay.owner_id = res.getString("owner_id");
            homestay.latitude = res.getDouble("latitude");
            homestay.longitude = res.getDouble("longitude");
            homestay.imageurl = res.getString("imageurl");
            homestay.location = res.getString("location");
        }
        res.close();
        db.close();
        return homestay;
    }

    public void getLocations(String house_name, JSONObject json) {
        String resCode = "00000";
        String info = "success";
        DB db = new DB("group1");
        String sql = String.format(
                "Select * From house Where house_name Like '%%%s%%'",
                house_name
        );
        showDebug("[getLocations]", "sql: " + sql);
        try {
            ResultSet res = db.executeQuery(sql);
            ResultSetMetaData resMetaData = res.getMetaData();
            int fieldCount = resMetaData.getColumnCount();
            List list = new ArrayList();
            while (res.next()) {
                HashMap map = new HashMap();
                for (int i = 0; i < fieldCount; i++) {
                    String key = resMetaData.getColumnName(i + 1);
                    String value = res.getString(key);
                    map.put(key, value);
                }
                list.add(map);
            }
            json.put("resCode", resCode);
            json.put("getLocationInfo", info);
            json.put("house_locations", list);
        } catch (SQLException | JSONException e) {
            e.printStackTrace();
        }
    }

    public void getTotalSalesInPastWeek(String owner_id, JSONObject json) {
        DB db = new DB("group1");
        String resCode = "00000";
        String info = "success";
        try {
            String sql = String.format(
                    "Select SUM(num) As total_sale, DATE(create_date) As date " +
                            "From (Select deal_order.num, deal_order.create_date " +
                            "From deal_order " +
                            "Join room_occupy On deal_order.good_id=room_occupy.op_id " +
                            "Join room Using(house_id, room_id) " +
                            "Join house Using(house_id) " +
                            "Where house.owner_id='%s' And deal_order.order_status=1) A " +
                            "Where create_date Between DATE_SUB(NOW(), Interval 7 day) And NOW() Group By date Order By date ASC;",
                    owner_id
            );
            showDebug("[getTotalSalesInPastWeek]", "sql: " + sql);
            ResultSet res = db.executeQuery(sql);
            ResultSetMetaData resMetaData = res.getMetaData();
            List list = new ArrayList();
            while (res.next()) {
                HashMap map = new HashMap();
                map.put("total_sale", res.getInt("total_sale"));
                map.put("date", res.getString("date"));
                list.add(map);
            }
            res.close();
            db.close();
            json.put("resCode", resCode);
            json.put("getTotalSalesInfo", info);
            json.put("sales", list);
        } catch (SQLException | JSONException e) {
            e.printStackTrace();
        }
    }

    public void getTopSales(Data data, JSONObject json) {
        DB db = new DB("group1");
        String resCode = "00000";
        String info = "success";
        try {
            String owner_id = data.getParam().getString("owner_id");
            int limit = data.getParam().getInt("limit");
            String sql = String.format(
                    "Select house_id, house_name, SUM(num) As total_sale " +
                            "From (Select house.house_id, house.house_name, deal_order.num " +
                            "From deal_order " +
                            "Join room_occupy On deal_order.good_id=room_occupy.op_id " +
                            "Join room Using(house_id, room_id) " +
                            "Join house Using(house_id) " +
                            "Where house.owner_id='%s' And deal_order.order_status=1) A Group By house_id Order By total_sale DESC Limit %d;",
                    owner_id,
                    limit
            );
            showDebug("[getTopSales]", "sql: " + sql);
            ResultSet res = db.executeQuery(sql);
            ResultSetMetaData resMetaData = res.getMetaData();
            List list = new ArrayList();
            while (res.next()) {
                HashMap map = new HashMap();
                map.put("id", res.getString("house_id"));
                map.put("name", res.getString("house_name"));
                map.put("total_sale", res.getInt("total_sale"));
                list.add(map);
            }
            res.close();
            db.close();
            json.put("resCode", resCode);
            json.put("getTopSalesInfo", info);
            json.put("sales", list);
        } catch (SQLException | JSONException e) {
            e.printStackTrace();
        }
    }
}
