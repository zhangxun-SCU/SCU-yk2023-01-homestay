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
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class RoomDao {
    private static String IMAGE_DIR = "D:\\upload\\room_image\\";

    private void showDebug(String function, String message) {
        String log = "[RoomDao]" + function + message;
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


    public void addRoom(Data data, JSONObject json) throws JSONException, IOException {
        String resCode = "00000";
        String info = "success";
        DB db = new DB("group1");
        // Goods Room + timestamp
        String roomId = "GR" + Long.toString(new Date().getTime());
        String houseId = data.getParam().getString("house_id");
        String roomName = data.getParam().getString("room_name");
        double roomPrice = data.getParam().getDouble("room_price");
        int roomNum = data.getParam().getInt("room_num");
        String imageurl = data.getParam().getString("imageurl");
        String imagePath = IMAGE_DIR + roomId + ".png";
        base64ToImage(imageurl, imagePath);
        imageurl = "/upload/room_image/" + roomId + ".png";
        String sql = "Insert Into room ";
        String values = String.format(
                "Values('%s', '%s', '%s', '%d', '%f', '%s')",
                houseId,
                roomId,
                roomName,
                roomNum,
                roomPrice,
                imageurl
        );
        sql += values;
        showDebug("[addRoom]", "sql: " + sql);
        db.executeUpdate(sql);
        db.close();
        json.put("resCode", resCode);
        json.put("addRoomInfo", info);
    }

    public void getRoomByHouse(Data data, JSONObject json) throws JSONException, SQLException {
        String resCode = "00000";
        String info = "success";
        DB db = new DB("group1");
        String houseId = data.getParam().getString("house_id");
        String sql = "Select * From room Where house_id='" + houseId + "'";
        showDebug("[getRoomByHouse]", "sql: " + sql);
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
                showDebug("[getRoomByHouse]", key + ": " + value);
            }
            resList.add(map);
        }
        res.close();
        db.close();
        json.put("resCode", resCode);
        json.put("getRoomInfo", info);
        json.put("roomList", resList);
    }

    public void getRoomById(String houseId, String roomId, JSONObject json) throws JSONException, SQLException {
        String resCode = "00000";
        String info = "success";
        DB db = new DB("group1");
        String sql = "Select * From room Where house_id='" + houseId + "' And room_id='" + roomId + "'";
        showDebug("[getRoomById]", "sql: " + sql);
        ResultSet res = db.executeQuery(sql);
        ResultSetMetaData resMetadata = res.getMetaData();
        int fieldCount = resMetadata.getColumnCount();
        Map map = new HashMap();
        while (res.next()) {
            for (int i = 0; i < fieldCount; i++) {
                String key = resMetadata.getColumnName(i + 1);
                String value = res.getString(key);
                map.put(key, value);
                showDebug("[getRoomById]", key + ": " + value);
            }
        }
        if (map.isEmpty()) {
            resCode = "GR002";
            info = "房间不存在";
        }
        res.close();
        db.close();
        json.put("resCode", resCode);
        json.put("getRoomInfo", info);
        json.put("room", map);
    }

    public void modifyRoom(Data data, JSONObject json) throws JSONException, SQLException, IOException {
        DB db = new DB("group1");
        String resCode = "00000";
        String info = "success";
        String houseId = data.getParam().getString("house_id");
        String roomId = data.getParam().getString("room_id");
        String roomName = data.getParam().getString("room_name");
        Double roomPrice = data.getParam().getDouble("room_price");
        int roomNum = data.getParam().getInt("room_num");
        if (data.getParam().has("imageurl")) {
            String imageurl = data.getParam().getString("imageurl");
            String imagePath = IMAGE_DIR + roomId + ".png";
            base64ToImage(imageurl, imagePath);
        }
        String sql = "Update room Set ";
        String values = String.format(
                "room_name='%s', room_price='%f', room_num='%d' Where house_id='%s' And room_id='%s'",
                roomName,
                roomPrice,
                roomNum,
                houseId,
                roomId
        );
        sql += values;
        db.executeUpdate(sql);
        json.put("resCode", resCode);
        json.put("modifyRoomInfo", info);
    }

    public void deleteRoom(Data data, JSONObject json) throws JSONException, SQLException {
        DB db = new DB("group1");
        String resCode = "00000";
        String info = "success";
        if (data.getParam().has("house_id")) {
            String houseId = data.getParam().getString("house_id");
            if (data.getParam().has("room_id")) {
                String roomId = data.getParam().getString("room_id");
                String sql = "Delete From room Where house_id='" + houseId + "' And room_id='" + roomId + "'";
                showDebug("[deleteRoom]", "sql: " + sql);
                db.executeUpdate(sql);
                String imagePath = IMAGE_DIR + roomId + ".png";
                File originImage = new File(imagePath);
                if (originImage.delete()) {
                    showDebug("[deleteRoom]", "该房间图片已一同删除");
                }
            } else {
                resCode = "GR002";
                info = "房间不存在";
            }
        } else {
            resCode = "GR003";
            info = "请给出民宿ID";
        }
        db.close();
        json.put("resCode", resCode);
        json.put("deleteRoomInfo", info);
    }
}
